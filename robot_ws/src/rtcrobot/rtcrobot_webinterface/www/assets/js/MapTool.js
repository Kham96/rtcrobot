var _erase_size = 5;
var _map_size = 2048;
var _layer = 1;

var canvas, stage, _bkg_container, _drw_container, _zone_container, _wall_container;

var mouseTarget;	// the display object currently under the mouse, or being dragged
var dragStarted;	// indicates whether we are currently in a drag operation
var offset;
var update = true;
var _pan_enable = false, _eraser_enable = false, _select_enable = false;
var _bmp_map
var _mode = 'Nomal'

var _cur;
var _current_point;

var _data, _stg_data;
var mapname;

//////////////////////////////////////////////////////////
const _stg_speedZone = `<p>Speed target when robot into the zone (m/s).</p>
						<div class="form-group"><input type="text" name="mapname" class="form-control-user form-control" placeholder="Speed value (m/s)"></div>`

const _stg_lookaheadZone = `<p>Minimal distance to obstructions (m).</p>
							<div class="form-group"><input type="text" name="mapsize" class="form-control-user form-control" placeholder="Distance (m)"></div>`


//////////////////////////////////////////////////////////

window.onload = function(){
    getdata();
}

function getdata()
{
	mapname = new URLSearchParams(window.location.search).get('map') 
	$.ajax({
        type: 'POST',
        url: '/ajax',
        data: jQuery.param({ map: mapname}),
        contentType: 'application/x-www-form-urlencoded; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
			_data = msg;
			init();
        }
    });
}

function init() {
    // create the canvas to render to100
	canvas = document.createElement('canvas');
    canvas.width = document.getElementById('map-contain').offsetWidth;
    canvas.height = document.getElementById('map-contain').offsetHeight;
    //canvas.style.background = background;
    document.getElementById('map-contain').appendChild(canvas);
	// create stage and point it to the canvas:
	stage = new createjs.Stage(canvas);

    // enable touch interactions if supported on the current device:
	createjs.Touch.enable(stage);

	// enabled mouse over / out events
	stage.enableMouseOver(10);
	stage.mouseMoveOutside = true; // keep tracking the mouse even when it leaves the canvas
	
	_bkg_container = new createjs.Container();
    _drw_container = new createjs.Container();
    _zone_container = new createjs.Container();
	_wall_container = new createjs.Container();
	_wall_container.alpha = 0.5;
    stage.addChild(_bkg_container);
    stage.addChild(_wall_container);
    stage.addChild(_zone_container);
	stage.addChild(_drw_container);
	
	//createMarker(100,100,"rgba(0,255,0,0.5)");
	//createMarker(555,100,"rgba(0,0,255,0.5)");
	//createMarker(555,222,"rgba(255,0,0,0.5)");

    
    _cur = new createjs.Shape();
    _cur.graphics.beginFill("rgba(0,0,0,0.1)").beginStroke("rgba(0,0,0,0.5)").drawRect(-2, -2, 5,5);
	_cur.visible = false;
	
	
	_current_point = new createjs.Shape();
	_current_point.graphics.beginFill("rgba(0,255,0,0.1)").beginStroke("rgba(0,0,0,0.5)").drawCircle(0, 0, 10);
	_current_point.visible = false;

	
	

    _bkg_container.on("pressmove", function (evt) {   
		var pt = _bkg_container.globalToLocal(stage.mouseX, stage.mouseY);
		if(_mode == "Nomal" && _eraser_enable)
		{
			_cur.x = pt.x;
        	_cur.y = pt.y;
        	_cur.visible = true
		}
		if((_mode == "DrawLine" || _mode =='DrawPolygon') && _pan_enable == false && _eraser_enable ==false)
		{
			_current_point.x = pt.x;
        	_current_point.y = pt.y;
			_current_point.visible = true;
		}
        update = true;
    });

    _bkg_container.on("pressup", function (evt) {  
		var pt = _bkg_container.globalToLocal(stage.mouseX, stage.mouseY);
		_cur.visible = false;
		if((_mode =='DrawLine' || _mode =='DrawPolygon') && _pan_enable == false && _eraser_enable ==false)
		{
			if(!_drw_container.children.find(line => line.name == 'line'))
			{
				var line = new createjs.Shape();
				line.name = 'line'
				line.originScale = 1;
				line.points = [];
				line.layer = _layer;
				_drw_container.addChild(line);
			}
			
			drawPoint({x: pt.x, y:pt.y})
			_current_point.visible = false;
		}
        update = true;
	});
	
	
	_data.wallData.pointdata.forEach(pg =>{
		drawLine(_wall_container,pg);
		update = true;
	});

	_data.zoneData.forEach(pg =>{
		if(pg.type == 'point')
		{
			createMarker(pg);
		}
		else{
			drawLine(_zone_container,pg);
		}
		
		update = true;
	});
    
	canvas.addEventListener("mousewheel", MouseWheelHandler, false);
    canvas.addEventListener("DOMMouseScroll", MouseWheelHandler, false);
    //container.addEventListener("mousemove", MouseMoveHandler);
    stage.addEventListener("stagemousedown", StageMouseDownHandler); 
    var image = new Image();
    image.src = 'data:image\/(png|jpg);base64,' + _data.navData;
    image.onload = handleImageLoad
    
    createjs.Ticker.addEventListener("tick", stage);
}

