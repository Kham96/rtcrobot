/**
   * Setup all visualization elements when the page is loaded.
   */
  function init() {
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

    cmd_vel_listener = new ROSLIB.Topic({
      ros : ros,
      name : "/cmd_vel",
      messageType : 'geometry_msgs/Twist'
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
      cmd_vel_listener.publish(twist);
    }

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
        // var viewer = new ROS2D.Viewer({
        // divID : 'map',
        // width : window.innerWidth,
        // height : heightMap * window.innerWidth/widthMap,
        // background: '#C0C0C0'
        // });

        // Setup the map client.
        var mapClient = new ROS2D.OccupancyGridClient({
        ros : ros,
        //topic: '/move_base/local_costmap/costmap',
        rootObject : viewer.scene,
        continuous: false
        });

        // Setup the nav client.
        var nav = NAV2D.OccupancyGridClientNav({
        ros : ros,
        topic: 'map',
        rootObject : viewer.scene,
        viewer : viewer,
        serverName : '/move_base',
        withOrientation : true,
        //continuous: true,
        //image:  'turtlebot.png'
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
        createJoystick();

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
          image:'./rtcrobot.png',
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
    createJoystick = function () {
      var options = {
        zone: document.getElementById('zone_joystick'),
        threshold: 0.1,
        position: { right: 50+"%", top: 50+"%" },
        mode: 'static',
        size: window.innerWidth * 0.12,
        color: '#000000',
      };
      manager = nipplejs.create(options);

      linear_speed = 0;
      angular_speed = 0;

      self.manager.on('start', function (event, nipple) {
        console.log("Movement start");
        timer = setInterval(function () {
          move(linear_speed, angular_speed);
        }, 250);
      });

      self.manager.on('move', function (event, nipple) {
        console.log("Moving");
        max_linear = 1.0; // m/s
        max_angular = 1.0; // rad/s
        max_distance = (window.innerWidth * 0.12)/2; // pixels;
        linear_speed = Math.sin(nipple.angle.radian) * max_linear * nipple.distance/max_distance;
        angular_speed = -Math.cos(nipple.angle.radian) * max_angular * nipple.distance/max_distance;

      });

      self.manager.on('end', function () {
        console.log("Movement end");
        if (timer) {
          clearInterval(timer);
        }
        self.move(0, 0);
      });
    }
}