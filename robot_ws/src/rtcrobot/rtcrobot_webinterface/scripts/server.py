#!/usr/bin/env python

import rospkg
import rospy
import json
import os
import shutil
import glob
import base64
import yaml
import ruamel.yaml
import subprocess
import roslaunch
import shutil
from datetime import datetime
connections=[]

from tornado import web, ioloop, websocket, escape

import rtcrobot_webinterface.maps as maps
from rtcrobot_msgs.msg import RobotMode
from rtcrobot_services.srv import SaveMap



clientlist_ =[]
mapspath_ = rospkg.RosPack().get_path('rtcrobot_navigation')+'/maps'

class BaseHandler(web.RequestHandler):
    """
    Base handler gonna to be used instead of RequestHandler
    """
    def write_error(self, status_code, **kwargs):
        if status_code in [403, 404, 500, 503]:
            self.write('Error %s' % status_code)
        else:
            self.write('BOOM!')


class MainHandler(BaseHandler):
    def get(self):
        self.render('../www/index.html')

class MapsHandler(web.RequestHandler):
    def get(self):
        map = maps.Maps.getmaps()
        self.render('../www/maps.html', maps = map)

class MappingHandler(web.RequestHandler):
    def get(self):
        pub_mode = rospy.Publisher('robot_mode', RobotMode, queue_size=10)
        msg = RobotMode()
        msg.name = 'mapping'
        msg.code = 1
        msg.parameters.append("map_size:="+self.get_argument("mapsize"))
        pub_mode.publish(msg)
        self.render('../www/mapping.html')
    
    def post(self):
        info = {
            'name': self.get_argument('mapname')
        }
        self.render('../www/mapping.html', info = info)


class MapEdit(web.RequestHandler):
    def get(self):
        
        
        # thieu kiem tra ten folder co ton tai hay ko
        #source_dir = rospkg.RosPack().get_path('rtcrobot_navigation') + '/maps/' +self.get_argument('map')
        #dataFile = open(source_dir + '/data.dat', 'r+')
        
        
        #for filename in glob.glob(os.path.join(source_dir, '*.png')):
        #    shutil.copy(filename,rospkg.RosPack().get_path('rtcrobot_webinterface')+ '/www/assets/img/maps/editting/'+ os.path.basename(filename))

        self.render('../www/mapedit.html')
    
    def post(self):
        """Example handle ajax post"""
        dic = escape.json_decode(self.request.body)
        saveEditor(dic)
        # useful code goes here
        self.write(json.dumps({'status': 'ok', 'sent': dic}))
        self.finish()

def saveEditor(data):
    path = os.path.join(mapspath_,data['name'])
    dataFile = open(path + '/data.dat', 'w+')
    json.dump(data,dataFile)
    dataFile.close()
    
    if('navData' in data):
        imgFile = open(path + '/navigation.png', 'w+')
        imgFile.write(base64.standard_b64decode(data['navData']))
        imgFile.close()

    if('wallData' in data):
        imgFile = open(path + '/wall.png', 'w+')
        imgFile.write(base64.standard_b64decode(data['wallData']['imgdata']))
        imgFile.close()
    pass

class ErrorHandler(web.ErrorHandler, BaseHandler):
    """
    Default handler gonna to be used in case of 404 error
    """
    pass


class MissionsHandler(web.RequestHandler):
    def get(self):

         self.render('../www/mission.html')


class editmissionsHandler(web.RequestHandler):
    def get(self):
        self.render('../www/editmission-1.html')


class SocketHandler(websocket.WebSocketHandler):
    def check_origin(self, origin):
        print origin
        return True

    def on_message(self, message):
        data = json.loads(message)
        if(data["name"] == 'COMMAND'):
            for cmd in data["command"]:
                if cmd["command"] == 'CMD_SAVEMAP' :
                    callsavemapsevice(cmd["mapname"])
                    print 'HAHA'
                if cmd["command"] == 'CMD_DELMAP' :
                    deletemap(cmd["mapname"])
                    print 'BABA'
                pass
        #self.write_message(u"You said: " + message)
class name_mission(websocket.WebSocketHandler): 
    def check_origin(self, origin):
        return True


    def open(self):
         connections.append(self)
         print("WebSocket opened")

    def on_message(self, message):

        print 'message received %s' % message  # recive
        # open file json
        data = json.loads(message)  # convert to string
        length = len(data)
        file_path="json/mission.json"
        path="/home/mtk/catkin_ws/src/web/json/mission.json"

        file_mission = open(path, "r")  # open file
        read_file = file_mission.readline()
        convert = json.loads(read_file) # convert string to json 
        list_mission = convert["list"]
        length = len(list_mission)
        path1="/home/mtk/catkin_ws/src/web/json/run_mission.json"
        

#***************************************************************************
                         # CREAT NEWMISSION 