$('#modal-Settings').on('click', '.modal-footer .btn-ok', function(){
	if(_stg_data.layer == 12) //marker
	{
		_zone_container.removeChild(_stg_data);
		_stg_data.settings.name = $("input[name=markername]").val();
		_stg_data.settings.x = parseInt($("input[name=markerx]").val());
		_stg_data.settings.y = parseInt($("input[name=markery]").val());
		_stg_data.settings.theta = parseInt($("input[name=markertheta]").val());
		_stg_data.settings.type = parseInt($("select[id=slt-markertype]").val());
		createMarker(_stg_data);
	}
});

$('#modal-Settings').on('click', '.modal-footer .btn-delete', function(){
	if(_stg_data.layer == 12) //marker
	{
		_zone_container.removeChild(_stg_data);
	}
});

function createMarker(option) {
	/*
	x= 10, y = 105
	var c = document.getElementById("myCanvas");
	var ctx = c.getContext("2d");
	ctx.beginPath();
	ctx.moveTo(x+10, y-20);
	ctx.lineTo(x, y)
	ctx.lineTo(x-10, y-20);
	ctx.bezierCurveTo(x-16, y-40, x+16, y-40, x+10, y-20);
	ctx.stroke();
	ctx.moveTo(x+5, y-25);
	ctx.arc(x, y-25, 5, 0, 2 * Math.PI,true);
	ctx.fill()
	ctx.stroke();
	*/
	x = option.settings.x;
	y = option.settings.y;
	icon = new createjs.Shape();
	icon.graphics.clear();
	icon.alpha = 0.7;
	switch(option.settings.type)
	{
		case 1: //Robot position
			icon.graphics.beginFill('rgba(0,100,0,1)');
			break;
		case 2: //Dock Position
			icon.graphics.beginFill('rgba(100,100,0,1)');
			break;
		case 3: //Charge Position
			icon.graphics.beginFill('rgba(100,0,0,1)');
			break;
	}
	
	icon.graphics.beginStroke("rgba(0,0,0,0.5)");
	/*lOZICATION icon
	icon.graphics.moveTo(x+10, y-20);
	icon.graphics.lineTo(x, y);
	icon.graphics.lineTo(x-10, y-20);
	icon.graphics.bezierCurveTo(x-16, y-40, x+16, y-40, x+10, y-20);
	icon.graphics.endFill();
	icon.graphics.endStroke();
	icon.graphics.beginFill('rgba(0,0,0,0.7)')
	icon.graphics.moveTo(x+5, y-25);
	icon.graphics.drawCircle(x, y-25, 5);
	icon.graphics.endStroke();
	icon.graphics.closePath();
	*/

	//DIRECTIONS icon
	icon.graphics.moveTo(15, 6);
	icon.graphics.lineTo(0, 15);
	icon.graphics.lineTo(-15, 6);
	icon.graphics.moveTo(-10, 6);
	icon.graphics.bezierCurveTo(-17, -17, +17, -17, +10, +6);
	icon.graphics.endFill();
	icon.graphics.endStroke();
	icon.graphics.beginFill('rgba(0,0,0,0.7)')
	icon.graphics.moveTo(5, 0);
	icon.graphics.drawCircle(0, 0, 5);
	icon.graphics.endStroke();
	icon.graphics.closePath();
	
	icon.x = x;
	icon.y = y;
	icon.cursor = 'pointer';
	icon.type = 'point';
	//icon.points = [{x:x,y:y}];
	icon.layer = 12;
	icon.settings = {
		name : option.settings.name || '',
		x : x || 0,
		y : y || 0,
		theta : option.settings.theta || 0,
		type: option.settings.type || 1
	};

	icon.rotation = icon.settings.theta;

	icon.on("rollover", function (evt) {
		this.alpha = 1;
		update = true;
	});

	icon.on("rollout", function (evt) {
		this.alpha = 0.7;
		update = true;
	});

	icon.on("mousedown", function (evt) {
		stg_marker(this);
	});

	_zone_container.addChild(icon);

  }

