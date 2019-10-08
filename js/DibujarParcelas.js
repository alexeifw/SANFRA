//--------------------global variable of obj map----------------------------------------
let map,infowindow,data, area, object, color, polygon;
let idCounter = 0;
let VectorMisParcelas = [];
misDatos = {};
let drawingManager	

//-------document ready wait until the page is loaded-------------------------------------
$(document).ready(function(){
	
	//--------------obj with option 
	var mapOptions = {
		center: new google.maps.LatLng(-26.181832, -58.163897),
        zoom: 15,
		scaleControl: true,
		scrollwheel: true,
		rotateControl:true,
		mapTypeId: google.maps.MapTypeId.SATELLITE 
	};
	
	//-----------create a instance del obj map
	map = new google.maps.Map(document.getElementById("map"), mapOptions);


	//---------------------OBTENGO LA UBICACION DEL USUARIO-------------------------------
	infoWindow = new google.maps.InfoWindow;
	// Try HTML5 geolocation.
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			var pos = {
				lat: position.coords.latitude,
				lng: position.coords.longitude
			};
			/*infoWindow.setPosition(pos);
			infoWindow.setContent('Users location');
			infoWindow.open(map);*/
			map.setCenter(pos);
		}, function() {
			//handleLocationError(true, infoWindow, map.getCenter());
		});
	} else {
	  // Browser doesn't support Geolocation
		handleLocationError(false, infoWindow, map.getCenter());
	}
//-----------------------FIN DEL BLOQUE OBTENGO UBICACION DEL USUARIO---------------------

//----------------evento click del boton 'guardar' (jquery)--------------------------------
	$('#guardar').on('click',function(){	

		CollectTitlesDescriptions();
		misDatos.parcelasDibujadas = VectorMisParcelas; 
        misDatos.map = SerializeMap(); 
		console.log(misDatos);
		//creo el objeto y con el metoda 'setItem' asigno el valor de lo que quiero guardar
		localStorage.setItem("misDatos", JSON.stringify(misDatos));
		//esta variable 'control' solo la creo para ver que onda, no es necesario
		let control = localStorage.getItem("misDatos");
		console.log(control);
		//enviar datos al servidor
		//$.post("here your url script server side",misDatos);

		//$.post("here your url script server side", JSON.stringify(misDatos));
	});	


	//----------cuando el mapa esté listo---------------------------------
	google.maps.event.addListenerOnce(map, 'idle', function() {
	
		drawingManager = new google.maps.drawing.DrawingManager({
            drawingMode: google.maps.drawing.OverlayType.POLYGON,
			drawingControlOptions: {
                position: google.maps.ControlPosition.TOP_CENTER,
                drawingModes: ['polygon']
			}, 
			polygonOptions: {
				editable: true 
			}, 
			map: map
		})
		//-----INICIO evento overlaycomplete(poligono dibujado completo)-----------
		google.maps.event.addListener(drawingManager, 'overlaycomplete', function(event) { 
			drawingManager.setDrawingMode(null),
			
            idCounter = idCounter + 1,
            
			color = get_random_color(),

			CreateItemList(color,idCounter),

			VectorMisParcelas.push(SerializePolygon(event.overlay,idCounter)),

			event.overlay.setOptions({
				strokeColor : color,
                fillColor : color,
                editable: false,
                fillOpacity: 0.7,
			
			})

		})//-----fin del evento overlaycomplete(poligono dibujado completo)---------
	
	});//--------------------fin del evento idle------------------------------------

});
//-------------------------------FIN document ready---------------------------------






function SerializePolygon(polygon,id) {
	parcela = {};	
	parcela.path = SerializeMvcArray(polygon.getPath()); //obtengo las coordenadas de los vertices del poligono
	parcela.type = "polygon";
	parcela.id = id;
	parcela.color = color;
    parcela.draggable = polygon.getEditable(),
    parcela.area = (google.maps.geometry.spherical.computeArea(polygon.getPath())).toFixed(2)
    return parcela;
}

function SerializeMvcArray(mvcArray) {
	let path = [];
	for(let i= 0; i < mvcArray.getLength(); i++)
	{
		path.push(mvcArray.getAt(i).toUrlValue());
	}	
	return path.toString();
}

function SerializeMap() {
	let miMapa = {}; 
	miMapa.zoom = map.getZoom();
	miMapa.center = map.getCenter();
	miMapa.bounds = map.getBounds().toUrlValue(); 
	miMapa.mapType = map.getMapTypeId();
	miMapa.type = 'map';
	
	return miMapa;
}

function CollectTitlesDescriptions () {
	for(let i= 0; i < VectorMisParcelas.length; i++)
	{
	
		VectorMisParcelas[i].nombreParcela = $('#nombreParcela' + (i + 1)).val();
		VectorMisParcelas[i].personaAcargo = $('#personaAcargo' + (i + 1)).val();
		VectorMisParcelas[i].tipoDeCultivo = $('#tipoDeCultivo' + (i + 1)).val(); 
		VectorMisParcelas[i].fechaPlantacion = $('#fechaPlantacion' + (i + 1)).val();
		VectorMisParcelas[i].codigoSemilla = $('#codigoSemilla' + (i + 1)).val();
		VectorMisParcelas[i].tipoRiego = $('#tipoRiego' + (i + 1)).val();

    }

}

function CreateItemList(color,id) { 
	let listaHTML ='<li style="border: 3px solid '+color+'"style="background-color:'+color+'">' +
	
                    '<div><b>Nombre de la parcela:</b></div>'+
					'<input type="text" id="nombreParcela'+id+'"/>'+

					'<div><b>Persona a cargo: <b></div>'+
					'<input type="text" id="personaAcargo'+id+'"/>'+
					
					'<div><b>Tipo de cultivo: <b></div>'+
					'<input type="text" id="tipoDeCultivo'+id+'"/>'+

					'<div><b>Fecha de plantacion:</b></div>'+
					'<input type="date" id="fechaPlantacion'+id+'"/>'+

					'<div><b>Codigo de Semilla: </b></div>'+
					'<input type="text" id="codigoSemilla'+id+'"/>'+

					'<div><b>Tipo de riego: </b></div>'+
					'<input type="text" id="tipoRiego'+id+'"/>'+

				'</li>'+'<hr style="border: 3px solid'+color+';">';
	$('#listOverlay').append($(listaHTML));
}

function get_random_color() {
	var letters = '0123456789ABCDEF'.split('');
	var color = '#';
	for (var i = 0; i < 6; i++ ) {
		color += letters[Math.round(Math.random() * 15)];
	}
	return color;
}