#***************************************************************************

        if(data["command"] == "creat_mission"):  # tao mission moi

            print("creat_mission")
            tem = 0
            send_err = {"type": "err_save_mission",
                    "pose_name": []}
           
            for x in range(length):
                if(list_mission[x]["name_mission"] == data["name_mission"]):
                    self.write_message(send_err)
                    tem = 1
            if(tem != 1):
                list_mission.insert(length, data)
                send_web= json.dumps(convert)
                # send_web=json.dumps(convert)
                self.write_message(send_web)
                save = open(path, "w+")  # open file
                save.write(send_web)
                name = data["name_mission"]+".py"

                # creat mission.py
                new_file_mission = open(name.replace(" ", "_"), "a")  # creat fine
                shutil.move(name.replace(" ", "_"), '/home/mtk/catkin_ws/src/web/call_mission/'+name.replace(" ", "_"))



#***************************************************************************
                         # Display mission on page list mission 
#***************************************************************************


        if(data["command"] == "list_mission"):  # display list mission for page mission
            print("list_mission")
            for x in range(length):
                # update status=0, edit_mission=false
                convert['list'][x].update({"status": 0})

            save = open(path, "w+")
            send_web = json.dumps(convert)
            save.write(send_web)
            self.write_message(send_web)


#***************************************************************************
                    #edit Mission 
#***************************************************************************

        if(data["command"] == "edit_mission"):  # edit mission
            print("edit_mission")
            #y = json.dumps(f)
            for x in range(length):
                name_mission = list_mission[x]["name_mission"]
                if(name_mission == data["name"]):
                    status = list_mission[x]
                    # status3.update({"command":"l"})
                    status.update({"status": 1})
                    save_status = json.dumps(convert)
                    save = open(path, "w+")  # open file
                    save.write(save_status)


#***************************************************************************
           
#***************************************************************************

        if(data["command"] == "display_mission"):
            print("display_mission")
            for x in range(length):
                status = list_mission[x]["status"]
                if(status == 1):
                    print list_mission[x]
                    send_web = json.dumps(list_mission[x])
                    self.write_message(send_web)

            #    # display action move
            f1 = open("/home/mtk/catkin_ws/src/robot_ws/src/rtcrobot/rtcrobot_navigation/maps/HShop/data.dat", "r")  # open file
            read_data = f1.readline()
            convert_data = json.loads(read_data)
            length_data = len(convert_data['zoneData'])
            data_zone = convert_data['zoneData']
            print data_zone
            pose = {"type": "display_pose_move",
                    "pose_name": []}
            list_map={
                "type":"display_list_map",
                "list_map":maps.Maps.getmaps(),
            }

            for x in range(length_data):
                name_pose = data_zone[x]["settings"]
                if(data_zone[x]['layer'] == 12):
                    pose["pose_name"].insert(0, name_pose)

            send_pose = json.dumps(pose)
            send_map = json.dumps(list_map)
            print send_map
            self.write_message(send_pose)
            self.write_message(send_map)


#***************************************************************************
#***************************************************************************

        if(data["command"] == "save_mission"):
            print("save_mission")
            for x in range(length):
                status = list_mission[x]["status"]
                if(status == 1):
                    list_mission.pop(x)
                    list_mission.append(data)
                    save_edit = json.dumps(convert)

                    save = open(path, "w")  # open file
                    save.write(save_edit)
                    name_mission = data['name_mission']

                    name = data["name_mission"]+".py"

                    # creat mission.py
                    new_file_mission = open(
                        '/home/mtk/catkin_ws/src/web/call_mission/'+name.replace(" ", "_"), "w")  # creat fine
                    new_file_mission.write(
                        "#!/usr/bin/env python\n#")  # duong dan
                    new_file_mission.write(message + "\n #")
                    t = time.localtime()
                    current_time = time.strftime("%H:%M:%S", t)
                    new_file_mission.write(current_time+"\n")
                    new_file_mission.write(
                        "import rospkg\nimport rospy\nimport rtcrobot_actions\n\n")
                    init_node = "rospy.init_node('" + \
                        name_mission.replace(" ", "_")+"')\n\n"

                    new_file_mission.write(init_node)
                    new_file_mission.write("main():\n")
                    length = len(data["action"])
                    for x in range(length):

                        type_action = data['action'][x]

                        if(type_action["type"] == "Move"):
                            line1 = "  move = rtcrobot_actions.Move(" + str(type_action["x"]) + "," + str(
                                type_action["y"]) + "," + str(type_action["theta"]) + ")"
                            line2 = "  move.goal()"
                            line3 = "  while(not move_state):"
                            line4 = "     pass"

                            new_file_mission.write(
                                line1+"\n"+line2+"\n"+line3+"\n"+line4+"\n")

                        if(type_action["type"] == "Charging"):
                            line1 = "  Charge = rtcrobot_actions.Charge(" + \
                                type_action["Min_time"] + ")"

                            new_file_mission.write(line1+"\n")

            loop = "if __name__ ==" + '"__main__"' + ":\n"
            new_file_mission.write(loop)