function drawLine(container, pointgroup)
{
	var line = new createjs.Shape();
	line.name = 'line';
	line.alpha = 0.7;
	line.cursor = 'pointer';
	line.originScale = 1;
	line.points = pointgroup.points;
	line.layer = pointgroup.layer;
	line.type = pointgroup.type;
	if(pointgroup.type == "DrawLine")
	{
		line.graphics.setStrokeStyle(1.2/line.originScale).beginStroke("rgba(0,0,0,1)");
	}else if(pointgroup.type == "DrawPolygon")
	{
		switch(parseInt(line.layer)){
			case 3://Vitual Wall
				line.graphics.beginFill("rgba(0,0,0,1)");
				break;
			case 4://Speed Zone
				line.graphics.beginFill("rgba(255,0,0,0.5)");
				break;
			case 5://Bluetooth Zone
				line.graphics.beginFill("rgba(0,255,0,0.5)");
				break;
			case 6://Beep Zone
				line.graphics.beginFill("rgba(0,0,255,0.5)");
				break;
			case 7://Blink Zone
				line.graphics.beginFill("rgba(40, 154, 199,0.5)");
				break;
			case 8://No localization Zone
				line.graphics.beginFill("rgba(133, 199, 40,0.5)");
				break;
			case 9://Look-ahead Zone
				line.graphics.beginFill("rgba(199, 90, 40,0.5)");
				break;
		}
		
	}
	pointgroup.points.forEach(p =>{
		line.graphics.lineTo(p.x/line.originScale, p.y/line.originScale);
	});

	if(pointgroup.type == "DrawPolygon")
	{
		line.graphics.closePath ();
	}

	line.graphics.endStroke();

	line.on("rollover", function (evt) {
		this.alpha = 1;
		update = true;
	});

	line.on("rollout", function (evt) {
		this.alpha = 0.7;
		update = true;
	});
	
	line.on("mousedown", function (evt) {
		var line = new createjs.Shape();
		//////////////////////////////////
		if(_layer == 3 )
		{
			_mode = this.type;
		}
		else
		{
			_mode = "DrawPolygon";
		}
		_select_enable = false;
		//////////////////////////////////
		line.name = 'line';
		line.originScale = 1;
		line.points = this.points;
		line.layer = this.layer;
		_drw_container.addChild(line);
		for(i =0; i <this.points.length; i++)
		{
			drawPoint(this.points[i]);
		}
		this.parent.removeChild(this);
		update = true;
	});

	container.addChild(line);
}

function drawPoint(option)
{
	var px = option.x | 0;
	var py = option.y | 0;

	var point = new createjs.Shape();
	point.graphics.beginFill("rgba(0,255,0,0.1)").beginStroke("rgba(0,0,0,0.5)").drawCircle(0, 0, 5);
	point.x = px;
	point.y = py;
	point.selected = false;
	point.scale = 1/_scale;
	point.name = 'point'
	point.cursor = 'pointer'

	point.on("rollover", function (evt) {
		this.scale = 2/_scale;
		update = true;
	});

	point.on("rollout", function (evt) {
		if(!this.selected)this.scale = 1/_scale;
		update = true;
	});

	point.on("pressmove", function (evt) {
		var pt = _bkg_container.globalToLocal(stage.mouseX, stage.mouseY);
		this.x = pt.x;
		this.y = pt.y;
		update = true;
	});

	point.on("mousedown", function (evt) {
		if(_eraser_enable)
			_drw_container.removeChild(this)
	});


	_drw_container.addChild(point)
}

