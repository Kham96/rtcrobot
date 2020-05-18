#!/usr/bin/env python

import logging
import rospy
import roslib
import rospkg
import socket
import tornado.ioloop  # rosbridge installs tornado
import tornado.web
import tornado.options
import os.path
import tornado.httpserver
from tornado.options import define, options

class RTCServer():
    def __init__(self, name, webpath, ports, cached):
        '''
          :param str name: webserver name
          :param str webpath: package relative path to web page source.
          :param tuple ports: ports to use in webserver. Provides default and scan range (default, start, end)
        '''
        self._name = name
        self._webpath = webpath
        self._ports = ports
        self._cached = cached
        self._logger = self._set_logger()
        self._application = self._create_webserver()

    def _create_webserver(self):
        class BaseHandler(tornado.web.RequestHandler):
            def get_current_user(self):
                return self.get_secure_cookie("email")
        
        class MainHandler(BaseHandler):
            @tornado.web.authenticated
            def get(self):
                self.render('index.html')

        class LoginHandler(BaseHandler):
            @tornado.gen.coroutine
            def get(self):
                incorrect = self.get_secure_cookie("incorrect")
                if incorrect and int(incorrect) > 20:
                    self.write('<center>blocked</center>')
                    return
                self.render('login.html')

            @tornado.gen.coroutine
            def post(self):
                incorrect = self.get_secure_cookie("incorrect")
                if incorrect and int(incorrect) > 20:
                    self.write('<center>blocked</center>')
                    return
                
                getemail= tornado.escape.xhtml_escape(self.get_argument("email"))
                getpassword = tornado.escape.xhtml_escape(self.get_argument("password"))
                
                if "admin@rtcrobot.com" == getemail and "admin" == getpassword:
                    self.set_secure_cookie("email", self.get_argument("email"))
                    self.set_secure_cookie("incorrect", "0")
                    self.redirect(self.reverse_url("main"))
                else:
                    incorrect = self.get_secure_cookie("incorrect") or 0
                    increased = str(int(incorrect)+1)
                    self.set_secure_cookie("incorrect", increased)
                    self.write("""<center>
                                    Something Wrong With Your Data (%s)<br />
                                    <a href="/">Go Home</a>
                                </center>""" % increased)

        class LogoutHandler(BaseHandler):
            def get(self):
                self.clear_cookie("email")
                self.redirect(self.get_argument("next", self.reverse_url("login")))

        class FileHandler(BaseHandler):
            @tornado.web.authenticated
            def get(self,data):
                self.render(data)

        class NoCacheStaticFileHandler(tornado.web.StaticFileHandler):
            def set_extra_headers(self, path):
                self.set_header('Cache-Control', 'no-store, no-cache, must-revalidate, max-age=0')

        file_handler = tornado.web.StaticFileHandler if self._cached else NoCacheStaticFileHandler
                

        base_dir = os.path.dirname(__file__)
        settings = {
            "cookie_secret": "bZJc2sWbQLKos6GkHn/VB9oXwQt8S0R0kRvJ5/xJ89E=",
            "login_url": "/login",
            'template_path': os.path.join(base_dir, "../../www"),
            'static_path': os.path.join(base_dir, "static"),
            'debug':False,
            "xsrf_cookies": True,
        }
        
        rospack = rospkg.RosPack()
        return tornado.web.Application([
            tornado.web.url(r"/", MainHandler, name="main"),
            tornado.web.url(r'/login', LoginHandler, name="login"),
            tornado.web.url(r'/logout', LogoutHandler, name="logout"),
            tornado.web.url(r'/js/(.*)', tornado.web.StaticFileHandler, {'path': rospack.get_path('rtcrobot')+ "/" + self._webpath + '/js'}),
            tornado.web.url(r'/css/(.*)', tornado.web.StaticFileHandler, {'path': rospack.get_path('rtcrobot')+ "/" + self._webpath +'/css'}),
            tornado.web.url(r'/img/(.*)', tornado.web.StaticFileHandler, {'path': rospack.get_path('rtcrobot')+ "/" + self._webpath +'/img'}),
            tornado.web.url(r'/vendor/(.*)', tornado.web.StaticFileHandler, {'path': rospack.get_path('rtcrobot')+ "/" + self._webpath +'/vendor'}),
            tornado.web.url(r'/scss/(.*)', tornado.web.StaticFileHandler, {'path': rospack.get_path('rtcrobot')+ "/" + self._webpath +'/scss'}),
            #tornado.web.url(r"/(style\.css)",tornado.web.StaticFileHandler, {"path": "./css/"}),
            #tornado.web.url(r"/(script\.js)",tornado.web.StaticFileHandler, {"path": "./js/"}),
            tornado.web.url("/(.*)",FileHandler, name="filehandle")
            #tornado.web.url("/(.*)",file_handler,{"path": rospack.get_path('rtcrobot')+ "/" + self._webpath,"default_filename": "index.html"})
            #tornado.web.url(r'/logout', LogoutHandler, name="logout"),
        ], **settings)

    def _bind_webserver(self):
        default, start, end = self._ports

        """ First, we try the default http port """
        bound = self._bind_to_port(self._application, default)
        if not bound:
            """ Otherwise bind any available port within the specified range """
            bound = self._bind_in_range(self._application, start, end)
        return True

    def _bind_in_range(self, application, start_port, end_port):
        if (end_port > start_port):
            for i in range(start_port, end_port):
                if self._bind_to_port(application, i):
                    return True
        return False

    def _bind_to_port(self, application, portno):
        try:
            application.listen(portno)
        except socket.error as err:
            # Socket exceptions get handled, all other exceptions propagated
            if err.errno == 13:
                rospy.logwarn("Insufficient priveliges to run webserver " +
                              "on port %s. Error: %s"%(portno, err.strerror))
                rospy.loginfo("-- Try re-running as super-user: sudo su; " +
                              "source ~/.bashrc)")
            elif err.errno == 98:
                rospy.logwarn("There is already a webserver running on port %s. " +
                              "Error: %s"%(portno, err.strerror))
                rospy.loginfo("-- Try stopping your web server. For example, " +
                              "to stop apache: sudo /etc/init.d/apache2 stop")
            else:
                rospy.logerr("An error occurred attempting to listen on " +
                             "port %s: %s"%(portno, err.strerror))
            return False
        return True

    def _start_webserver(self):
        try:
            tornado.ioloop.IOLoop.instance().start()
        except KeyboardInterrupt:
            rospy.loginfo("Webserver shutting down")

    def spin(self):
        try:
            bound = self._bind_webserver()
            if bound:
                self._start_webserver()
            else:
                raise Exception()
        except Exception as exc:
            rospy.logerr("Unable to bind webserver.  Exiting.  %s" % exc)

    def _set_logger(self):
        logger = logging.getLogger('rtcrobot')
        logger.setLevel(logging.DEBUG)

        # create console handler and set level to debug
        ch = logging.StreamHandler()
        ch.setLevel(logging.DEBUG)

        # create formatter
        formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')

        # add formatter to ch
        ch.setFormatter(formatter)

        # add ch to logger
        logger.addHandler(ch)

        return logger