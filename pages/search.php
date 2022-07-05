<form id="search-form" autocomplete="off">
        <div class="row border border-light rounded py-2 mb-2">
            <div class="col-12 col-sm-6 col-lg-4">
                <label for="country">ქვეყნები</label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single"  id="country" multiple name="country[]">
                    <option value=""></option>

                    </select>
                </fieldset>
            </div>

            <div class="col-12 col-sm-6 col-lg-4">
                <label for="users-list-verified">პასუხისმგებელი სტრუქტურა</label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single" multiple id="structures" name="structures[]">
                        <option value=""></option>
                       

                    </select>
                </fieldset>
            </div>

            <div class="col-12 col-sm-6 col-lg-4">
                <label for="users-list-verified">საერთაშორისო ურთიერთობები</label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single" id="relations" name="relationship">
                        <option value=""></option>

                    </select>
                </fieldset>
            </div>

            <div class="col-12 col-sm-6 col-lg-4">
                <label for="users-list-verified">ღონისძიების სახე</label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single" id="users-list-verified" name="face">
                        <option value=""></option>
                        <option value="1">შიდა</option>
                        <option value="2">გარე</option>

                    </select>
                </fieldset>
            </div>

            <div class="col-12 col-sm-6 col-lg-4">
                <label for="types">ღონისძიების ტიპი</label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single" id="types" name="type">
                        <option value=""></option>

                    </select>
                </fieldset>
            </div>

            <div class="col-12 col-sm-6 col-lg-4">
                <label for="cooperation">თანამშრომლობის სფერო </label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single" id="cooperation" multiple name="cooperations[]">
                        <option value=""></option>
                  
                    </select>
                </fieldset>
            </div>

            <div class="col-12 col-sm-6 col-lg-4">
                <label for="status">ღონისძიების სტატუსი </label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single" id="status" name="status">
                        <option value=""></option>
                    </select>
                </fieldset>
            </div>
          
            <div class="col-12 col-sm-6 col-lg-4">
                <fieldset class="form-group">
                    <label for="basicInput2">დაწყების კალენდარი</label>
                    <input type="text" class="form-control datepicker" name="startDate" id="startDate">
                </fieldset>
            </div>


            <div class="col-12 col-sm-6 col-lg-4">
                <fieldset class="form-group">
                    <label for="basicInput2">დამთავრების კალენდარი</label>
                    <input type="text" class="form-control datepicker" name="endDate" id="endDate">
                </fieldset>
            </div>


            <div class="col-lg-12">
            <fieldset class="form-group">

            <button class="btn btn-primary float-right" type="button" onclick="getFirst()"><i class="fa fa-ban"></i> გასუფთავება</button>
            <button class="btn btn-primary float-right mr-1" onclick="search()" type="button"><i class="fa fa-search"></i> ძებნა</button>


             
            </fieldset>
          </div>

        </div>
    </form>
</div>