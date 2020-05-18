$('#dataTable').on('click', '.clickable-row', function(event) {
    $(this).addClass('table-active').siblings().removeClass('table-active');
    document.getElementById("mapselect-name").innerHTML = this.cells[0].innerText;
    document.getElementById("mapselect-createby").innerHTML = this.cells[1].innerText;
    document.getElementById("mapview").src = "./assets/img/maps/" + this.cells[0].innerText + ".png";
  });

$('#dataTable').on('click', '.btn-active', function(event) {
  console.log("Active click")
  console.log($(this).closest('tr')[0].id)
});

$('#dataTable').on('click', '.btn-delete', function(event) {
  document.getElementById("modal-mapName").innerHTML = $(this).closest('tr')[0].cells[0].innerText
});


//submit create map form
$('#mapsubmit').click(function()
{
  $('#mapform').submit();
});