var counter = 1;
$("#shrink-logo").on("click", function () {
    if ($("#checkShrink").hasClass("is-active")) {
        $(".brand-logo").css({
            width: "30px",
            transition: 'all .5s ease'
        });
    } else {
        $(".brand-logo").css({
            width: "91px",
            transition: 'all .5s ease'
        });
    }
});

function confirmFile() {

    if ($("#patient_confirm:checked").val() == 1) {
        $("#patient_confirm_file").css("display", "flex");
    } else {
        $("#patient_confirm_file").css("display", "none");
    }
}

function datepicker() {
    $(".datepicker").datepicker({
        autoclose: true,
        todayBtn: true,
        format: 'yyyy-mm-dd',
        todayHighlight: true,
        language: 'ka'
    });
}
function select2() {
    $(".select2").select2({
        placeholder: "არჩევა",
        allowClear: true
    });
}


function additionalFile(id) {
    $("#" + id).parent().before("<div class='col-12' id='main-file-div-" + counter + "'> <div class='form-group'> <label>მიმაგრებული ფაილი</label> <label id='files" + counter + "' class='file center-block'> <input type='file' id='images' class='images' name='images[]'> <span class='file-custom'></span> </label> </div> </div>");
    counter++;
}

function additionalFilePsychology(id) {
    $("#" + id).parent().before(
        `<div class="col-12"  id='main-file-div-${counter}'>
        <div class="form-group">
        <label for="file"></label>
        <label id="psychology_file${counter}" class="file center-block btn btn-dark btn-sm file-bg">
            <input type="file" class="hidden file-input psychology_file" id="psychology_file" name="psychology_file[]">
            <img src="assets/images/icons/upload.png" class="upload-img"> ფაილის მიმაგრება
            <span class="file-custom"></span>
        </label>
        <span class="upload-filename"></span>
        </div>	</div>`);
    counter++;
}




$(document).on('change', '#event_file', function (e) {
        $("#event-file-name").text(e.target.files[0].name);
});

$(document).on('click', '.district-btn', function (e) {
    $(".district-btn").not(this).removeClass('active');
    $(this).toggleClass('active');
    if(!$(this).hasClass('active')){
        $("#districtId").val("");
    }
    var districtCount = $('.active').length;   
    if(districtCount===0){
        $('#dateFrom').val('').datepicker('update','123');
        $('#dateTo').val('').datepicker('update','123');
    }
  
});


$(document).on('keypress', '#search_users', function (e) {
    if (e.which == 13) {
        $("#search-users").click();
    }
});

$(document).on('click', '.btn-primary', function (e) {
    $(".modal").draggable({
        handle: ".modal-header",
        opacity: 0.2,
        cursor: "move"
    });
});


function generatePassword(type) {
   
    var password = Math.floor(1000 + Math.random() * 9000);
    if(type==1){
        $("#pswd").val(password);
    }else{
        $("#pswd").val(password);
    }

}

