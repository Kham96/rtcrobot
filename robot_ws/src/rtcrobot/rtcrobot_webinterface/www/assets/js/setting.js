
var ws = new WebSocket("ws://192.168.5.24:8080/name_mission");
var index
var data_recive
var paramerter
var save_setting= {
    command: "save_setting",
    paramerter: '',
};
var newTr = ` <tr>
<td class="cell-left">max_vel_x</td>
<td  class="cell-center">10 mm/s</td>
<td  class="cell-right"><i class="fa fa-pencil ml-1"></i></td>
</tr>`;
ws.onopen = function(e) {
    var msg_requert = {
        command: "setting",
        name: []
    };
    ws.send(JSON.stringify(msg_requert));
}

table_setting = document.getElementById("setting_parameter");

$(".talbe_setting").on('click','tr', function() {
    index=this.rowIndex;
    $(this).addClass('table-active').siblings().removeClass('table-active')
});

$(".talbe_setting").on('click', 'td .fa-pencil', function() {
    index=this.rowIndex;
    $(this).addClass('table-active').siblings().removeClass('table-active')
    paramerter = $(this).parent().parent().children()[0].innerHTML;
    document.getElementById("label").innerHTML=paramerter;

    $('#setting').modal({
        show: true
    });
   
})
$("#ok_setting").click(function() {
value = document.getElementById("value").value;
console.log(typeof parseInt(value));
if(value!=-0)
{   
    data_recive.DWBLocalPlanner[paramerter]=parseInt(value)
    table_setting.rows[index].cells[1].innerHTML=parseInt(value)
    paramerter= table_setting.rows[index].cells[0].innerHTML
}


    
  
})
$("#save").click(function() {
    c=alent()
if(c){
    save_setting.paramerter=data_recive
    ws.send(JSON.stringify(save_setting));
    console.log(data_recive)
}
})
ws.onmessage = function(evt) {
    // $("#list_mission").hide();
    data_recive= JSON.parse(evt.data)
    leng=Object.values(data_recive.DWBLocalPlanner).length;
    for(i=1;i<leng;i++){
    $(".talbe_setting").append(newTr)
     table_setting.rows[i].cells[0].innerHTML=Object.keys(data_recive.DWBLocalPlanner)[i];
     table_setting.rows[i].cells[1].innerHTML=Object.values(data_recive.DWBLocalPlanner)[i];
    }


}

function alent() {

    var result = confirm("Are you sure save setting!");

    return result
}
