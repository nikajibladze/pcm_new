<form autocomplete="off" method="post" id="event_form" action="">
<div class="row">


<div class="col-xl-12 col-lg-12 col-md-12 mb-3">

<div class="section-titles"><img src="assets/images/planner.png"><span id="event-add-edit-title"> ღონისძიების დამატება</span></div>
</div>
  
                            <div class="col-xl-12 col-lg-12 col-md-12 mb-1">
                                <fieldset class="form-group">
                                    <label for="basicInput">ღონისძიების სახელი</label>
                                    <input type="text" class="form-control" name="name" id="name">
                                </fieldset>
                            </div>

                            
                            <div class="col-xl-4 col-lg-6 col-md-12 mb-1">
                <label for="type">ღონისძიების ტიპი</label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single" id="types" name="type">
                        <option value=""></option>

                    </select>
                </fieldset>
            </div>

            <div class="col-xl-4 col-lg-6 col-md-12 mb-1">
                <label for="face">ღონისძიების სახე</label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single" id="face" name="face">
                        <option value=""></option>
                        <option value="1">შიდა</option>
                        <option value="2">გარე</option>

                    </select>
                </fieldset>
            </div>

            <div class="col-xl-4 col-lg-6 col-md-12 mb-1">
                <label for="users-list-verified">პასუხისმგებელი სტრუქტურა</label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single" multiple id="structures" name="structures[]">
                        <option value=""></option>
                       

                    </select>
                </fieldset>
            </div>

                 
           

       

            <div class="col-xl-4 col-lg-6 col-md-12 mb-1">
                <label for="users-list-verified">საერთაშორისო ურთიერთობები</label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single" id="relations" name="relationship">
                        <option value=""></option>

                    </select>
                </fieldset>
            </div>

            


            <div class="col-xl-4 col-lg-6 col-md-12 mb-1">
                <label for="cooperation">თანამშრომლობის სფერო </label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single" multiple id="cooperation" name="cooperation[]">
                        <option value=""></option>
                  

                    </select>
                </fieldset>
            </div>

            <div class="col-xl-4 col-lg-6 col-md-12 mb-1">
                <label for="status">ღონისძიების სტატუსი </label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single" id="status" name="status">
                        <option value=""></option>
                    </select>
                </fieldset>
            </div>
          
     



                           
                            <div class="col-xl-4 col-lg-6 col-md-12 mb-1">
                                <fieldset class="form-group">
                                    <label for="quantity">მონაწილეთა რაოდენობა</label>
                                    <input type="text" id="quantity" class="form-control square" name="quantity" placeholder="მონაწილეთა რაოდენობა">
                                </fieldset>
                            </div>
                            <div class="col-xl-4 col-lg-6 col-md-12 mb-1">
                                <fieldset class="form-group">
                                    <label for="place">ჩატარების ადგილი</label>
                                    <input type="text" id="place" name="place" class="form-control" placeholder="ჩატარების ადგილი">
                                </fieldset>
                            </div>

                            <div class="col-xl-4 col-lg-6 col-md-12 mb-1">
                                <fieldset class="form-group">
                                    <label for="reminder">ღონისძიების შეხსენების დღეების რაოდენობა</label>
                                    <input type="text" id="reminder" name="reminder" class="form-control" placeholder="ღონისძიების შეხსენების დღეების რაოდენობა">
                                </fieldset>
                            </div>

                            <div class="col-12">
                <br>
                <div class="form-group">
                    <div class="controls">
                        <label for="about">ღონისძიების აღწერა</label>
                        <textarea name="about" rows="10" class="form-control" placeholder="ღონისძიების აღწერა" id="about"></textarea>
                        <div class="help-block"></div>
                    </div>
                </div>
            </div>
           


            <div class="col-12">
                <br>
                <div class="form-group">
                    <div class="controls">
                        <label for="comment">ღონისძიების კომენტარი</label>
                        <textarea name="comment" rows="10" class="form-control" placeholder="ღონისძიების კომენტარი" id="comment"></textarea>
                        <div class="help-block"></div>
                    </div>
                </div>
            </div>

            <div class="col-12">
<h4 class="form-section"> <i class="fa fa-calendar" aria-hidden="true"></i> კალენდარი</h4>
</div>


            <div class="col-xl-6 col-lg-6 col-md-12 mb-1">
                <fieldset class="form-group">
                    <label for="startDate">დაწყების კალენდარი</label>
                    <input type="text" class="form-control datepicker" name="startDate" id="startDate">
                </fieldset>
            </div>


            <div class="col-xl-6 col-lg-6 col-md-12 mb-1">
                <fieldset class="form-group">
                    <label for="endDate">დამთავრების კალენდარი</label>
                    <input type="text" class="form-control datepicker" name="endDate" id="endDate">
                </fieldset>
            </div>

            <div class="col-xl-12 col-lg-6 col-md-12 mb-1">
    
           
                <button type="button" onclick="districtDate(1)" id="district-id-1" class="btn btn-outline-success mr-1 mb-1 district-btn">I კვარტალი</button>
                <button type="button" onclick="districtDate(2)" id="district-id-2" class="btn btn-outline-success mr-1 mb-1 district-btn">II კვარტალი</button>
                <button type="button" onclick="districtDate(3)" id="district-id-3" class="btn btn-outline-success mr-1 mb-1 district-btn">III კვარტალი</button>
                <button type="button" onclick="districtDate(4)" id="district-id-4" class="btn btn-outline-success mr-1 mb-1 district-btn">IV კვარტალი</button>
                <input type="hidden" id="districtId" name="districtId" placeholder="კვარტალი">
           
            </div>