$(document).ready(function(){
    var user_id =  $("#user_id").val();
    var tmp_pass =  $("#tmp_pass").val();
    if(tmp_pass==1){
       $("#tmp_pass_btn").click();
    }
   });


   function getAdditionalCountries(id){
    $("#lab-tests-body").html("");
    $.ajax({
        type: "GET",
        url: "core/routes.php",
        data: {
            "id": id,
            "select_additional_country":"select_additional_country"
        },
        success: function (data) {
            var res = JSON.parse(data);
            $.each(res, function (item, value) {
              
                $("#select2_test").append(`
                <div id='append_main_div_${value.id}' class="append_main_div">
                <input type="hidden" id="country_id_${value.id}" value="${value.id}">
                <div class="col-xl-3 col-lg-3 col-md-3 mb-1" id='country_main_${value.id}'>
                <label for="users-list-verified">ქვეყნები</label>
                <fieldset class="form-group">
                    <select class="form-control" id="countries_${value.id}" name="countries[]">
                      
                    </select>
                </fieldset>
            </div>
            
            <div class="col-xl-3 col-lg-3 col-md-3 mb-1" id='calendar_main_${value.id}'>
                            <fieldset class="form-group">
                                <label for="calendar${value.id}">დაწყების კალენდარი</label>
                                <input type="text" class="form-control datepicker" name="additional_dateFrom[]" id="calendar${value.id}">
                            </fieldset>
                        </div>
            
                        <div class="col-xl-3 col-lg-3 col-md-5 mb-1" id='calendar_main_${value.id}'>
                            <fieldset class="form-group">
                                <label for="calendar${value.id}">დასრულების კალენდარი</label>
                                <input type="text" class="form-control datepicker" name="additional_dateTo[]" id="calendar_to${value.id}">
                            </fieldset>
                        </div>
            
                        
            <div class="col-xl-1 col-lg-1 col-md-1 mb-1" style="text-align: center;padding-top: 25px;">
            <button type="button" onclick="removeCountry(${value.id})" class="btn btn-float btn-float-sm btn-outline-danger "><i class="fa fa-times"></i></button>
            </div>

            <div class="col-xl-1 col-lg-1 col-md-1 mb-1" style="text-align: center;padding-top: 25px;">
            <button type="button" onclick="editCountry(${value.id})" class="btn btn-float btn-float-sm btn-outline-success "><i class="fa fa-check"></i></button>
            </div>
            </div>
            `);

            $(`#calendar${value.id}`).datepicker({
                autoclose: true,
                todayBtn: true,
                format: 'yyyy-mm-dd',
                todayHighlight: true,
                language: 'ka'
            });                    
            $(`#calendar_to${value.id}`).datepicker({
                autoclose: true,
                todayBtn: true,
                format: 'yyyy-mm-dd',
                todayHighlight: true,
                language: 'ka'
            });
            $(`#calendar${value.id}`).datepicker('update', value.dateFrom);
            $(`#calendar_to${value.id}`).datepicker('update', value.dateTo);
            var select2_id = `countries_${value.id}`;
            $(`#countries_${value.id}`).select2({
                placeholder: 'არჩევა',
                allowClear: true
              });             
              getCountriesFill(select2_id);

              setTimeout(() => {
                $(`#countries_${value.id}`).val(value.countryId);
                $(`#countries_${value.id}`).trigger('change');     
              }, 500);
                  
              });
                    //$("#lab-tests-row").html("");
     
       
        }
    });

        }
        function notifications(){
           var userId = $("#user_id").val();
            $.ajax({
                type: "GET",
                url: "core/routes.php",
                data: {
                    "userId": userId,
                    "get_notifications": "get_notifications"
                },
                dataType: "html",
                success: function (data) {
                    var notifications = JSON.parse(data);
                    var lenght = notifications.length;
                    $("#notification-counter").html(lenght+' ახალი');
                    $("#counter-badge").html(lenght);
                    $("#notifications-menu").html("");
                    $.each(notifications, function (item, value) {
                        $("#notifications-menu").append(`                        
                        <a href="javascript:void(0)">
                        <div class="media" onclick="addEvent(${value.id}, 2);">
                          <div class="media-left align-self-center"><i class="fa fa-bell icon-bg-circle bg-red bg-darken-1"></i></div>                        
                          <div class="media-body">
                            <h6 class="media-heading">${value.name}</h6>
                            <p class="notification-text font-small-3 text-muted">${value.about}</p><small>
                              <time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">${value.startDate}</time></small>
                          </div>
                        </div></a>
                        `);        
                    });
        
                }
            });
        }

        function nameValidator(){
            $("#name").css("border", "1px solid red");          
            window.scrollTo({ top: 0, behavior: 'smooth' });
            $("#name").focus();  
                setTimeout(() => {
                    $("#name").css("border", "1px solid #ccd6e6");
                }, 3000);
               
        }