//HANDLE
function handleImageLoad(event) {
    var image = event.target;

    // create the canvas to render to
    var cv = document.createElement('canvas');
    cv.name = 'cvs-map'
    cv.width = image.width;
	cv.height = image.height;

	var ctx = cv.getContext("2d");
    ctx.drawImage(image,0,0);

	_bmp_map = new createjs.Bitmap(cv);
	//_bmp_map.regX = _bmp_map.image.width / 2 | 0;
	//_bmp_map.regY = _bmp_map.image.height / 2 | 0;
	//_bmp_map.x = canvas.width / 2 | 0;
    //_bmp_map.y = canvas.height / 2 | 0;

    _bkg_container.addChild(_bmp_map);
	_bkg_container.addChild(_cur);
	_bkg_container.addChild(_current_point)

	createjs.Ticker.addEventListener("tick", tick);
}

function tick(event) {
    // Update GUI
    if(_select_enable)
    {
        if(_layer >= 4) _zone_container.mouseEnabled = true;
        else _zone_container.mouseEnabled = false;
        
        if(_layer == 3 ) _wall_container.mouseEnabled = true;
        else _wall_container.mouseEnabled = false;
        
    }else 
    {
        _zone_container.mouseEnabled = false;
        _wall_container.mouseEnabled = false;
    }

	if(_pan_enable) $('#tool-list').find('.fa-arrows-alt').addClass('actived');
	else  $('#tool-list').find('.fa-arrows-alt').removeClass('actived');

	if(_eraser_enable) $('#tool-list').find('.fa-eraser').addClass('actived');
	else  $('#tool-list').find('.fa-eraser').removeClass('actived');

	if(_select_enable) $('#tool-list').find('.fa-mouse-pointer').addClass('actived');
	else  $('#tool-list').find('.fa-mouse-pointer').removeClass('actived');

	if(_mode=='DrawPolygon') $('#tool-list').find('.fa-draw-polygon').addClass('actived');
	else  $('#tool-list').find('.fa-draw-polygon').removeClass('actived');

	if(_mode=='DrawLine') $('#tool-list').find('.fa-pen').addClass('actived');
	else  $('#tool-list').find('.fa-pen').removeClass('actived');


	if(_layer >0 && _layer <=3 ) $('#tool-list').find('.map-tool').removeClass('hidden');
	else $('#tool-list').find('.map-tool').addClass('hidden');

	if(_layer >3 && _layer <=9 ) $('#tool-list').find('.zone-tool').removeClass('hidden');
	else $('#tool-list').find('.zone-tool').addClass('hidden');

	if(_layer == 12 ) $('#tool-list').find('.marker-tool').removeClass('hidden');
	else $('#tool-list').find('.marker-tool').addClass('hidden');
	/////////////////////////////////////////////
	// this set makes it so the stage only re-renders when an event handler indicates a change has happened.
	if (update) {
		update = false; // only update once
		
		points = _drw_container.children.filter(p => p.name=='point')
		if(points.length > 1)
		{
			if(_mode =='DrawLine')
			{
				line = _drw_container.children.find(line => line.name == 'line')
				line.graphics.clear()
				line.graphics.setStrokeStyle(1/line.originScale).beginStroke("rgba(0,0,0,1)");
				//line.graphics.moveTo(points/line.originScale,100/line.originScale);
				points.forEach(p =>
					{
						//line.graphics.moveTo(p.x/line.originScale, p.x/line.originScale);
						line.graphics.lineTo(p.x/line.originScale, p.y/line.originScale);
					})
				//line.graphics.closePath ()
				line.graphics.endStroke();
			}
			if(_mode =='DrawPolygon')
			{
				line = _drw_container.children.find(line => line.name == 'line')
				if(line)
				{
					line.graphics.clear();
					layer = parseInt(line.layer)
					if(layer == 1) //Wall
						line.graphics.beginFill("rgba(0,0,0,0.5)");
					else if(layer == 2) //Floor
						line.graphics.beginFill("rgba(255,255,255,0.5)");
					else if(layer == 3) //Vitual Wall
						line.graphics.beginFill("rgba(0,0,0,1)");
					else if(layer == 4) //Speed Zone
						line.graphics.beginFill("rgba(255,0,0,0.5)");
					else if(layer == 5) //Bluetooth Zone
						line.graphics.beginFill("rgba(0,255,0,0.5)");
					else if(layer == 6) //Beep Zone
						line.graphics.beginFill("rgba(0,0,255,0.5)");
					else if(layer == 7) // Blink Zone
						line.graphics.beginFill("rgba(40, 154, 199,0.5)");
					else if(layer == 8) //No localization Zone
						line.graphics.beginFill("rgba(133, 199, 40,0.5)");
					else if(layer == 9) //Look-ahead Zone
						line.graphics.beginFill("rgba(199, 90, 40,0.5)");
					//line.graphics.moveTo(points/line.originScale,100/line.originScale);
					points.forEach(p =>
						{
							//line.graphics.moveTo(p.x/line.originScale, p.x/line.originScale);
							line.graphics.lineTo(p.x/line.originScale, p.y/line.originScale);
						})
					line.graphics.closePath ()
					line.graphics.endStroke();
				}
				else{
					
				}
				
			}
		}
		else{
			line = _drw_container.children.find(line => line.name == 'line')
			if(line)
			{
				line.graphics.clear()
			}
		}
		stage.update(event);
		
	}
}



