var counter =1;
function prevent(event) {
    event.preventDefault();
}

function selectJs(){
    $('.js-example-basic-single').select2({
        placeholder: 'არჩევა',
        allowClear: true
      });
}

function datepickerJs(){
    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true,
            language: 'ka',
            orientation: "bottom left",
            todayBtn: "linked",
           todayHighlight : true,
    });
}
function getFirst()
{
    $('#events-id').dataTable().fnDestroy();
    $('#events-id').DataTable({

        "processing": true,
        "serverSide": true,
        "responsive": true,
        "scrollX": false,
        "serverMethod": "get",
        "autoWidth": false,
        "lengthMenu": [10, 20, 30, 40],
        "deferRender": true,
        "searching": true,
        "ajax": {
            "url": "core/data/events.php"
        },
        "order": [[0, "desc"]],
        "columns": [
            { "data": "name" },
            { "data": "type" },
            { "data": "country" },
            { "data": "relationship" },
            { "data": "structure" },
            { "data": "face" },
            { "data": "cooperation" },
            { "data": "startDate" },
            { "data": "status" },
            { "data": "userName" }
        ],
        "language": {
            "lengthMenu": "",
            "loadingRecords": "მინდინარეობს ჩატვირთვა...",
            "zeroRecords": "ინფორმაცია არ არის",
            "info": "სულ _TOTAL_ ჩანაწერი",
            "infoEmpty": "",
            "loadingRecords": "მიმდინარეობს ჩატვირთვა...",
            "infoFiltered": "(  _MAX_ ჩანაწერიდან)",
            "search": "ძებნა:",
            "paginate": {
                "first": "პირველი",
                "last": "ბოლო",
                "next": "შემდეგი",
                "previous": "უკან"
            }
        }
    });
    $('#events-id tbody').on('dblclick', 'tr', function () {
        var table = $('#events-id').DataTable();
        var data = table.row(this).data();
        addEvent(data.id, 2);
    });

    $('#events-id tbody').on('click', 'tr', function () {
        var table = $('#events-id').DataTable();
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
}


function CountryTable()
{
    $('#country-table').dataTable().fnDestroy();
    $('#country-table').DataTable({
        "processing": true,
        "serverSide": true,
        "responsive": true,
        "scrollX": false,
        "serverMethod": "get",
        "autoWidth": false,
        "lengthMenu": [10, 20, 30, 40],
        "deferRender": true,
        "searching": true,
        "ajax": {
            "url": "core/data/country.php"
        },
        "order": [[0, "desc"]],
        "columns": [
            { "data": "id" },
            { "data": "name" },
            { "data": "edit" }
        ],
        "language": {
            "lengthMenu": "",
            "loadingRecords": "მინდინარეობს ჩატვირთვა...",
            "zeroRecords": "ინფორმაცია არ არის",
            "info": "სულ _TOTAL_ ჩანაწერი",
            "infoEmpty": "",
            "loadingRecords": "მიმდინარეობს ჩატვირთვა...",
            "infoFiltered": "(  _MAX_ ჩანაწერიდან)",
            "search": "ძებნა:",
            "paginate": {
                "first": "პირველი",
                "last": "ბოლო",
                "next": "შემდეგი",
                "previous": "უკან"
            }
        }
    });
    $('#country-table tbody').on('dblclick', 'tr', function () {
        var table = $('#country-table').DataTable();
        var data = table.row(this).data();
        addDictionaryCountry(data.id,data.name, 2);
    });

    $('#country-table tbody').on('click', 'tr', function () {
        var table = $('#country-table').DataTable();
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
}

function StructureTable()
{
    $('#structures-table').dataTable().fnDestroy();
    $('#structures-table').DataTable({
        "processing": true,
        "serverSide": true,
        "responsive": true,
        "scrollX": false,
        "serverMethod": "get",
        "autoWidth": false,
        "lengthMenu": [10, 20, 30, 40],
        "deferRender": true,
        "searching": true,
        "ajax": {
            "url": "core/data/structures.php"
        },
        "order": [[0, "desc"]],
        "columns": [
            { "data": "id" },
            { "data": "name" },
            { "data": "edit" }
        ],
        "language": {
            "lengthMenu": "",
            "loadingRecords": "მინდინარეობს ჩატვირთვა...",
            "zeroRecords": "ინფორმაცია არ არის",
           "info": "სულ _TOTAL_ ჩანაწერი",
            "infoEmpty": "",
            "loadingRecords": "მიმდინარეობს ჩატვირთვა...",
            "infoFiltered": "(  _MAX_ ჩანაწერიდან)",
            "search": "ძებნა:",
            "paginate": {
                "first": "პირველი",
                "last": "ბოლო",
                "next": "შემდეგი",
                "previous": "უკან"
            }
        }
    });
    $('#structures-table tbody').on('dblclick', 'tr', function () {
        var table = $('#structures-table').DataTable();
        var data = table.row(this).data();
        addDictionaryStructures(data.id,data.name, 2);
    });

    $('#structures-table tbody').on('click', 'tr', function () {
        var table = $('#structures-table').DataTable();
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
}

function CooperationTable()
{
    $('#cooperation-table').dataTable().fnDestroy();
    $('#cooperation-table').DataTable({
        "processing": true,
        "serverSide": true,
        "responsive": true,
        "scrollX": false,
        "serverMethod": "get",
        "autoWidth": false,
        "lengthMenu": [10, 20, 30, 40],
        "deferRender": true,
        "searching": true,
        "ajax": {
            "url": "core/data/cooperation.php"
        },
        "order": [[0, "desc"]],
        "columns": [
            { "data": "id" },
            { "data": "name" },
            { "data": "edit" }
        ],
        "language": {
            "lengthMenu": "",
            "loadingRecords": "მინდინარეობს ჩატვირთვა...",
            "zeroRecords": "ინფორმაცია არ არის",
           "info": "სულ _TOTAL_ ჩანაწერი",
            "infoEmpty": "",
            "loadingRecords": "მიმდინარეობს ჩატვირთვა...",
            "infoFiltered": "(  _MAX_ ჩანაწერიდან)",
            "search": "ძებნა:",
            "paginate": {
                "first": "პირველი",
                "last": "ბოლო",
                "next": "შემდეგი",
                "previous": "უკან"
            }
        }
    });
    $('#cooperation-table tbody').on('dblclick', 'tr', function () {
        var table = $('#cooperation-table').DataTable();
        var data = table.row(this).data();
        addDictionaryCooperation(data.id,data.name, 2);
    });

    $('#cooperation-table tbody').on('click', 'tr', function () {
        var table = $('#cooperation-table').DataTable();
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
}


function TypesTable()
{
    $('#types-table').dataTable().fnDestroy();
    $('#types-table').DataTable({
        "processing": true,
        "serverSide": true,
        "responsive": true,
        "scrollX": false,
        "serverMethod": "get",
        "autoWidth": false,
        "lengthMenu": [10, 20, 30, 40],
        "deferRender": true,
        "searching": true,
        "ajax": {
            "url": "core/data/types.php"
        },
        "order": [[0, "desc"]],
        "columns": [
            { "data": "id" },
            { "data": "name" },
            { "data": "edit" }
        ],
        "language": {
            "lengthMenu": "",
            "loadingRecords": "მინდინარეობს ჩატვირთვა...",
            "zeroRecords": "ინფორმაცია არ არის",
           "info": "სულ _TOTAL_ ჩანაწერი",
            "infoEmpty": "",
            "loadingRecords": "მიმდინარეობს ჩატვირთვა...",
            "infoFiltered": "(  _MAX_ ჩანაწერიდან)",
            "search": "ძებნა:",
            "paginate": {
                "first": "პირველი",
                "last": "ბოლო",
                "next": "შემდეგი",
                "previous": "უკან"
            }
        }
    });
    $('#types-table tbody').on('dblclick', 'tr', function () {
        var table = $('#types-table').DataTable();
        var data = table.row(this).data();
        addDictionaryTypes(data.id,data.name, 2);
    });

    $('#types-table tbody').on('click', 'tr', function () {
        var table = $('#types-table').DataTable();
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
}


function RelationshipTable()
{
    $('#relationship-table').dataTable().fnDestroy();
    $('#relationship-table').DataTable({
        "processing": true,
        "serverSide": true,
        "responsive": true,
        "scrollX": false,
        "serverMethod": "get",
        "autoWidth": false,
        "lengthMenu": [10, 20, 30, 40],
        "deferRender": true,
        "searching": true,
        "ajax": {
            "url": "core/data/relationship.php"
        },
        "order": [[0, "desc"]],
        "columns": [
            { "data": "id" },
            { "data": "name" },
            { "data": "edit" }
        ],
        "language": {
            "lengthMenu": "",
            "loadingRecords": "მინდინარეობს ჩატვირთვა...",
            "zeroRecords": "ინფორმაცია არ არის",
           "info": "სულ _TOTAL_ ჩანაწერი",
            "infoEmpty": "",
            "loadingRecords": "მიმდინარეობს ჩატვირთვა...",
            "infoFiltered": "(  _MAX_ ჩანაწერიდან)",
            "search": "ძებნა:",
            "paginate": {
                "first": "პირველი",
                "last": "ბოლო",
                "next": "შემდეგი",
                "previous": "უკან"
            }
        }
    });
    $('#relationship-table tbody').on('dblclick', 'tr', function () {
        var table = $('#relationship-table').DataTable();
        var data = table.row(this).data();
        addDictionaryRelationship(data.id,data.name, 2);
    });

    $('#relationship-table tbody').on('click', 'tr', function () {
        var table = $('#relationship-table').DataTable();
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
}


function StatusTable()
{
    $('#status-table').dataTable().fnDestroy();
    $('#status-table').DataTable({
        "processing": true,
        "serverSide": true,
        "responsive": true,
        "scrollX": false,
        "serverMethod": "get",
        "autoWidth": false,
        "lengthMenu": [10, 20, 30, 40],
        "deferRender": true,
        "searching": true,
        "ajax": {
            "url": "core/data/status.php"
        },
        "order": [[0, "desc"]],
        "columns": [
            { "data": "id" },
            { "data": "name" },
            { "data": "edit" }
        ],
        "language": {
            "lengthMenu": "",
            "loadingRecords": "მინდინარეობს ჩატვირთვა...",
            "zeroRecords": "ინფორმაცია არ არის",
           "info": "სულ _TOTAL_ ჩანაწერი",
            "infoEmpty": "",
            "loadingRecords": "მიმდინარეობს ჩატვირთვა...",
            "infoFiltered": "(  _MAX_ ჩანაწერიდან)",
            "search": "ძებნა:",
            "paginate": {
                "first": "პირველი",
                "last": "ბოლო",
                "next": "შემდეგი",
                "previous": "უკან"
            }
        }
    });
    $('#status-table tbody').on('dblclick', 'tr', function () {
        var table = $('#status-table').DataTable();
        var data = table.row(this).data();
        addDictionaryStatus(data.id,data.name, 2);
    });

    $('#status-table tbody').on('click', 'tr', function () {
        var table = $('#status-table').DataTable();
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
}

function UsersTable()
{
    $('#users-table').dataTable().fnDestroy();
    $('#users-table').DataTable({
        "processing": true,
        "serverSide": true,
        "responsive": true,
        "scrollX": false,
        "serverMethod": "get",
        "autoWidth": false,
        "lengthMenu": [10, 20, 30, 40],
        "deferRender": true,
        "searching": true,
        "ajax": {
            "url": "core/data/users.php"
        },
        "order": [[0, "desc"]],
        "columns": [
            { "data": "id" },
            { "data": "name" },
            { "data": "lastname" },
            { "data": "username" },
            { "data": "structure" },
            { "data": "role" },
            { "data": "edit" }
        ],
        "language": {
            "lengthMenu": "",
            "loadingRecords": "მინდინარეობს ჩატვირთვა...",
            "zeroRecords": "ინფორმაცია არ არის",
           "info": "სულ _TOTAL_ ჩანაწერი",
            "infoEmpty": "",
            "loadingRecords": "მიმდინარეობს ჩატვირთვა...",
            "infoFiltered": "(  _MAX_ ჩანაწერიდან)",
            "search": "ძებნა:",
            "paginate": {
                "first": "პირველი",
                "last": "ბოლო",
                "next": "შემდეგი",
                "previous": "უკან"
            }
        }
    });
    $('#users-table tbody').on('dblclick', 'tr', function () {
        var table = $('#users-table').DataTable();
        var data = table.row(this).data();
        addEditUser(data.id, 2);
    });

    $('#users-table tbody').on('click', 'tr', function () {
        var table = $('#users-table').DataTable();
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
}



function getCountries() {
    $.ajax({
        type: "GET",
        url: "core/routes.php",
        data: {
            "countries": "countries"
        },
        dataType: "html",
        success: function (data) {

            var objects = JSON.parse(data);

            $.each(objects, function (key, blood) {
                $("#country").append("<option value=" + blood.id + ">" + blood.name + "</option>");

            })

        }
    });
}

function getCountriesFill(id) {
    $.ajax({
        type: "GET",
        url: "core/routes.php",
        data: {
            "countries": "countries"
        },
        dataType: "html",
        success: function (data) {

            var objects = JSON.parse(data);

            $.each(objects, function (key, blood) {
                $(`#${id}`).append("<option value=" + blood.id + ">" + blood.name + "</option>");
            })

        }
    });
}



function getCountriesAppend(id) {
    $.ajax({
        type: "GET",
        url: "core/routes.php",
        data: {
            "countries": "countries"
        },
        dataType: "html",
        success: function (data) {

            var objects = JSON.parse(data);

            $.each(objects, function (key, blood) {
                $("#countries_"+id).append("<option value=" + blood.id + ">" + blood.name + "</option>");

            })

        }
    });
}


function getCooperations() {
    $.ajax({
        type: "GET",
        url: "core/routes.php",
        data: {
            "cooperations": "cooperations"
        },
        dataType: "html",
        success: function (data) {

            var objects = JSON.parse(data);

            $.each(objects, function (key, blood) {
                $("#cooperation").append("<option value=" + blood.id + ">" + blood.name + "</option>");

            })

        }
    });
}


function getStructures() {
    $.ajax({
        type: "GET",
        url: "core/routes.php",
        data: {
            "structures": "structures"
        },
        dataType: "html",
        success: function (data) {

            var objects = JSON.parse(data);

            $.each(objects, function (key, blood) {
                $("#structures").append("<option value=" + blood.id + ">" + blood.name + "</option>");

            })

        }
    });
}

function getRealitons() {
    $.ajax({
        type: "GET",
        url: "core/routes.php",
        data: {
            "relations": "relations"
        },
        dataType: "html",
        success: function (data) {

            var objects = JSON.parse(data);

            $.each(objects, function (key, blood) {
                $("#relations").append("<option value=" + blood.id + ">" + blood.name + "</option>");

            })

        }
    });
}

function getStatus() {
    $.ajax({
        type: "GET",
        url: "core/routes.php",
        data: {
            "status": "status"
        },
        dataType: "html",
        success: function (data) {

            var objects = JSON.parse(data);

            $.each(objects, function (key, blood) {
                $("#status").append("<option value=" + blood.id + ">" + blood.name + "</option>");

            })

        }
    });
}
function getTypes() {
    $.ajax({
        type: "GET",
        url: "core/routes.php",
        data: {
            "types": "types"
        },
        dataType: "html",
        success: function (data) {

            var objects = JSON.parse(data);

            $.each(objects, function (key, blood) {
                $("#types").append("<option value=" + blood.id + ">" + blood.name + "</option>");

            })

        }
    });
}


function mainReportForm() {

    $.ajax({
        type: "POST",
        url: "pages/reports/form.php",
        success: function (data) {
            $("#bottom-content").html(data);
            getCountries();
            getCooperations();
            getStructures();
            getRealitons();
            getStatus();
            getTypes()
            selectJs();
            datepickerJs();


        }
    });

}

function mainSearch() {

    $.ajax({
        type: "POST",
        url: "pages/search.php",
        success: function (data) {
            $("#top-content").html(data);
            getCountries();
            getCooperations();
            getStructures();
            getRealitons();
            getStatus();
            getTypes()
            selectJs();
            datepickerJs();


        }
    });

}


function reportsPage() {

    $.ajax({
        type: "POST",
        url: "pages/reports/report.php",
        success: function (data) {
            $("#bottom-content").html('');
            addEventTop();
            mainReportForm();
            eventCounters();
        }
    });

}

function mainPage(role) {

    $.ajax({
        type: "POST",
        url: "pages/main.php",
        success: function (data) {
            $("#bottom-content").html(data);
            mainSearch();
            getFirst();   
            notifications(); 
            $("#role_id").val(role);      
        }
    });

}
function UsersTop(){
    $.ajax({
        type: "POST",
        url: "pages/users/user-top.php",
        success: function (data) {
            $("#top-content").html(data);
                  
        }
    });
}
function Users(){
    $.ajax({
        type: "POST",
        url: "pages/users/user-bottom.php",
        success: function (data) {
            $("#bottom-content").html(data);
            UsersTop();   
            UsersTable();
        }
    });
}

function addEventTop(){
    
    $.ajax({
        type: "POST",
        url: "pages/events/addEventTop.php",
        success: function (data) {
            $("#top-content").html(data);            
        

           
        }
    });
}

function addEvent(id,action){

    var roleId = $("#role_id").val();
    var userId = $("#user_id").val();
    $("#top-content").html("<div class='section-titles'><img src='assets/images/planner.png'><span> ღონისძიების დამატება</span></div>");
  

    $.ajax({
        type: "POST",
        url: "pages/events/addEvent.php",
        async:false,
        cache: false,
        success: function (data) {
            $("#bottom-content").html(data);  
          
            addEventTop();          
            getCountries();
            getCooperations();
            getStructures();
            getRealitons();
            getStatus();
            getTypes();
            selectJs();
            datepickerJs();
            if(action==2){
                eventsData(id, action);
                $("#add-event").html('<i class="fa fa-edit" aria-hidden="true"></i> რედაქტირება');
        
                
            }else{
                $("#clone-btn").remove();
            }
            if(roleId==3){
                $("#btn-row").remove();
            }
            $("#action-method").val(action);
            
        }
    });
}

function getDictionaryBottom(){
    $.ajax({
        type: "POST",
        url: "pages/dictionary/dictionary-bottom.php",
        success: function (data) {
            $("#bottom-content").html(data);
       
        }
    });
}



function AdditionalFields(){
    var method= $("#action-method").val();
    var display = "";
    if(method==2){
         display = "";
    }else{
        display = "d-none";
    }
    $("#select2_test").append(`
    <div id='append_main_div_${counter}' class="append_main_div">
    <div class="col-xl-3 col-lg-3 col-md-3 mb-1" id='country_main_${counter}'>
    <label for="users-list-verified">ქვეყნები</label>
    <fieldset class="form-group">
        <select class="form-control" id="countries_${counter}" name="countries[]">
          
        </select>
    </fieldset>
</div>

<div class="col-xl-3 col-lg-3 col-md-3 mb-1" id='calendar_main_${counter}'>
                <fieldset class="form-group">
                    <label for="calendar${counter}">დაწყების კალენდარი</label>
                    <input type="text" class="form-control datepicker" name="additional_dateFrom[]" id="calendar${counter}">
                </fieldset>
            </div>

            <div class="col-xl-3 col-lg-3 col-md-5 mb-1" id='calendar_main_${counter}'>
                <fieldset class="form-group">
                    <label for="calendar${counter}">დასრულების კალენდარი</label>
                    <input type="text" class="form-control datepicker" name="additional_dateTo[]" id="calendar_to${counter}">
                </fieldset>
            </div>

            
<div class="col-xl-1 col-lg-1 col-md-1 mb-1" style="text-align: center;padding-top: 25px;">
<button type="button" onclick="removeCountry(${counter})" class="btn btn-float btn-float-sm btn-outline-danger "><i class="fa fa-times"></i></button>
</div>

<div class="col-xl-1 col-lg-1 col-md-1 mb-1 ${display}" style="text-align: center;padding-top: 25px;">
<button type="button" onclick="editCountry(${counter})" class="btn btn-float btn-float-sm btn-outline-success "><i class="fa fa-check"></i></button>
</div>


</div>




`);
    getCountriesAppend(counter);
    $("#countries_"+counter).select2({
        placeholder: 'არჩევა',
        allowClear: true
      });

      $("#calendar"+counter).datepicker({
        autoclose: true,
        todayBtn: true,
        format: 'yyyy-mm-dd',
        todayHighlight: true,
        language: 'ka'
    });

    
    $("#calendar_to"+counter).datepicker({
        autoclose: true,
        todayBtn: true,
        format: 'yyyy-mm-dd',
        todayHighlight: true,
        language: 'ka'
    });



      counter++;
}

function removeCountry(id){
   var id = $("#country_id_"+id).val();

    Swal.fire({
        title: 'შეტყობინება',
        icon: 'info',
        html:
            'ნამდვილად გსურთ ჩანაწერის წაშლა?',
        showCloseButton: true,
        showCancelButton: true,
        focusConfirm: false,
        confirmButtonText:
            'კი',
        confirmButtonAriaLabel: 'Thumbs up, great!',
        cancelButtonText:
            'არა',
        cancelButtonAriaLabel: 'Thumbs down'
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            $.ajax({
                type: "POST",
                url: "core/routes.php",
                data:{"id":id, "remove_country":"remove_country"},
                success: function (data) {
                   
               
                }
            });
            $(`#append_main_div_${id}`).remove();
        } else if (result.isDenied) {
            
        }
    })

}


function editCountry(id){
    var id = $("#country_id_"+id).val();
    var country = $("#countries_"+id).val();
    var calendar = $("#calendar"+id).val();
    var calendar_to = $("#calendar_to"+id).val();

    Swal.fire({
        title: 'შეტყობინება',
        icon: 'info',
        html:
            'ნამდვილად გსურთ დამატებითი ქვეყნის რედაქტირება?',
        showCloseButton: true,
        showCancelButton: true,
        focusConfirm: false,
        confirmButtonText:
            'კი',
        confirmButtonAriaLabel: 'Thumbs up, great!',
        cancelButtonText:
            'არა',
        cancelButtonAriaLabel: 'Thumbs down'
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            $.ajax({
                type: "POST",
                url: "core/routes.php",
                data:{
                "id":id,
                "country":country,
                "calendar":calendar,
                "calendar_to":calendar_to, 
                "update_country_event":"update_country_event"},
                success: function (data) {
                    var res = JSON.parse(data);

                    if(res.status==200){
                        Swal.fire(res.message, '', 'success');
                    }else{
                        Swal.fire(res.message, '', 'error');
                    }
               
                }
            });
            //$(`#append_main_div_${id}`).remove();
        } else if (result.isDenied) {
            
        }
    })

}


function getDictionaryCountry(id){
    $.ajax({
        type: "POST",
        url: "pages/dictionary/data/country.php",
        success: function (data) {
            $("#country-content").html(data);
            CountryTable();
        }
    });

}


function getDictionaryStructure(id){
    $.ajax({
        type: "POST",
        url: "pages/dictionary/data/structures.php",
        success: function (data) {
            $("#structure-content").html(data);
            StructureTable();
        }
    });

}
function getDictionaryCooperation(id){
    $.ajax({
        type: "POST",
        url: "pages/dictionary/data/cooperation.php",
        success: function (data) {
            $("#cooperation-content").html(data);
            CooperationTable();
        }
    });

}

function getDictionaryTypes(id){
    $.ajax({
        type: "POST",
        url: "pages/dictionary/data/types.php",
        success: function (data) {
            $("#types-content").html(data);
            TypesTable();
        }
    });

}

function getDictionaryRelationships(id){
    $.ajax({
        type: "POST",
        url: "pages/dictionary/data/relationship.php",
        success: function (data) {
            $("#relationship-content").html(data);
            RelationshipTable();
        }
    });

}

function getDictionaryStatus(id){
    $.ajax({
        type: "POST",
        url: "pages/dictionary/data/status.php",
        success: function (data) {
            $("#status-content").html(data);
            StatusTable();
        }
    });

}


function getDictionary(id){
    $.ajax({
        type: "POST",
        url: "pages/dictionary/dictionary-top.php",
        success: function (data) {
            $("#top-content").html(data);
            getDictionaryBottom();
          $("#dictionary-country-link").click();
         
        }
    });
}


function addEditUser(id,action) {
    $("#users-modal").modal("show");
    $.ajax({
        type: "POST",
        url: "pages/users/edit/edit.php",
        success: function (data) {
            $("#user-modal-body").html(data);
            selectJs();
            getStructures();
            if(action==2){
                editUser(id);
            }
        }
    });
}

function addDictionaryCountry(id,name,action){
    $("#add-country-modal").modal("show");
    if(action==2){
        $("#country").val(name);
        $("#country_id").val(id);
        $(".country-title").html("ქვეყანა - რედაქტირება");
    }else{
        $("#country").val("");
        $("#country_id").val("");
        $(".country-title").text("ქვეყანა - დამატება");
    }
}


function addDictionaryStructures(id,name,action){
    $("#structures-modal").modal("show");
    if(action==2){
        $("#structure").val(name);
        $("#structure_id").val(id);
        $(".structure-title").html("სტრუქტურა - რედაქტირება");
    }else{
        $("#structure").val("");
        $("#structure_id").val("");
        $(".structure-title").text("სტრუქტურა - დამატება");
    }
}

function addDictionaryCooperation(id,name,action){
    $("#cooperation-modal").modal("show");
    if(action==2){
        $("#cooperation_name").val(name);
        $("#cooperation_id").val(id);
        $(".structure-title").html("სტრუქტურა - რედაქტირება");
    }else{
        $("#cooperation_name").val("");
        $("#cooperation_id").val("");
        $(".structure-title").text("სტრუქტურა - დამატება");
    }
}


function addDictionaryTypes(id,name,action){
    $("#types-modal").modal("show");
    if(action==2){
        $("#type_name").val(name);
        $("#type_id").val(id);
        $(".structure-title").html("სტრუქტურა - რედაქტირება");
    }else{
        $("#type_name").val("");
        $("#type_id").val("");
        $(".structure-title").text("სტრუქტურა - დამატება");
    }
}


function addDictionaryRelationship(id,name,action){
    $("#add-relations-modal").modal("show");
    if(action==2){
        $("#relationship_name").val(name);
        $("#relationship_id").val(id);
        $(".structure-title").html("სტრუქტურა - რედაქტირება");
    }else{
        $("#relationship_name").val("");
        $("#relationship_id").val("");
        $(".structure-title").text("სტრუქტურა - დამატება");
    }
}


function addDictionaryStatus(id,name,action){
    $("#add-status-modal").modal("show");
    if(action==2){
        $("#status_name").val(name);
        $("#status_id").val(id);
        $(".structure-title").html("სტრუქტურა - რედაქტირება");
    }else{
        $("#status_name").val("");
        $("#status_id").val("");
        $(".structure-title").text("სტრუქტურა - დამატება");
    }
}

function editPass(id){
    $("#generate-pass-modal").modal("show");
    $.ajax({
        type: "POST",
        url: "pages/users/edit/generate.php",
        success: function (data) {
            $("#generate-modal-body").html(data);
          
        }
    });
}

function removeDictionary(record,id){

    Swal.fire({
        title: 'შეტყობინება',
        icon: 'info',
        html:
            'ნამდვილად გსურთ ჩანაწერის წაშლა?',
        showCloseButton: true,
        showCancelButton: true,
        focusConfirm: false,
        confirmButtonText:
            'კი',
        confirmButtonAriaLabel: 'Thumbs up, great!',
        cancelButtonText:
            'არა',
        cancelButtonAriaLabel: 'Thumbs down'
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            $.ajax({
                type: "POST",
                url: "core/routes.php",
                data:{"record":record,"id":id,"remove_record":"remove_record"},
                success: function (data) {
                    var res = JSON.parse(data);
                    Swal.fire(res.message, '', 'success');
                    if(record=="countries"){
                        $("#country-table").DataTable().ajax.reload();
                    }else if(record=="structures"){
                        $("#structures-table").DataTable().ajax.reload();
                    }
                    else if(record=="cooperations"){
                        $("#cooperation-table").DataTable().ajax.reload();
                    }
                    else if(record=="types"){
                        $("#types-table").DataTable().ajax.reload();
                    }
                    else if(record=="relations"){
                        $("#relationship-table").DataTable().ajax.reload();
                    }
                    else if(record=="status"){
                        $("#status-table").DataTable().ajax.reload();
                    }

                }
            });
        } else if (result.isDenied) {
            
        }
    })


    

}

function search(){
    var form_serial = $("#search-form").serialize();
    $('#events-id').dataTable().fnDestroy();
    $('#events-id').DataTable({
        "processing": true,
        "serverSide": true,
        "responsive": true,
        "scrollX": false,
        "serverMethod": "get",
        "autoWidth": false,
        "lengthMenu": [10, 20, 30, 40],
        "deferRender": true,
        "searching": true,
        "ajax": {
            "url": "core/data/search.php?"+form_serial
        },
        "order": [[0, "desc"]],
        "columns": [
            { "data": "name" },
            { "data": "type" },
            { "data": "country" },
            { "data": "relationship" },
            { "data": "structure" },
            { "data": "face" },
            { "data": "cooperation" },
            { "data": "startDate" },
            { "data": "status" },
            { "data": "edit" }
        ],
        "language": {
            "lengthMenu": "",
            "loadingRecords": "მინდინარეობს ჩატვირთვა...",
            "zeroRecords": "ინფორმაცია არ არის",
            "infoEmpty": "",
            "info": "სულ _TOTAL_ ჩანაწერი",
            "loadingRecords": "მიმდინარეობს ჩატვირთვა...",
            "infoFiltered": "(  _MAX_ ჩანაწერიდან)",
            "search": "ძებნა:",
            "paginate": {
                "first": "პირველი",
                "last": "ბოლო",
                "next": "შემდეგი",
                "previous": "უკან"
            }
        }
    });
    $('#events-id tbody').on('dblclick', 'tr', function () {
        var table = $('#events-id').DataTable();
        var data = table.row(this).data();
        addEvent(data.id, 2);
    });

    $('#events-id tbody').on('click', 'tr', function () {
        var table = $('#events-id').DataTable();
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
}


function reportSearch(){
    var form_serial = $("#report-form").serialize();
    $('#report-table-id').dataTable().fnDestroy();
    $('#report-table-id').DataTable({
        "processing": true,
        "serverSide": true,
        "responsive": true,
        "scrollX": false,
        "serverMethod": "get",
        "autoWidth": false,
        "lengthMenu": [10, 20, 30, 40],
        "deferRender": true,
        "searching": true,
        "ajax": {
            "url": "core/data/search.php?"+form_serial
        },
        "order": [[0, "desc"]],
        "columns": [
            { "data": "name" },
            { "data": "type" },
            { "data": "country" },
            { "data": "relationship" },
            { "data": "structure" },
            { "data": "face" },
            { "data": "cooperation" },
            { "data": "startDate" },
            { "data": "status" },
            { "data": "edit" }
        ],
        "language": {
            "lengthMenu": "",
            "loadingRecords": "მინდინარეობს ჩატვირთვა...",
            "zeroRecords": "ინფორმაცია არ არის",
            "infoEmpty": "",
            "info": "სულ _TOTAL_ ჩანაწერი",
            "loadingRecords": "მიმდინარეობს ჩატვირთვა...",
            "infoFiltered": "(  _MAX_ ჩანაწერიდან)",
            "search": "ძებნა:",
            "paginate": {
                "first": "პირველი",
                "last": "ბოლო",
                "next": "შემდეგი",
                "previous": "უკან"
            }
        }
    });
    $('#report-table-id tbody').on('dblclick', 'tr', function () {
        var table = $('#report-table-id').DataTable();
        var data = table.row(this).data();
        addEvent(data.id, 2);
    });

    $('#report-table-id tbody').on('click', 'tr', function () {
        var table = $('#report-table-id').DataTable();
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
}


function clone(){

    Swal.fire({
        title: 'შეტყობინება',
        icon: 'info',
        html:
            'ნამდვილად გსურთ ღონისძიების დაკლონვა?',
        showCloseButton: true,
        showCancelButton: true,
        focusConfirm: false,
        confirmButtonText:
            'კი',
        cancelButtonText:
            'არა'
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            Swal.fire('თქვენ დაკლონეთ ღონისძიება', '', 'warning');
            $("#add-event").html('<i class="fa fa-edit" aria-hidden="true"></i> დამატება');
            $("#id").val("");
            $("#clone-btn").remove();
        } 
    })


   
}

function districtDate(id){
    var year =new Date().getFullYear();
    $("#districtId").val(id);
    
   
    var startDate ="";
    var endDate ="";
    if(id==1){
        startDate =year+'-'+'01'+'-'+'01';
         endDate =year+'-'+'03'+'-'+'01';
    }
    if(id==2){
        startDate =year+'-'+'04'+'-'+'01';
         endDate =year+'-'+'06'+'-'+'30';
    }
    if(id==3){
        startDate =year+'-'+'07'+'-'+'01';
         endDate =year+'-'+'09'+'-'+'30';
    }
    if(id==4){
        startDate =year+'-'+'10'+'-'+'01';
         endDate =year+'-'+'12'+'-'+'31';
    }

    $(`#startDate`).datepicker('update', startDate);
    $(`#endDate`).datepicker('update', endDate);
}

function exportExcell() {
    reportSearch();
    var form_serial = $("#report-form").serialize();
    var loading = 'ჩატვირთვა <i class="fa fa-spinner fa-pulse fa-fw"></i>';
    var finished = 'ექსპორტი <i class="fa fa-line-chart"></i>';
    $("#report-btn").prop("disabled",true);
    $("#report-btn").html(loading);
    $.ajax({
        type: "POST",
        data:form_serial,
        xhrFields: {
            responseType: 'arraybuffer'
        },
        url: 'core/xlsx.php',
        success: function (data, status, xhr) {
            let exTension = xhr.getResponseHeader('Content-Type');
            let disposition = xhr.getResponseHeader('content-disposition');
            let fileName = disposition.split('filename=')[1].split(';')[0];
            let matches = /"([^"]*)"/.exec(disposition);
            let filename = (matches != null && matches[1] ? matches[1] : fileName);
            // The actual download
            let blob = new Blob([data], {
                type: xhr.getResponseHeader('Content-Type')
            });
            let link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);
            link.download = filename;
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            $("#report-btn").prop("disabled",false);
            $("#report-btn").html(finished);
        }
    });
}