#***************************************************************************
                 # xoa missin
#***************************************************************************

        if(data["command"] == "remove_mission"):
            print("remove_mission")
           
        
            for x in range(length):
                if(status == data['name']):
                    list_mission.pop(x)
                    save_edit = json.dumps(convert)
                    print save_edit
                    save = open(path, "w")  # open file
                    save.write(save_edit)
            file_remove = data['name']+'.py'
            os.remove('/home/mtk/catkin_ws/src/web/call_mission/'+file_remove)

#***************************************************************************
                           # display list parameter
#***************************************************************************

        
        if(data["command"] =="setting"):
                file_path="/home/mtk/catkin_ws/src/robot_ws/src/rtcrobot/rtcrobot_navigation/config/vd.yaml"
                with open(file_path) as f:
                    doc = yaml.load(f)
                send_web = json.dumps(doc)
                self.write_message(send_web)

#***************************************************************************
                           # save 
#***************************************************************************
        if(data["command"] =="save_setting"):
                file_path="/home/mtk/catkin_ws/src/robot_ws/src/rtcrobot/rtcrobot_navigation/config/vd.yaml"
                with open(file_path) as f:  # load file yaml
                    doc = yaml.load(f)
                lon=data['paramerter']
                lon2=lon['DWBLocalPlanner']
                for x in range(len(data['paramerter']['DWBLocalPlanner'])):
                  doc['DWBLocalPlanner'][list(lon2)[x]]=list(lon2.values())[x]


                with open(file_path, 'w') as f:
                    yaml.dump(doc, f)

                uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
                roslaunch.configure_logging(uuid)
                launch = roslaunch.parent.ROSLaunchParent(uuid, ["/home/mtk/catkin_ws/src/robot_ws/src/rtcrobot/rtcrobot_navigation/launch/move_base.launch"])
                launch.shutdown()
                #rospy.sleep(10)
                launch.start()
                rospy.loginfo("started")

                #rospy.sleep(3)

    def on_close(self):
        print("WebSocket closed")
        connections.remove(self)

class AjaxHandler(web.RequestHandler):
    """Simple, ajax handler"""
    def get(self, *args, **kwargs):
        """get unlikely to be used for ajax"""
        self.write("Not allowed")
        self.finish()

    def post(self, *args):
        """Example handle ajax post"""
        mapname = self.get_argument('map')
        path = rospkg.RosPack().get_path('rtcrobot_navigation') + '/maps/' + mapname
        if(os.path.isdir(path)):
            if(os.path.exists(path + '/data.dat')):
                dataFile = open(path + '/data.dat', 'r+')
                # useful code goes here
                self.write(dataFile.read())
                self.finish()
            else:
                imgFile = open(path + '/navigation.png', 'r+')
                navdata =  base64.standard_b64encode(imgFile.read())
                data = {
                    'navData': navdata,
                    'wallData': {
                            'pointdata': []
                        },
                    'zoneData': []
                }
                self.write(json.dumps(data))
        else:
            self.write_error(404)
        #self.finish()

    
def make_app():
    
    rospack = rospkg.RosPack()
    settings = {
    'default_handler_class': ErrorHandler,
    'default_handler_args': dict(status_code=404)
    }
    return web.Application([
        web.url(r"/", MainHandler),
        web.url(r"/ws", SocketHandler),
        web.url(r"/maps.html", MapsHandler),
        web.url(r"/mapping.html", MappingHandler),
        web.url(r"/mapedit.html", MapEdit),
        web.url(r"/mission",MissionsHandler),
        web.url(r"/editmission",editmissionsHandler),
        web.url(r"/(ajax)$", AjaxHandler),
         web.url(r"/name_mission", name_mission),
        web.url(r"/(.*)", web.StaticFileHandler, {'path': rospack.get_path('rtcrobot_webinterface')+'/www/'}),
    ], **settings)

def spin():
    try:
        app = make_app()
        app.listen(8888)
        ioloop.IOLoop.instance().start()
    except Exception as exc:
        pass

def callsavemapsevice(name):
    rospy.wait_for_service('/roboot_services/savemap')
    try:
        sv_savemap = rospy.ServiceProxy('/roboot_services/savemap', SaveMap)
        resp = sv_savemap(name,"Create a map")
        #return resp
    except rospy.ServiceException, e:
        print "Service call failed: %s"%e

def deletemap(name):
    rospack = rospkg.RosPack()
    dir = rospack.get_path('rtcrobot_navigation') + '/maps/' + name
    shutil.rmtree(dir)
    pass

if __name__ == "__main__":
    #rospy.init_node('webserver', anonymous=True)
    spin()
    