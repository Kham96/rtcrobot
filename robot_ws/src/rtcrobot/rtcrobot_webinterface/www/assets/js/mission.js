

var ros = new ROSLIB.Ros({
    url: 'ws://192.168.5.24:9090'
});

ros.on('connection', function() {
    console.log('Connected to websocket server.');
});

ros.on('error', function(error) {
    console.log('Error connecting to websocket server: ', error);
});

ros.on('close', function() {
    console.log('Connection to websocket server closed.');
});

var mission_service = new ROSLIB.Service({
    ros: ros,
    name: 'mission_request',
    serviceType: 'rtcrobot_services/MissionResponse'
});

var request = new ROSLIB.ServiceRequest({
    name: 'test_request',
});

var request1 = new ROSLIB.ServiceRequest({
    a : 1,
    b : 2
  });

  mission_service.callService(request, function(result) {
    console.log(
      result);
  });


// $(".card_mission").on('click', function() {

//     _name_missionabc = $(this)[0].children[0].children[0].children[0].children[0].children[0].innerText
//         //request.name_mission = _name_missionabc
//     mission_service.callService(request, function(result) {
//             feedback_mission(result)
//         })
//         //feedback_mission(a)


// });

// function feedback_mission(result) {
//     console.log('Result for service call on ' + mission_service.name + ': ' + result.feedback);
// }
// //******************************************************************************** */



var ws = new WebSocket("ws://192.168.5.24:8888/name_mission");
var msg_listmission = {
    command: "list_mission",
    new_name: "",
};

var newTr = ` <div id="list" class="card shadow-sm"> <div class="grid-container mb-2">
                                <div           " id="name" class="item2 ">
                                   <span   class="text-left ml-2  " id="name_mission">`;
var newTr2 = `</span> 
                                </div>
                                <div class=item3 "><i class="fa fa-trash-o" "></i></div>
                                <div  class="item4 "><i  class="fa fa-pencil"  "></i></div>
                                <div  class="item1"><i  class="fa fa-bullseye"></i> </div>
                             </div>
                             </div>`;

ws.onopen = function(e) {
    var msg_requert = {
        command: "list_mission",
        name: []
    };
    ws.send(JSON.stringify(msg_requert));
}

$("#list_mission").on('click', 'div .fa-pencil', function() {
    //console.log("dk")
    var name_mission = $(this).parent().parent().children("#name").children()[0].innerHTML

    var link = "editmission?" + name_mission
    var msg_editmission = {
        command: "edit_mission",
        name: name_mission,
    };

    ws.send(JSON.stringify(msg_editmission));
    window.location = link;
});
$("#list_mission").on('click', 'div .fa-trash-o', function() {
    a = remove_mission()
    if (a) {
        var name_mission = $(this).parent().parent().children("#name").children()[0].innerHTML
        var msg_remove_mission = {
            command: "remove_mission",
            name: name_mission,
        };
        ws.send(JSON.stringify(msg_remove_mission));
       // console.log(msg_remove_mission)
        $(this).parent().parent().remove()
    } else {}

})


$("#list_mission").on('click', 'div .fa-bullseye', function() {
    a = frun_mission()
    if (a) {
        var name_mission = $(this).parent().parent().children("#name").children()[0].innerHTML
        var run_mission = {
            command: "run_mission",
            name: name_mission,
            type: "run_mission"
        };
        document.getElementById("run_mission").innerHTML = name_mission
        ws1.send(JSON.stringify(run_mission));
    } else {}

})


$("#creat_mission").click(function() {
    name = document.getElementById("name_mission1").value;
    description = document.getElementById("description").value;
    //console.log(name)
    msg_new = {
        command: "creat_mission",
        tyle: "save_mission",
        name_mission: name,
        description: description,
        status: 0,
        action: [],
    }
    ws.send(JSON.stringify(msg_new));
    window.location = 'mission.html';
})


function remove_mission() {

    var result = confirm("Are you sure remove!");

    return result
}


function frun_mission() {

    var result = confirm("Are you sure run mission!");

    return result
}

ws.onmessage = function(evt) {
    // $("#list_mission").hide();
    //console.log(evt.data)
    var msg = JSON.parse(evt.data)
    //console.log(msg)
        //len=  msg_listmission.name.length;
    var i
        // //console.log(len)
        //console.log(msg.list)
        //msg.list.forEach(m =>{
        //console.log(m.name_mission);
        // })
    if (msg.type == "save_mission") {
        for (i = 0; i < msg.list.length; i++) {
            //console.log(msg.list[i].name_mission)
            $("#list_mission").append(newTr + msg.list[i].name_mission + newTr2)
        }
    }
    if (msg.type == "err_save_mission") {
        alert("do not creat same mission!")

    }
    if (msg.type == "run_mission") {
        document.getElementById("run_mission").innerHTML = msg.name
        //console.log("dd")
    }
}
// Get value on button click and show alert
//************************************************************************************ */
