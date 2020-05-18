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
        var viewer = new ROS2D.Viewer({
        divID : 'map',
        width : window.innerWidth,
        height : heightMap * window.innerWidth/widthMap,
        background: '#C0C0C0'
        });

        // Setup the map client.
        var mapClient = new ROS2D.OccupancyGridClient({
        ros : ros,
        //topic: '/move_base/local_costmap/costmap',
        rootObject : viewer.scene,
        continuous: false
        });

        // // Setup the nav client.
        // var nav = NAV2D.OccupancyGridClientNav({
        // ros : ros,
        // topic: 'map',
        // rootObject : viewer.scene,
        // viewer : viewer,
        // serverName : '/move_base',
        // withOrientation : true,
        // //continuous: true,
        // //image:  'turtlebot.png'
        // });

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
        
        path = new ROSLIB.Topic({
        ros: ros,
        name: '/move_base/GlobalPlanner/plan',
        messageType: 'nav_msgs/Path'
        });

        path.subscribe(function (message) {
            //alert('Received message on ' + path.name + ': ' + JSON.stringify(message));
            targetPath = new ROS2D.PathShape({
                ros: ros,
                path: message
            });
            targetPath.setPath(message);
            var index = viewer.scene.getChildIndex(targetPath);
            
            if (index !== null) {
                viewer.scene.removeChild(targetPath)
                viewer.scene.addChildAt(targetPath, index);
            }
            else {
                viewer.scene.addChild(targetPath);
            }
            //viewer.addObject(targetPath);
            //path.unsubscribe();
        });

        // Scale the canvas to fit to the map
        mapClient.on('change', function(){
        viewer.scaleToDimensions(mapClient.currentGrid.width, mapClient.currentGrid.height);
        viewer.shift(mapClient.currentGrid.pose.position.x, mapClient.currentGrid.pose.position.y);
        });
        
        globalcosmapClient.on('change', function(){
        viewer.scaleToDimensions(globalcosmapClient.currentGrid.width, globalcosmapClient.currentGrid.height);
        viewer.shift(globalcosmapClient.currentGrid.pose.position.x, globalcosmapClient.currentGrid.pose.position.y);
        });

        localcostmapClient.on('change', function(){
        viewer.scaleToDimensions(globalcosmapClient.currentGrid.width, globalcosmapClient.currentGrid.height);
        viewer.shift(globalcosmapClient.currentGrid.pose.position.x, globalcosmapClient.currentGrid.pose.position.y);
        });

        
    });

    // $(document).ready(function (){
    //   var scroll_zoom = new ScrollZoom($('#map_viewer'),4,0.5)
    // })

    
}