</div>


<div class="row" id="select2_test">
            <div class="col-12">
<h4 class="form-section add-additional" onclick="AdditionalFields()"> <i class="fa fa-plus" aria-hidden="true"></i> დამატებითი ველი - ქვეყანა</h4>
</div>

</div>



<div class="row" id="select2_test">
            <div class="col-12">
<h4 class="form-section"> <i class="fa fa-file" aria-hidden="true"></i> მიმაგრებული ფაილი</h4>
</div>
</div>

<div class="col-12">
        <div class="">
            <table class="table table-bordered table-striped" id="events-files-table" style="display: table;">
                            <thead>
                                <tr>
                                    <th>სახელი</th>
                                    <th>ჩამოტვირთვა</th>
                                    <th>წაშლა</th>
                                </tr>
                            </thead>
                            <tbody id="file-table">


                    </tbody>
                        </table>
            </div>

        </div>

<div class="col-12">
                        <div class="form-group">
                        <label for="file"></label>
                        <label for="event_file" class="file center-block btn btn-dark btn-sm file-bg">

                            <input type="file" class="hidden file-input event_file" id="event_file" name="event_file[]">
                          <img src="assets/images/icons/upload.png" class="upload-img"> ფაილის ატვირთვა
                            <span class="file-custom"></span>
                        </label>
                        <span class="upload-filename" id="event-file-name"></span>
                    </div>	</div>
           


                    <div class="row">
                            <div class="col-12">
                <br>
                <h4 class="devide-section-red"> საქართველოს თავდაცვის სამინისტროს მიერ ასანაზღაურებელი ხარჯები</h4>
            </div>

            <div class="col-6">
                <br>
                <fieldset>
                    <div class="custom-control custom-checkbox">
                        <input type="hidden" class="custom-control-input" value="" name="travel">
                        <input type="checkbox" class="custom-control-input" value="1" name="travel" id="travel">
                        <label class="custom-control-label" for="travel">მგზავრობის დაფინანსება</label>
                    </div>
                </fieldset>
            </div>

            <div class="col-6">
                <br>
                <fieldset>
                    <div class="custom-control custom-checkbox">
                        <input type="hidden" class="custom-control-input" value="" name="eat">
                        <input type="checkbox" class="custom-control-input" value="1" name="eat" id="eat">
                        <label class="custom-control-label" for="eat">კვების დაფინანსება</label>
                    </div>
                </fieldset>
            </div>

            <div class="col-6">
                <br>
                <fieldset>
                    <div class="custom-control custom-checkbox">
                        <input type="hidden" class="custom-control-input" value="" name="learn">
                        <input type="checkbox" class="custom-control-input" value="1" name="learn" id="learn">
                        <label class="custom-control-label" for="learn">სწავლის დაფინანსება</label>
                    </div>
                </fieldset>
            </div>


            <div class="col-6">
                <br>
                <fieldset>
                    <div class="custom-control custom-checkbox">
                        <input type="hidden" class="custom-control-input" value="" name="transport">
                        <input type="checkbox" class="custom-control-input" value="1" name="transport" id="transport">
                        <label class="custom-control-label" for="transport">შიდა გადაადგილების დაფინანსება</label>
                    </div>
                </fieldset>
            </div>

          

            <div class="col-6">
                <br>
                <fieldset>
                    <div class="custom-control custom-checkbox">
                        <input type="hidden" class="custom-control-input" value="" name="visit">
                        <input type="checkbox" class="custom-control-input" value="1" name="visit" id="visit">
                        <label class="custom-control-label" for="visit"> ვიზის დაფინანსება</label>
                    </div>
                </fieldset>
            </div>

            <div class="col-6">
                <br>
                <fieldset>
                    <div class="custom-control custom-checkbox">
                        <input type="hidden" class="custom-control-input" value="" name="other">
                        <input type="checkbox" class="custom-control-input" value="1" name="other" id="other">
                        <label class="custom-control-label" for="other"> სხვა სახის დაფინანსება</label>
                    </div>
                </fieldset>
            </div>
           
            <div class="col-12">
            <br>
                <br>
                <div class="form-group">
                    <div class="controls">
                        <label for="other_text">სხვა სახის დაფინანსება</label>
                        <textarea name="other_text" rows="10" class="form-control" placeholder="სხვა სახის დაფინანსება" id="other_text"></textarea>
                        <div class="help-block"></div>
                    </div>
                </div>
            </div>

                <input type="hidden" id="id" name="event_id">
            </div>


          
           
           
            <div class="row" id="btn-row">
            <div class="col-12 d-flex flex-sm-row flex-column justify-content-end mt-1">
            <button type="button" class="btn btn-warning mr-sm-1 clone-btn" id="clone-btn" onclick="clone()"><i class="fa fa-clone" aria-hidden="true"></i> კლონირება</button>
        <button type="button" onclick="insertEvent(this.id)" id="add-event" class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1"><i class="fa fa-edit" aria-hidden="true"></i>
            დამატება</button>
        <button type="button" class="btn btn-light" id="user-register-reject" onclick="mainPage()"><i class="fa fa-ban" aria-hidden="true"></i> დახურვა</button>
        
    </div>

   
    </div>   
                        </form>
                        <input type="hidden"  id="action-method" placeholder="მეთოდი">
                        <input type="hidden"  id="userId" placeholder="მეთოდი">
