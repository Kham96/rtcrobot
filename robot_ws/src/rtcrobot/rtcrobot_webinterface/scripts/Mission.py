
import rospkg
import json
import rospy
from tornado import web, ioloop, websocket
from datetime import datetime
import time
import os
connections=[]
import os
import shutil
import rtcrobot_webinterface.maps as maps
import os
import subprocess
import roslaunch
import yaml
import ruamel.yaml



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
        path1="/home/mtk/catkin_ws/src/web/json/run_mission.json"
        

#***************************************************************************
                         # CREAT NEWMISSION 
#***************************************************************************

        if(data["command"] == "creat_mission"):  # tao mission moi

            print("creat_mission")
            tem = 0
            f = open(path, "r")  # open file
            read1 = f.readline()
            convert1 = json.loads(read1)
            list_mission1 = convert1["list"]
            length1 = len(list_mission1)
            
            for x in range(length1):
                if(list_mission1[x]["name_mission"] == data["name_mission"]):
                    self.write_message(send_err)
                    tem = 1
            if(tem != 1):
                list_mission1.insert(length, data)
                send_web1 = json.dumps(convert1)
                # send_web=json.dumps(convert)
                self.write_message(send_web1)
                save = open(path, "w+")  # open file
                save.write(send_web1)
                name = data["name_mission"]+".py"
                # creat mission.py
                new_file_mission = open(name.replace(" ", "_"), "a")  # creat fine
                shutil.move(name.replace(" ", "_"), '/home/mtk/catkin_ws/src/web/call_mission/'+name.replace(" ", "_"))



#***************************************************************************
                         # Display mission on page list mission 
#***************************************************************************


        if(data["command"] == "list_mission"):  # display list mission for page mission
            print("list_mission")
            f = open(path, "r")  # open file
            f1 = open(path1, "r")  # open file
            read2_1 = f1.readline()
            read2 = f.readline()    # read line

            convert2 = json.loads(read2)
            length2 = len(convert2['list'])
            for x in range(length2):
                # update status=0, edit_mission=false
                convert2['list'][x].update({"status": 0})

            save2 = open(path, "w+")
            send_web2 = json.dumps(convert2)
            save2.write(send_web2)
            self.write_message(send_web2)
            self.write_message(read2_1)
            print send_web2


#***************************************************************************
                    #edit Mission 
#***************************************************************************

        if(data["command"] == "edit_mission"):  # edit mission
            print("edit_mission")
            #y = json.dumps(f)
            f = open(path, "r")  # open file
            read3 = f.readline()
            convert3 = json.loads(read3)

            list_mission3 = convert3["list"]
            length3 = len(list_mission3)
            print data['name']
            for x in range(length3):
                name_mission3 = list_mission3[x]["name_mission"]
                if(name_mission3 == data["name"]):
                    status3 = list_mission3[x]
                    # status3.update({"command":"l"})
                    status3.update({"status": 1})
                    save_status3 = json.dumps(convert3)
                    save3 = open(path, "w+")  # open file
                    save3.write(save_status3)


#***************************************************************************
           
#***************************************************************************

        if(data["command"] == "display_mission"):
            print("display_mission")
            f = open(path, "r")  # open file
            read4 = f.readline()
            convert4 = json.loads(read4)
            list_mission4 = convert4["list"]
            length4 = len(list_mission4)
            for x in range(length4):
                status4 = list_mission4[x]["status"]
                if(status4 == 1):
                    print list_mission4[x]
                    send_web4 = json.dumps(list_mission4[x])
                    self.write_message(send_web4)

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
            f = open(path, "r")  # open file
            read5 = f.readline()
            convert5 = json.loads(read5)
            list_mission5 = convert5["list"]
            length5 = len(list_mission5)
            for x in range(length5):
                status5 = list_mission5[x]["status"]
                if(status5 == 1):
                    list_mission5.pop(x)
                    list_mission5.append(data)
                    save_edit = json.dumps(convert5)

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
            f = open(path, "r")  # open file
            read6 = f.readline()
            convert6 = json.loads(read6)
            list_mission6 = convert6["list"]
            length6 = len(list_mission6)
            for x in range(length6):
                status6 = list_mission6[x]["name_mission"]
                if(status6 == data['name']):
                    list_mission6.pop(x)
                    save_edit = json.dumps(convert6)
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


def creart_mission():

    print data['name']
    name = data["name"]+".py"
    # creat mission.py
    new_file_mission = open(name, "a")  # creat fine
    new_file_mission.write("#!/usr/bin/env python\n#")  # duong dan
    new_file_mission.write(message + "\n #")
    t = time.localtime()
    current_time = time.strftime("%H:%M:%S", t)
    new_file_mission.write(current_time+"\n")
    new_file_mission.write(
        "import rospkg\nimport rospy\nimport rtcrobot_Actions\n\n")

    init_node = "rospy.init_node('"+name+"')\n\n"

    new_file_mission.write(init_node)
    new_file_mission.write("main():\n")
    switch_map = "    action.Switchmap"+name+"\n"
    new_file_mission.write(switch_map)
    new_file_mission.write("    while(10)\n")

    new_file_mission.write("    i= i+1\n")
    loop = "if __name__ ==" + '"__main__"' + ":\n"
    new_file_mission.write(loop)


class new_mission(websocket.WebSocketHandler):
    def open(self):
        print("WebSocket opened")

    def on_message(self, message):
        print 'message received %s' % message  # recive

    def check_origin(self, origin):
        return True


def make_socket():
    rospack = rospkg.RosPack()
    return web.Application([
        web.url(r"/name_mission", name_mission)
    ])


if __name__ == "__main__":
    socket = make_socket()
    socket.listen(8080)
    ioloop.IOLoop.current().start()
