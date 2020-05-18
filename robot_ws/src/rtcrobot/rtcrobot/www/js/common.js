// var inputPosX = document.getElementById("posizioneX");
// var inputPosY = document.getElementById("posizioneY");
// var direzione = document.getElementById("direzione");
// var x = document.getElementById("X");
// var y = document.getElementById("Y");
var ros = new ROSLIB.Ros({
  url : 'ws://'+window.location.hostname+':9090'
});
var testStr = new ROSLIB.Topic({
  ros : ros,
  name : '/buttons',
  messageType : 'std_msgs/Int32'
});
var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
{
cmd_vel_listener = new ROSLIB.Topic({
  ros : ros,
  name : "/cmd_vel",
  messageType : 'geometry_msgs/Twist'
});

move = function (linear, angular) {
  var twist = new ROSLIB.Message({
    linear: {
      x: linear,
      y: inputPosX ,
      z: inputPosY
    },
    angular: {
      x: inputPosX ,
      y: 0,
      z: angular
    }
  });
  cmd_vel_listener.publish(twist);
}
}

var listener = new ROSLIB.Topic({
      ros : ros,
      name : 'custom_chatter', 
      messageType : 'beginner_tutorials/Person'
    });
  
    listener.subscribe(function(message) { roslibjs
    //console.log('Received message on ' + JSON.stringify(message));
     var obj= JSON.stringify(message);
      console.log(obj)
      var x = document.getElementsByClassName("text-lg font-weight-bold text-primary text-uppercase");
      x[0].innerHTML =obj;
     });

     
    // Then we create the payload to be published. The object we pass in to ros.Message matches the 
    // fields defined in the geometry_msgs/Twist.msg definition.

    // And finally, publish.
   // joystick
   