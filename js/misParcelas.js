
let vectorParcela=[]

$(document).ready(function(){


google.maps.event.addListenerOnce(map, 'idle', function() {

   
    //asigno a mi nueva variable los datos almacenados en el objeto localstorage mediante el metodo .getItem 
    let misDatos = JSON.parse(localStorage.getItem("misDatos"));
	console.log(misDatos) 
	
    for (var i = 0 ; i < misDatos.parcelasDibujadas.length ; i++){
        
        let objectDeserialized;
        objectDeserialized = DeserializePolygon(misDatos.parcelasDibujadas[i]);   

        vectorParcela.push(objectDeserialized)
        
        objectDeserialized.setMap(map);
    }
     
    UpdateMap(misDatos.map);
    console.log(vectorParcela)
    /*google.maps.event.addListener(this.vectorParcela, 'rightclick', function (e) {
        let infowindow = new google.maps.InfoWindow();
        infowindow.setContent("area= " + objectDeserialized.area + " m2");
        infowindow.setPosition(vectorParcela.getPath().getAt(0));
        infowindow.open(map);
    });*/
    drawingManager.setDrawingMode(null)
});

function DeserializePolygon (object) {   
    var mvcArray = DeserializeMvcArray(object.path);
    var polygon = new google.maps.Polygon({
        paths: mvcArray,
        draggable:object.draggable,
        editable:false,
        strokeColor: object.color,
        fillColor: object.color,
        fillOpacity: 0.99,
        area: object.area,
    });
    return polygon;
}
function DeserializeMvcArray(stringLatlng) {
    var arrayPoints = stringLatlng.split(',');
    var mvcArray = new google.maps.MVCArray();
    for(var i= 0; i < arrayPoints.length; i+=2)
    {
        var latlng = new google.maps.LatLng(arrayPoints[i],arrayPoints[i+1]);
        mvcArray.push(latlng);
    }   
    return mvcArray;
}
function UpdateMap (object){
    var bounds = object.bounds.split(',');
    var swLatLng = new google.maps.LatLng(bounds[0],bounds[1]);
    var neLatLng = new google.maps.LatLng(bounds[2],bounds[3]);
    var mapBounds = new google.maps.LatLngBounds(swLatLng,neLatLng);
    let drawingManager = new google.maps.drawing.DrawingManager({
        drawingControl: false

    })
    drawingManager.setMap(null)    
    drawingManager.setDrawingMode(null)
    map.fitBounds(mapBounds);
    map.setZoom(object.zoom);   
    map.setMapTypeId(google.maps.MapTypeId[object.mapType.toUpperCase()]);

     
}

})








