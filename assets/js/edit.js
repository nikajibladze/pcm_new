function getEventStructures(id) {
    var newrole = [];
    var vaxo;
    var structures = [];
    $.ajax({
        type: "GET",
        async: false,
        url: "core/routes.php",
        data: {
            "id": id,
            "get_event_structures": "get_event_structures"
        },

        success: function (data) {
            //console.log(data);
            var ragaca = JSON.parse(data);
            vaxo = ragaca;

        }

    });
    var roles = vaxo;
    for (var i = 0; i < roles.length; i++) {
        structures[i] = roles[i].structureId;
    }

    return structures;
}

function getEventFile(id) {

    $.ajax({
        type: "POST",
        url: "core/routes.php",
        data: {
            "id": id,
            "get_event_file": "get_event_file"
        },
        dataType: "html",
        success: function (data) {
            var file = JSON.parse(data);
            var counter = 1;
            $.each(file, function (item, value) {
                var name = '';
                if (value.id) {

                    var ext = value.storageName;
                    var ext2 = ext.split('.');
                    name = value.name + '.' + ext2[1];
                    $("#file-table").append(`
                    <tr id="parent-file-tr-${counter}">
                    <td><div class='d-flex'><img src='assets/images/icons/${ext2[1]}.png' class='mr-1'><span>${value.name}</span></div></td>
                    <td><a href='core/download.php?file=${value.storageName}&filename=${value.name}' id='file-download-id' target='_blank'><i class="fa fa-download" aria-hidden="true"></i> ჩამოტვირთვა</a></td>
                    <td><span class='fa fa-times file-times' id='file-tr-${counter}' onclick='removeNoseFile(this.id,${value.id})'></span></td>
                    </tr>
                    `);
                    // $("#test123").prepend("<div class='col-12' id='parent-attached-file" + counter + "'> <div class='form-group'> <label>მიმაგრებული ფაილი</label> <a href='core/download.php?file='" + value.file_storage_name + "'&filename='" + value.file_original_name + "'id='file-download-id' target='_blank'>" + value.file_original_name + '.' + ext2[1] + "</a> <span class='fa fa-times file-times' id='attached-file" + counter + "' onclick='removeNoseFile(this.id)'></span></div> </div>");
                    $("#files-table").css("display", "table");
                    // $("#file-download-id").attr('href', 'core/download.php?file=' + value.file_storage_name + '&filename=' + value.file_original_name);
                    // $("#file-download-id").text(value.file_original_name + '.' + ext2[1]);
                    counter++;
                }



            });

        }
    });
}

function getEventCooperations(id) {
    var newrole = [];
    var vaxo;
    var structures = [];
    $.ajax({
        type: "GET",
        async: false,
        url: "core/routes.php",
        data: {
            "id": id,
            "get_event_cooperations": "get_event_cooperations"
        },

        success: function (data) {
            //console.log(data);
            var ragaca = JSON.parse(data);
            vaxo = ragaca;

        }

    });
    var roles = vaxo;
    for (var i = 0; i < roles.length; i++) {
        structures[i] = roles[i].cooperationId;
    }

    return structures;
}

function eventsData(id, action) {
    $("#main-load-div").css("display", "block");
    var userId = $("#user_id").val();
    var roleId = $("#role_id").val();
    var structures = getEventStructures(id);
    var cooperations = getEventCooperations(id);
    var eventUserId;
    $.ajax({
        type: "GET",
        url: "core/routes.php",
        data: {
            "id": id,
            "get_events_data": "get_events_data"
        },
        dataType: "html",
        success: function (data) {
            var left = JSON.parse(data);
            $("#current-count").text(left.current);
            $("#process-count").text(left.process);
            $("#finished-count").text(left.finished);
            $("#rejected-count").text(left.rejected);
            $.each(left[0], function (item, value) {               
                if (item == "endDate" || item == 'startDate') {
                    $(`#${item}`).datepicker('update', value);
                    return;
                }

                if (item == "travel" || item == 'eat' || item == 'learn' || item == 'transport' || item == 'visit' || item == 'other') {
                    $(`#${item}`).attr('checked', value);
                    return;
                }
                
                if(item=="country" || item=="face" || item=="relations" || item=="status"){
                    $(`#${item}`).val(value);
                    $(`#${item}`).trigger('change');
                }

                if(item=="type"){
                    $(`#types`).val(value);
                    $(`#types`).trigger('change');
                }
                if(item=="relationship"){
                    $(`#relations`).val(value);
                    $(`#relations`).trigger('change');
                }
                if(item=="districtId"){
                    $(`#district-id-${value}`).addClass("active");
               }
                if(item=="status"){
                    if(value==3 || value==4){
                        $("#add-event").remove();
                        $("#clone-btn").remove();
                    }
                }                        
                $(`#${item}`).val(value);               
            });
            var eventUserId = $("#userId").val();
            if(roleId==2){
                if(eventUserId!=userId){
                    $("#add-event").remove();
                    $("#clone-btn").remove();
                }
            }
          
            getEventFile(id);
            $("#event-add-edit-title").text("ღონისძიების რედაქტირება");
            getAdditionalCountries(id);
                setTimeout(() => {
                    $('#structures').val(structures).change();
                    $('#cooperation').val(cooperations).change();
                    $("#main-load-div").css("display", "none");
                }, 1000);

            
            
        }
    });
}


function editUser(id){
    $.ajax({
        type: "GET",
        url: "core/routes.php",
        data: {
            "id": id,
            "get_user": "get_user"
        },
        dataType: "html",
        success: function (data) {
            var left = JSON.parse(data);
            $.each(left[0], function (item, value) {               
                if (item == "endDate" || item == 'startDate') {
                    $(`#${item}`).datepicker('update', value);
                    return;
                }

                if(item=="structure"){
                    $(`#structures`).val(value);
                    $(`#structures`).trigger('change');
                }
                $(`#${item}`).val(value);

            });
        }
    });
}

function eventCounters(){
    $.ajax({
        type: "GET",
        url: "core/routes.php",
        data: {
            "get_counters": "get_counters"
        },
        dataType: "html",
        success: function (data) {
            var left = JSON.parse(data);
            $("#current-count").text(left.current);
            $("#process-count").text(left.process);
            $("#finished-count").text(left.finished);
            $("#rejected-count").text(left.rejected);
        }
    });
}