///////////////////////////////////HANDLE//////////////////////////////////
var zoom, _scale = 1;
function MouseWheelHandler(e) {
	if(Math.max(-1, Math.min(1, (e.wheelDelta || -e.detail)))>0)
		zoom=1.1;
	else
		zoom=1/1.1;
		var local = stage.globalToLocal(stage.mouseX, stage.mouseY);
	_scale *= zoom
    stage.regX=local.x;
    stage.regY=local.y;
	stage.x=stage.mouseX;
	stage.y=stage.mouseY;	
	stage.scaleX=stage.scaleY*=zoom;
	_current_point.scale /= zoom;
	_drw_container.children.forEach(p => {
		p.scale /= zoom;
		p.originScale = p.scale;
	})
	
	update = true;
	
}

function StageMouseDownHandler(e){
    if(_pan_enable)
        {
            var offset={x:stage.x-e.stageX,y:stage.y-e.stageY};
            stage.addEventListener("stagemousemove",function(ev) {
                stage.x = ev.stageX+offset.x;
                stage.y = ev.stageY+offset.y;
                stage.update();
            });
            stage.addEventListener("stagemouseup", function(){
                stage.removeAllEventListeners("stagemousemove");
            });
        }
        else{
            stage.addEventListener("stagemousemove",function(ev) {
				if(_mode == "Nomal" && _eraser_enable && _cur.visible == true)
				{
					var ctx = _bmp_map.image.getContext("2d");
					var pt = _bkg_container.globalToLocal(stage.mouseX, stage.mouseY);
					var imageData = ctx.getImageData(pt.x - _erase_size/2, pt.y - _erase_size/2 , _erase_size, _erase_size);
					for (i = 0; i< imageData.data.length; i+=4)
					{
						if(imageData.data[i] <= 200)
						{
							imageData.data[i] = 254;
							imageData.data[i+1] = 254;
							imageData.data[i+2] = 254;
						}
					}

					ctx.putImageData(imageData,pt.x - _erase_size/2 ,pt.y - _erase_size/2);
					
					//update = true;
					}
            });
        }
}
////////////////////////////////////////////////////////////////////////////////////////
function stg_marker(marker)
{
	_stg_data = marker;
	const str = `<p class="marker">Marker settings</p>
							<div class="form-group"><input type="text" name="markername" class="form-control-user form-control" placeholder="Name" value ="`+ marker.settings.name +`"></div>	
							<div class="form-group">
								<select id="slt-markertype" class="form-control">
									<option value="1" selected>Robot position</option>
									<option value="2">Dock station</option>
									<option value="3">Charge station</option>
								</select>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-lg-4">
										<strong>x</strong>
										<input type="text" name="markerx" class="form-control-user form-control" placeholder="X coordinate in meters" value ="`+ marker.settings.x +`">
									</div>
									<div class="col-lg-4">
										<strong>y</strong>
										<input type="text" name="markery" class="form-control-user form-control" placeholder="Y coordinate in meters" value ="`+ marker.settings.y +`">
									</div>
									<div class="col-lg-4">
										<strong>theta</strong>
										<input type="text" name="markertheta" class="form-control-user form-control" placeholder="Orientation from X-axis" value ="`+ marker.settings.theta +`">
									</div>
								</div>
							</div>
							<button class="btn btn-primary btn-block text-white btn-user" type="submit">Detect Marker</button>`
	
	$('#modal-Settings').find('.modal-body')[0].innerHTML = str;
	$('#modal-Settings').modal();
}
////////////////////////////////////////////////////////////////////////////////////////
//Move button
$('#tool-list').on('click', 'li .fa-arrows-alt', function()
{
	if(_pan_enable)
	{
		_pan_enable = false;
		$(this).removeClass('actived')
	}
	else{
		_pan_enable = true;
		$(this).addClass('actived')
	}
});

