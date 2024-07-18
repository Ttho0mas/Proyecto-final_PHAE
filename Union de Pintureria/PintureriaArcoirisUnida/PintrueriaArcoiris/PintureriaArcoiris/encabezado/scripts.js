document.addEventListener('DOMContentLoaded', function() {
    
    const botonlogo = document.querySelector('.logo img');
    const Pinturas = document.getElementById('Apinturas');
    const Accesorios = document.getElementById('Aaccesorios');
    const Herramientas = document.getElementById('Aherramientas');
    const Usuarios = document.getElementById('Ausuarios');

    const divSubCategoriaPinturas = document.querySelectorAll('.div-subcategoria-pinturas');
    const divSubCategoriaAccesorios = document.querySelectorAll('.div-subcategoria-accesorios');
    const divSubCategoriaHerramientas = document.querySelectorAll('.div-subcategoria-herramientas');
    const divSubCategoriaUsuarios = document.querySelectorAll('.div-subcategoria-usuarios');

  
   

//Funcion para que al tocar el logo se nos redireccione a la pagina inicial: 

    botonlogo.addEventListener('dblclick', function() {
        window.location.href = '/ProyectoPintureria/index.php';
    });


/*🦖🐊🦎*/
//Funciones de control de las subcategorias de Pinturas:

    Pinturas.addEventListener('click', function(event) {
        if (event.detail === 2) return;

       setTimeout(function() {
          
            if (event.detail !== 2) {
                divSubCategoriaPinturas.forEach(function(subCat) {
                    subCat.style.display = 'none';
                });
               

                const subCat = Pinturas.nextElementSibling;
                subCat.style.display = subCat.style.display === 'block' ? 'none' : 'block';
            }

        }, 200);
        
    });

    // Para ocultar las subcategorias de Pinturas si se hace clic fuera del menu
    window.addEventListener('click', function(evento) {
        if (!evento.target.matches('#Apinturas')) {
            divSubCategoriaPinturas.forEach(function(subCat) {
                if (subCat.style.display === 'block') {
                    subCat.style.display = 'none';
                }
            });
        }
    });


    
    Pinturas.addEventListener('dblclick', function() {
        window.location.href = '/ProyectoPintureria/categorias-productos/pinturas.php';
    });

 
   
/*🦖🐊🦎*/ 

//Funciones de control de las subcategorias de Accesorios:

    Accesorios.addEventListener('click', function(event) {
        if (event.detail === 2) return;

        setTimeout(function() {
            if (event.detail !== 2) {
                divSubCategoriaAccesorios.forEach(function(subCat) {
                    subCat.style.display = 'none';
                });
                const subCat = Accesorios.nextElementSibling;
                subCat.style.display = subCat.style.display === 'block' ? 'none' : 'block';
            }
        }, 200);
    });

    // Para ocultar las subcategorias de Accesorios si se hace clic fuera del menu
    
    window.addEventListener('click', function(evento) {
        if (!evento.target.matches('#Aaccesorios')) {
            divSubCategoriaAccesorios.forEach(function(subCat) {
                if (subCat.style.display === 'block') {
                    subCat.style.display = 'none';
                }
            });
        }
    });


    Accesorios.addEventListener('dblclick', function() {
        window.location.href = '/ProyectoPintureria/categorias-productos/accesorios.php';
    });


/*🦖🐊🦎*/ 

// Funciones de control de las subcategorias de Herramientas:

    Herramientas.addEventListener('click', function(event) {
        if (event.detail === 2) return;

        setTimeout(function() {
            if (event.detail !== 2) {
                divSubCategoriaHerramientas.forEach(function(subCat) {
                    subCat.style.display = 'none';
                });
                const subCat = Herramientas.nextElementSibling;
                subCat.style.display = subCat.style.display === 'block' ? 'none' : 'block';
            }
        }, 200);
    });

  
   // Para ocultar las subcategorias de Herramientas si se hace clic fuera del menu
    window.addEventListener('click', function(evento) {
        if (!evento.target.matches('#Aherramientas')) {
            divSubCategoriaHerramientas.forEach(function(subCat) {
                if (subCat.style.display === 'block') {
                    subCat.style.display = 'none';
                }
            });
        }
    }); 

     
    Herramientas.addEventListener('dblclick', function() {
        window.location.href = '/ProyectoPintureria/categorias-productos/herramientas.php';
    });
    });


/*🦖🐊🦎*/ 

// Funciones de control de las opciones de Usuarios:

    Usuarios.addEventListener('click', function(event) {
    if (event.detail === 2) return;

    setTimeout(function() {
        if (event.detail !== 2) {
            divSubCategoriaUsuarios.forEach(function(subCat) {
                subCat.style.display = 'none';
            });
            const subCat = Usuarios.nextElementSibling;
            subCat.style.display = subCat.style.display === 'block' ? 'none' : 'block';
        }
    }, 200);
    });

    // Para ocultar las opciones de los usuarios si se hace clic fuera del menu
    window.addEventListener('click', function(evento) {
        if (!evento.target.matches('#Ausuarios')) {
            divSubCategoriaUsuarios.forEach(function(subCat) {
                if (subCat.style.display === 'block') {
                    subCat.style.display = 'none';
                }
            });
        }
    });


    Usuarios.addEventListener('dblclick', function() {
        window.location.href = '7ProyectoPintureria/login-registro/registro.php';
    });
