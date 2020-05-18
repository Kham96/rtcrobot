$(".table").on('click','td .fa-trash-o', function()
{
    $(this).parent().parent().hide();
    //$("#modal-delete").modal('show');  
});

var rowStart_Str = 
`<!-- Start Row -->
<div class="row">`
var rowEnd_Str = 
`</div>
<!--End Row -->`;
var colStr = 
`<!-- Start Widget-->
<div class="col border" style="margin: 10px;">
    <div class="row">
        <div class="col text-center"><img src="/assets/image/400px-Empty_set.svg.png" height="50" /></div>
    </div>
    <div class="row text-right">
        <div class="col text-center"><i class="fa fa-pencil"></i></div>
        <div class="col text-center"><i class="fa fa-trash-o"></i></div>
    </div>
</div>
<!--End Widget-->`;

function gen_row(row_count){
    if (row_count == 4)
    {
        var code = rowStart_Str + colStr + colStr + colStr + colStr + rowEnd_Str;

    } 
}

/*-------------------------------------------------*/
var canvas_width = 850;
var canvas_height = 500;
var smwidget_width = canvas_width/4;
var mdwidget_width = canvas_width/2;
var ldwidget_width = canvas_width;
var widget_height = 100;
var fillet_rect = 10;

var stage = new createjs.Stage("canvas-dashboard");
/* Create Status */
$("#status").click(function(){
    console.log("status");
    /*create container */
    var stt_widget = new createjs.Container();

    /*create rectangle */
    var stt_shape = new createjs.Shape();
    stt_shape.graphics.beginFill("Green");
    stt_shape.graphics.drawRoundRect(0,0,smwidget_width,widget_height,fillet_rect);
    stt_widget.addChild(stt_shape);
    
    /*create text1 */
    var stt_text1 = new createjs.Text();
    stt_text1.font = "40px Arial"
    stt_text1.text = "Running";
    stt_text1.color = "White"
    stt_text1.textAlign = "center";
    stt_text1.x=stt_widget.children[0].graphics.command.w/2;

    /*create text2 */
    var stt_text2 = new createjs.Text();
    
    stt_text2.text = "hello\nxin chao";
    stt_text2.textAlign = "center";
    stt_text2.x = stt_widget.children[0].graphics.command.w/2;
    stt_text2.y = 50

    

    /*add to container */
    stt_widget.addChild(stt_text1,stt_text2);
    /*add to stage */
    stage.addChild(stt_widget);
    stage.update();
    console.log(stt_widget);
    console.log(stt_widget.children[0].graphics.command.w);
    
})

/* Create Battery */
$("#battery").click(function(){

})

/* Create Mission */
$("#mission").click(function(){

})

