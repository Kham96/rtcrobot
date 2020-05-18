/**
   * Setup all visualization elements when the page is loaded.
   */

    // Variables sur la map
    var posImageX = 0;
    var posImageY = 0;
    var widthMap = 0;
    var heightMap = 0;
    var resolutionMap = 0;
    var svg;

    // Position d'origine du robot
    var posOriginX = 0;
    var posOriginY = 0;

    // Position du clic
    var posClicX, posClicY;

    

    // Connect to ROS.
    var ros = new ROSLIB.Ros({
      url : 'ws://'+window.location.hostname+':9090'
    });

    ros.on('connection', function() {
        console.log("Connected to Web Socket");
    });
    document.getElementById("start-navigation").onclick = function() {
      console.log("Clicked!")
      // Call service start navigation
      // ----------------------------------
      var srv_start = new ROSLIB.Service({
        ros : ros,
        name : '/rtcrobot_start',
        serviceType : ' std_srvs/Empty'
      });

      var request = new ROSLIB.ServiceRequest({});

      srv_start.callService(request, function(result) {
        console.log('Result for service call on ');
      });
    };
    


    // On subscribe to topic /map_metadata
    // ----------------------------------
    var listenerMetaData = new ROSLIB.Topic({
        ros : ros,
        name : '/map_metadata',
        messageType : 'nav_msgs/MapMetaData'
    });

    listenerMetaData.subscribe(function(message) {
        console.log("Subscribed to topic /map_metadata");
        
        // On récupère les métadonnées de la map
        posOriginX = message.origin.position.x;
        posOriginY = message.origin.position.y;
        widthMap = message.width;
        heightMap = message.height;
        resolutionMap = message.resolution;
        listenerMetaData.unsubscribe();

        console.log('OriginX = ' + posOriginX + ', OriginY = ' + posOriginY);

        // Create the main viewer.
        //console.log($("#map").width());
        var viewer = new ROS2D.Viewer({
        divID : 'map',
        width : $("#map").width(),
        height : heightMap * $("#map").width()/widthMap,
        background: '#C0C0C0'
        });

        //Resize event
        new ResizeObserver(outputsize).observe(map)

        function outputsize() {
          console.log($("#map").width());
          document.getElementById('map_canvas').width = $("#map").width();
        }

        // Setup the map client.
        var mapClient = new ROS2D.OccupancyGridClient({
        ros : ros,
        //topic: '/move_base/local_costmap/costmap',
        rootObject : viewer.scene,
        continuous: false
        });

        // Setup the map client.
        var globalcosmapClient = new ROS2D.OccupancyGridClient({
        ros : ros,
        topic: '/move_base/global_costmap/costmap',
        color: 2,
        rootObject : viewer.scene,
        continuous:false
        });

        // Setup the map client.
        var localcostmapClient = new ROS2D.OccupancyGridClient({
        ros : ros,
        topic: '/move_base/local_costmap/costmap',
        color: 1,
        rootObject : viewer.scene,
        continuous: true
        });
        
        var path = new ROSLIB.Topic({
        ros: ros,
        name: '/move_base/GlobalPlanner/plan',
        messageType: 'nav_msgs/Path'
        });

        var targetPath = new ROS2D.PathShape({
          ros: ros,
          path: null,
          strokeSize: 0.02,
          strokeColor: createjs.Graphics.getRGB(0, 200, 0)
        });

        path.subscribe(function (message) {
            //alert('Received message on ' + path.name + ': ' + JSON.stringify(message));

            if(targetPath)
            {
              targetPath.setPath(message);
              var index = mapClient.rootObject.getChildIndex(targetPath);
              
              mapClient.rootObject.removeChild(targetPath);
            }

            if (index !== -1) {
              mapClient.rootObject.addChildAt(targetPath, index);
            }
            else {
              mapClient.rootObject.addChild(targetPath);
            }
        });

        var pose = new ROSLIB.Topic({
        ros: ros,
        name: '/robot_pose',
        messageType: 'geometry_msgs/Pose'
        });

        pose.subscribe(function (message) {
          //var image = 
        });

        

        // Scale the canvas to fit to the map
        mapClient.on('change', function(){
          //TODO: map update
          viewer.scaleToDimensions(mapClient.currentGrid.width, mapClient.currentGrid.height);
          viewer.shift(mapClient.currentGrid.pose.position.x, mapClient.currentGrid.pose.position.y);
        });
        
        globalcosmapClient.on('change', function(){
          //TODO: map update
        });

        localcostmapClient.on('change', function(){
          //TODO: map update
        });
        
        //displayPoseMarker(viewer,localcostmapClient);
        displayPoseRobot(viewer,localcostmapClient);

    });

    // $(document).ready(function (){
    //   var scroll_zoom = new ScrollZoom($('#map_viewer'),4,0.5)
    // })

    /** 
    * Display a marker on map
    */
    function displayPoseMarker(viewer, mapClient) {
      // Create a marker representing the robot.
      var poseMarker = new ROS2D.NavigationArrow({
        size : 12,
        strokeSize : 1,
        fillColor : createjs.Graphics.getRGB(255, 128, 0, 0.66),
        pulse : true
      });
      poseMarker.visible = false;
      // Add the marker to the 2D scene.
      mapClient.rootObject.addChild(poseMarker);
      var initScaleSet = false;
      // Subscribe to the robot's pose updates.
      var poseListener = new ROSLIB.Topic({
        ros : ros,
        name : '/robot_pose',
        messageType : 'geometry_msgs/Pose',
        throttle_rate : 100
      });
      poseListener.subscribe(function(pose) {
        // Orientate the marker based on the robot's pose.
        poseMarker.x = pose.position.x;
        poseMarker.y = -pose.position.y;
        if (!initScaleSet) {
          poseMarker.scaleX = 1.0 / viewer.scene.scaleX;
          poseMarker.scaleY = 1.0 / viewer.scene.scaleY;
          initScaleSet = true;
        }
        poseMarker.rotation = viewer.scene.rosQuaternionToGlobalTheta(pose.orientation);
        poseMarker.visible = true;
      });
    }
      /** 
    * Display a robot on map
    */
    function displayPoseRobot(viewer, mapClient) {
      // Create a marker representing the robot.
      var robotMarker = new ROS2D.NavigationImage(
        {
          size: 0.5,
          image:'img/rtcrobot.png',
          pulse: false
        });
      robotMarker.visible = false;
      // Add the marker to the 2D scene.
      mapClient.rootObject.addChild(robotMarker);
      var initScaleSet = true;
      // Subscribe to the robot's pose updates.
      var poseListener = new ROSLIB.Topic({
        ros : ros,
        name : '/robot_pose',
        messageType : 'geometry_msgs/Pose',
        throttle_rate : 100
      });
      poseListener.subscribe(function(pose) {
        // Orientate the marker based on the robot's pose.
        robotMarker.x = pose.position.x;
        robotMarker.y = -pose.position.y;
        if (!initScaleSet) {
          robotMarker.scaleX = 1.0 / viewer.scene.scaleX;
          robotMarker.scaleY = 1.0 / viewer.scene.scaleY;
          initScaleSet = true;
        }
        robotMarker.rotation = viewer.scene.rosQuaternionToGlobalTheta(pose.orientation);
        robotMarker.visible = true;
      });
    }
    /**
     * Create Joystick to control robot
     */
    var ros = new ROSLIB.Ros({
      url: 'ws://localhost:9090'
    });

    // ros.on('connection', function () {
    //   document.getElementById("status").innerHTML = "Connected";
    // });

    // ros.on('error', function (error) {
    //   document.getElementById("status").innerHTML = "Error";
    // });

    // ros.on('close', function () {
    //   document.getElementById("status").innerHTML = "Closed";
    // });

    var txt_listener = new ROSLIB.Topic({
      ros: ros,
      name: '/chatter',
      messageType: 'rtcrobot/Control'
    });

    txt_listener.subscribe(function (m) {

      document.getElementById("msg").innerHTML = m.led_status;
      move(1, 0);
    });

    cmd_vel_listener = new ROSLIB.Topic({
      ros: ros,
      name: "/cmd_vel",
      messageType: 'geometry_msgs/Twist'
    });

    move = function (linear, angular) {
      var twist = new ROSLIB.Message({
        linear: {
          x: linear, 
          y: 0,
          z: 0
        },
        angular: {
          x: 0,
          y: 0,
          z: angular
        }
      });
      
        setTimeout(cmd_vel_listener.publish(twist),1000)
    }

    createJoystick = function () {
      var options = {
        zone: document.getElementById('zone_joystick'),
        threshold: 0.1,
        position: { left: 50 + '%' },
        mode: 'static',
        size: 150,
        color: '#000000',
      };
      manager = nipplejs.create(options);

      linear_speed = 0;
      angular_speed = 0;

      manager.on('start', function (event, nipple) {
        timer = setInterval(function () {
          move(linear_speed, angular_speed);
        }, 25);
      });

      manager.on('move', function (event, nipple) {
        max_linear = 1.0; // m/s
        max_angular = 1.0; // rad/s
        max_distance = 75.0; // pixels;
        linear_speed = Math.sin(nipple.angle.radian) * max_linear * nipple.distance/max_distance;
        angular_speed = -Math.cos(nipple.angle.radian) * max_angular * nipple.distance/max_distance;
        //console.log(linear_speed);
      });
      manager.on('end', function () {
        if (timer) {
          clearInterval(timer);
        }
        self.move(0, 0);
      });
    }
    window.onload = function () {
      createJoystick();
    }
