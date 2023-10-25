<script>
    
  //TOASTR tareas añadidas exitosamente
  function tareaSi() {
        toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    
    // Mostrar una notificación Toastr de error
    toastr.success('Se ha añadido exitosamente!', 'Registrado');
    }
    //TOASTR tareas NO añadidas exitosamente
    function tareaNo(){
         toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    
    // Mostrar una notificación Toastr de error
    toastr.error('Ya existe una tarea con este id, intenta con otro!', 'No se ha podido registrar');
    }
    
    //TOASTR error con el ID
    function errorId() {
        toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    // Mostrar una notificación Toastr de error
    toastr.error('Hubo un error con el id, no existe o no lo digitaste. Intenta de nuevo!', 'No se ha podido registrar');
    }
    
    
    // Función de flecha que se ejecuta inmediatamente.
    (() => {
        'use strict'; // Modo estricto para un código más seguro y eficiente.

        // Selecciona todos los elementos con la clase "needs-validation" y los almacena en la variable "forms".
        const forms = document.querySelectorAll('.needs-validation');

        // Itera sobre cada formulario encontrado.
        Array.from(forms).forEach(form => {
            // Agrega un evento "submit" a cada formulario.
            form.addEventListener('submit', event => {
                // Verifica si el formulario no es válido.
                if (!form.checkValidity()) {
                    event.preventDefault(); // Previene el envío del formulario si no es válido.
                    event.stopPropagation(); // Detiene la propagación del evento para evitar otros manejadores de eventos.
                }
                form.classList.add('was-validated'); // Agrega la clase "was-validated" al formulario.
            }, false);
        });
    })();
    
       var id = ""; //Variable id para eliminar.

    /**
     * Esta función se encarga de mostrar el modal de confirmación antes de eliminar una tarea.
     * Se dispara cuando se muestra el modal.
     */
    $('#eliminar').on('show.bs.modal', function (event) {
    // Obtiene el botón que desencadenó el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el id de la tarea desde el atributo 'data-nombre' del botón
        var idTarea = button.data('nombre');

        // Establece el ID de la tarea en el campo de entrada
        $('#idDel').val(idTarea);

        // Obtiene el modal actual
        var modal = $(this);

        // Almacena el nombre de la tarea en la variable global 'id'
        id = idTarea;
    });

    $('#editar').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var idTarea = button.data('nombre');
    
    // Mostrar el ID de la tarea en el modal
    $('#tareaId').text(idTarea);

    // También puedes almacenar el ID en una variable global si necesitas acceder a él en otros lugares del código.
    tareaId = idTarea;
});

// JavaScript para modal1
$('#editar').on('show.bs.modal', function (event) {
    // Al hacer clic en el botón, pasa la variable tareaId a modal2
    $('#btnPasarVariable').click(function () {
        $('#edTit').data('tareaId', tareaId);
        $('#edTit').modal('show'); // Muestra modal2
    });
    $('#btnPasarVariable1').click(function () {
        $('#edDes').data('tareaId', tareaId);
        $('#edDes').modal('show'); // Muestra modal2
    });
    $('#btnPasarVariable2').click(function () {
        $('#edFec').data('tareaId', tareaId);
        $('#edFec').modal('show'); // Muestra modal2
    });
});
// JavaScript para modal2
$('#edTit').on('show.bs.modal', function (event) {
    // Obtiene la variable pasada desde modal1 y la muestra en modal2
    var tareaId = $('#edTit').data('tareaId');
    $('#idEditar').text(tareaId);
    
    var inputElement = $('#edTit').find('input[name="idEd"]');
    
    inputElement.val($('#idEditar').text());
    
   
});

$('#edDes').on('show.bs.modal', function (event) {
    // Obtiene la variable pasada desde modal1 y la muestra en modal2
    var tareaId = $('#edDes').data('tareaId');
    $('#idEditar').text(tareaId);
    
    var inputElement = $('#edDes').find('input[name="idEd"]');
    
    inputElement.val($('#idEditar').text());
    
   
});

$('#edFec').on('show.bs.modal', function (event) {
    // Obtiene la variable pasada desde modal1 y la muestra en modal2
    var tareaId = $('#edFec').data('tareaId');
    $('#idEditar').text(tareaId);
    
    var inputElement = $('#edFec').find('input[name="idEd"]');
    
    inputElement.val($('#idEditar').text());
    
   
});
 // Obtiene referencias a los botones y opciones
    const showOptionsBtn = document.getElementById("showOptionsBtn");
    const opcionesAdicionales = document.getElementById("opcionesAdicionales");
    const finalSubmitBtn = document.getElementById("finalSubmitBtn");

    // Agrega un controlador de eventos "click" al botón "Agregar Tarea"
    showOptionsBtn.addEventListener("click", function () {
        // Oculta el botón inicial
        showOptionsBtn.style.display = "none";
        // Muestra las opciones adicionales
        opcionesAdicionales.style.display = "block";
        // Muestra el botón final para enviar
        finalSubmitBtn.style.display = "block";
    });
    
</script>
