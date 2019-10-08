//console.log("funcionando")
let respuesta = document.getElementById('respuesta')
let formulario = document.getElementById('formulario')

formulario.addEventListener('submit', function(e){
    console.log("click!")
    e.preventDefault()///comentar esto para verificar 
    let datos = new FormData(formulario)
   /*  console.log(datos)
    console.log(datos.get('user'))
    console.log(datos.get('pass')) */

    fetch('post.php',{
        method: 'POST',
        body: datos
    })
    .then( res => res.json())
    .then( data => {
        console.log(data)
        if(data === "error"){
            respuesta.innerHTML = `
            <div class="alert alert-danger" role="alert">
                ALERTA!! LOS CAMPOS NO DEBEN ESTAR VACIOS
            </div>
           `
        }else{
           respuesta.innerHTML =  `
           <div class="alert alert-primary" role="alert">
               ${data}
           </div>
       `  
        }
    })
})