//Config button
$('#tool-list').on('click', 'li .fa-cog', function()
{
	if(_layer == 9) {
		$('#modal-Settings').find('.modal-body')[0].innerHTML = _stg_lookaheadZone;
		$('#modal-Settings').modal();
	}
	if(_layer == 4) {
		$('#modal-Settings').find('.modal-body')[0].innerHTML = _stg_speedZone;
		$('#modal-Settings').modal();
	}
});

//Pen tool
$('#tool-list').on('click', 'li .fa-pen', function()
{
	if(_mode == 'DrawLine')
	{
		_mode = 'Nomal';
		hiddenchild(_drw_container,'point')
	}
	else{
		_mode = 'DrawLine'
		_select_enable = false;
        showchild(_drw_container,'point')
    }
    update = true;
});


//Add Marker tool
$('#tool-list').on('click', 'li .fa-map-marker-alt', function()
{
	stg = {
		layer: 12,
		type: "point",
		settings: {
			y: 0, 
			x: 0, 
			type: 1, 
			name: "", 
			theta: 0.0}
		}
	stg_marker(stg)
    update = true;
});

//Layer change - Select event
$('#tool-list').on('click', 'li .fa-draw-polygon', function()
{
	if(_mode == 'DrawPolygon')
	{
		_mode = 'Nomal';
		hiddenchild(_drw_container,'point')
	}
	else{
		_mode = 'DrawPolygon';
		_select_enable = false;
        showchild(_drw_container,'point')
    }
    update = true;
});

//Eraser Tool
$('#tool-list').on('click', 'li .fa-eraser', function()
{
	if(_eraser_enable)
	{
		_eraser_enable = false;
	}
	else{
		_eraser_enable = true;
		_select_enable = false;
	}
	
});

//Select Tool
$('#tool-list').on('click', 'li .fa-mouse-pointer', function()
{
	if(_select_enable)
	{
		$(this).removeClass('actived')
		_select_enable = false;
	}
	else{
		if(_drw_container.children.length==0){
			$(this).addClass('actived')
			_select_enable = true;
			_mode = 'Nomal';
			_eraser_enable = false;
		}
	}
	update = true;
});

//Confirm button
$('#tool-list').on('click', 'li .fa-check', function()
{
	applytomap();
	update = true;
});

//Disconfirm button
$('#tool-list').on('click', 'li .fa-close', function()
{
	 _drw_container.removeAllChildren()
});

//Select layer
$('#slt-layertype').change(function()
{
    $("#slt-layertype > option:selected" ).each(function() {
		_layer = this.value;
		if(_drw_container.children.find(line => line.name == 'line'))
		{
			_drw_container.children.find(line => line.name == 'line').layer = _layer;
		}
        
        switch(parseInt(this.value))
        {
			case 1: //Wall
			case 2: //Floor
			case 3: //Vitual Wall
				break;
			case 4: //Speed Zone
			case 5: //Bluetooth Zone
			case 6: //Beep Zone
			case 7: //B{"layer": 12, "points": [{"y": 100, "x": 555}], "type": "point"}, link Zone
			case 8: //No localization Zones
			case 9: //Look-ahead Zones
				if(_mode=="DrawLine") _mode = "DrawPolygon"
				break;
			case 12: //Marker
				_mode = 'Nomal'
				_drw_container.removeAllChildren();
                break;
            default:
                break;
        }
	  });
    update = true;
});

document.body.onkeydown = function(event)
{
	var btn_pan = $('#tool-list').find('.fa-arrows-alt');
    if(event.ctrlKey) 
    {
		_pan_enable = true;
		update = true;
    }

    document.body.onkeyup = function(event)
    {
        if(!event.ctrlKey) 
        {
			_pan_enable = false;
			update = true;
        }
    };
};



/////////////////////////////////////////////////////////////////////////
function hiddenchild(container, name)
{
	var points = container.children.filter(p => p.name==name)
	if(points.length > 0)
	{
		points.forEach(p=>{
			p.visible = false;
		})
	}
}

function showchild(container, name)
{
	var points = container.children.filter(p => p.name==name)
	if(points.length > 0)
	{
		points.forEach(p=>{
			p.visible = true;
		})
    }
    update = true;
}


