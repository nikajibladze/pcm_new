function insertFile(formdata) {
    $.ajax({
        type: "POST",
        cache: false,
        url: "core/routes.php",
        data: formdata,
        contentType: false,
        cache: false,
        processData: false,
        success: function (data) {

        }
    });
}
function insertEvent(id) {
    if(!id){
        return false;
    }
    var event_id = $("#id").val();
    if(event_id){
        updateEvent(event_id);
        return;
    }
    var files = $(".event_file").val();
    var form_serial = $("#event_form").serialize();
    var register_user = 1;
    $.ajax({
        type: "POST",
        url: "core/routes.php",
        data: form_serial + '&insert_event=' + 'insert_event',
        success: function (data){
            var res = JSON.parse(data);
            if (files) {
                var image_data = $('.event_file');
                var form_data = new FormData();
                form_data.append('id', res.id);               
                let imageArray = [];
                for (let i = 0; i < image_data.length; i++) {
                    form_data.append(`event_file[${i}]`, image_data[i].files[0]);
                    form_data.append(`insert_file`,'insert_file');
                   
                }
              
                insertFile(form_data);
            }

            if(res.status==200){
                Swal.fire(res.message, '', 'success');
                mainPage();
            }else{
                iziToast.error({
                    title: res.message,
                    position: 'topRight'
                });
                nameValidator();
            }

          
        }
    });
}

function addUser(){

    var user_id = $("#id").val();
    if(user_id){
        alert(user_id);
        updateUser(user_id);
        return;
    }
    var form_serial = $("#add-user-form").serialize();
    var password = Math.floor(1000 + Math.random() * 9000);

    $.ajax({
        type: "POST",
        url: "core/routes.php",
        data: form_serial + '&insert_user=' + 'insert_user'+'&password='+password,
        success: function (data){
            var res = JSON.parse(data);
            if(res.status==200){
                Swal.fire(res.message, '', 'success');
            }else{
                Swal.fire(res.message, '', 'error');
            }
       
        }
    });
}


  function insertCountry(){
        if($("#country_id").val()){
            var id = $("#country_id").val();
            updateCountry(id);
            return false;
        }else{
            var country = $("#country").val();
            $.ajax({
                type: "POST",
                url: "core/routes.php",
                data: {'name' : country, 'insert_country': 'insert_country'},
                success: function (data){
                    var res = JSON.parse(data);
                    if(res.status==200){
                        Swal.fire(res.message, '', 'success');
                        $("#add-country-modal").modal("hide");
                        $("#country-table").DataTable().ajax.reload();
                    }else{
                        Swal.fire(res.message, '', 'error');
                    }
               
                }
            });
        }
  }

  function insertStucture(){
    if($("#structure_id").val()){
        var id = $("#structure_id").val();
        updateStructure(id);
        return false;
    }else{
        var structure = $("#structure").val();
        $.ajax({
            type: "POST",
            url: "core/routes.php",
            data: {'name' : structure, 'insert_structure': 'insert_structure'},
            success: function (data){
                var res = JSON.parse(data);
                if(res.status==200){
                    Swal.fire(res.message, '', 'success');
                    $("#structures-modal").modal("hide");
                    $("#structures-table").DataTable().ajax.reload();
                }else{
                    Swal.fire(res.message, '', 'error');
                }
           
            }
        });
    }
}


function insertDictionaryCooperation(){
    if($("#cooperation_id").val()){
        var id = $("#cooperation_id").val();
        UpdateDictionaryCooperation(id);
        return false;
    }else{
        var name = $("#cooperation_name").val();
        $.ajax({
            type: "POST",
            url: "core/routes.php",
            data: {'name' : name, 'insert_dictionary_cooperation': 'insert_dictionary_cooperation'},
            success: function (data){
                var res = JSON.parse(data);
                if(res.status==200){
                    Swal.fire(res.message, '', 'success');
                    $("#cooperation-modal").modal("hide");
                    $("#cooperation-table").DataTable().ajax.reload();
                }else{
                    Swal.fire(res.message, '', 'error');
                }
           
            }
        });
    }
}


function insertTypeDictionary(){
    if($("#type_id").val()){
        var id = $("#type_id").val();
        UpdateDictionaryType(id);
        return false;
    }else{
        var name = $("#type_name").val();
        $.ajax({
            type: "POST",
            url: "core/routes.php",
            data: {'name' : name, 'insert_dictionary_type': 'insert_dictionary_type'},
            success: function (data){
                var res = JSON.parse(data);
                if(res.status==200){
                    Swal.fire(res.message, '', 'success');
                    $("#types-modal").modal("hide");
                    $("#types-table").DataTable().ajax.reload();
                }else{
                    Swal.fire(res.message, '', 'error');
                }
           
            }
        });
    }
}

function insertDictionaryStatus(){
    if($("#status_id").val()){
        var id = $("#status_id").val();
        UpdateDictionaryStatus(id);
        return false;
    }else{
        var name = $("#status_name").val();
        $.ajax({
            type: "POST",
            url: "core/routes.php",
            data: {'name' : name, 'insert_dictionary_status': 'insert_dictionary_status'},
            success: function (data){
                var res = JSON.parse(data);
                if(res.status==200){
                    Swal.fire(res.message, '', 'success');
                    $("#add-status-modal").modal("hide");
                    $("#status-table").DataTable().ajax.reload();
                }else{
                    Swal.fire(res.message, '', 'error');
                }
           
            }
        });
    }
}


function insertRelationshipDictionary(){
    if($("#relationship_id").val()){
        var id = $("#relationship_id").val();
        UpdateDictionaryRelationship(id);
        return false;
    }else{
        var name = $("#relationship_name").val();
        $.ajax({
            type: "POST",
            url: "core/routes.php",
            data: {'name' : name, 'insert_dictionary_relationship': 'insert_dictionary_relationship'},
            success: function (data){
                var res = JSON.parse(data);
                if(res.status==200){
                    Swal.fire(res.message, '', 'success');
                    $("#add-relations-modal").modal("hide");
                    $("#relationship-table").DataTable().ajax.reload();
                }else{
                    Swal.fire(res.message, '', 'error');
                }
           
            }
        });
    }
}
