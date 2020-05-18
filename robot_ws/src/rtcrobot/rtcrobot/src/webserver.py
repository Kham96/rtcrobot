#!/usr/bin/env python

import argparse
import rtcweb
import rospy


def parse_argument(argv):
    """
    argument parser for rtcrobot configuration
    """
    parser = argparse.ArgumentParser(description="rtcrobot")
    parser.add_argument('-n', '--name', default=rospy.get_name(), help='Webserver name')
    parser.add_argument('-p', '--port', default=80, type=int, help='Webserver Port number')
    parser.add_argument('-w', '--webpath', default='www', help='package relative path to web pages')
    parser.add_argument('--cached', default='true', help='static file is cached')
    parser.add_argument('--start_port', default=8000, type=int, help='setting up port scan range')
    parser.add_argument('--end_port', default=9000, type=int, help='setting up port scan range')

    parsed_args = parser.parse_args(argv)
    cached = False if parsed_args.cached in [0, False, 'false', 'False'] else True
    return parsed_args.name, parsed_args.webpath, (parsed_args.port, parsed_args.start_port, parsed_args.end_port), cached


if __name__ == '__main__':
    rospy.init_node("webserver", disable_signals=True)
    name, webpath, port, cached = parse_argument(rospy.myargv()[1:])
    webserver = rtcweb.RTCServer (name, webpath, port, cached)
    webserver.spin()