function applytomap()
{
    hiddenchild(_drw_container,'point')
	if(_mode =='DrawLine' || _mode =='DrawPolygon')
	{
		layer = _drw_container.children.find(line => line.name == 'line').layer
        // Put data to background layer
        if(layer == 1 || layer == 2)
        {
            var ctx = _bmp_map.image.getContext("2d");
            var cont = _drw_container.clone(true);
            cont.cache(0,0,_bmp_map.image.width,_bmp_map.image.height);
            var ctx_draw = cont.cacheCanvas.getContext("2d");
            var imageData = ctx.getImageData(0,0,_bmp_map.image.width,_bmp_map.image.height);
            var drawData = ctx_draw.getImageData(0,0,_bmp_map.image.width,_bmp_map.image.height);
            for (i = 0; i< drawData.data.length; i+=4)
            {
                if(_layer == 1) 
                {
                    if(drawData.data[i+3] > 50)
                    {
                        //black
                        imageData.data[i] = 0;
                        imageData.data[i+1] = 0;
                        imageData.data[i+2] = 0;
                    }
                }
                else if(_layer == 2) 
                {
                    if(drawData.data[i+3] > 50 && imageData.data[i] > 50)
                    {
                        //white
                        imageData.data[i] = 254;
                        imageData.data[i+1] = 254;
                        imageData.data[i+2] = 254;
                    }
                }
                
            }

            ctx.putImageData(imageData,0 ,0);
        }
        else if(layer >= 3 && layer <= 9)
        {
			var l = _drw_container.children[0];
			l.alpha = 0.7;
            l.cursor = 'pointer';
            l.type = _mode
			l.points = [];
			l.layer = layer;
			
			for(i =1; i < _drw_container.children.length; i++)
			{
				p = {x:_drw_container.children[i].x, y:_drw_container.children[i].y}
				l.points.push(p);
			}
			l.on("rollover", function (evt) {
				this.alpha = 1;
				update = true;
			});

			l.on("rollout", function (evt) {
				this.alpha = 0.7;
				update = true;
			});
			
			l.on("mousedown", function (evt) {
                var line = new createjs.Shape();
                //////////////////////////////////
                if(_layer == 3 )
                {
                    _mode = this.type;
                }
                else
                {
                    _mode = "DrawPolygon";
                }
				_select_enable = false;
				//////////////////////////////////
				line.name = 'line';
				line.originScale = 1;
				line.points = this.points;
                line.layer = this.layer;
				_drw_container.addChild(line);
				for(i =0; i <this.points.length; i++)
				{
					drawPoint(this.points[i]);
				}

				this.parent.removeChild(this);
				update = true;
            });
            if(_layer == 3 ) 
            {
                _wall_container.addChild(l);
                _wall_container.mouseEnabled = false;
            }
            else {
                _zone_container.addChild(l)
                _zone_container.mouseEnabled = false;
            }
            
        }

        // Put data to zone layer
    }
    
    _drw_container.removeAllChildren()
}

var button = document.getElementById('btn-download');
button.addEventListener('click', function (e) {
	
	var navdataURL = _bmp_map.image.toDataURL('image/png');
	//dataURL = dataURL.replace(/^data:image\/(png|jpg);base64,/, "")
	//button.href = dataURL;
	navdataURL = navdataURL.replace(/^data:image\/(png|jpg);base64,/, "")
	
	var wallcont = _wall_container.clone(true);
	wallcont.alpha = 1;
	wallcont.cache(0,0,2048,2048);
	var walldataURL = wallcont.cacheCanvas.toDataURL('image/png');
	walldataURL = walldataURL.replace(/^data:image\/(png|jpg);base64,/, "")

	navdataURL
	wdata = {
		imgdata: walldataURL,
		pointdata: []
	};
	_wall_container.children.forEach(w =>{
		wdata.pointdata.push({points:w.points, type: w.type, layer: w.layer})
	});

	zdata = []
	_zone_container.children.forEach(z =>{
		zdata.push({points:z.points, type: z.type, settings: z.settings, layer: z.layer})
	});

    savedata={
		name: mapname,
        navData: navdataURL,
        wallData: wdata,
        zoneData: zdata
	}

	// Sending the image data to Server
    $.ajax({
        type: 'POST',
        url: '',
        data: JSON.stringify(savedata),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            console.log("Done, Picture Uploaded.");
        }
    });
});