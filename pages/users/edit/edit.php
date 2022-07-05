<form action="" id="add-user-form" method="post" autocomplete="off">
    <div class="row">
<div class="col-6 mb-1">
               <fieldset>
               <label for="name">სახელი </label>
                      <div class="input-group">

                          <input type="text" class="form-control" id="name" name="name" placeholder="სახელი " aria-describedby="button-addon2">
                          
                      </div>
                  </fieldset>	
              </div>   

              <div class="col-6 mb-1">
               <fieldset>
               <label for="lastname">გვარი</label>
                      <div class="input-group">

                          <input type="text" class="form-control" id="lastname" name="lastname" placeholder="გვარი " aria-describedby="button-addon2">
                          
                      </div>
                  </fieldset>	
              </div> 

              <div class="col-6 ">
               <fieldset>
               <label for="username">მომხმარებლის სახელი</label>
                      <div class="input-group">

                          <input type="text" class="form-control" id="username" name="username" placeholder="მომხმარებლის სახელი " aria-describedby="button-addon2">
                          
                      </div>
                  </fieldset>	
              </div> 


              <div class="col-6 ">
                <label for="structures">სტრუქტურა</label>
                <fieldset class="form-group">
                    <select class="form-control js-example-basic-single"  id="structures" name="structure">
                        <option value=""></option>
                       

                    </select>
                </fieldset>
            </div>

            <div class="col-6 ">
                    <label for="role">როლი</label>
                    <fieldset class="form-group">
                        <select class="form-control" name="role" id="role">
                            <option value=""></option>
                            <option value="1">ადმინისტრატორი</option>
                            <option value="2">მომხმარებელი</option>
                            <option value="3">მნახველი</option>
                        </select>
                    </fieldset>
                </div>
          
               
              </div>          
              <input id="id" name="user_id" type="hidden">             
</form>

