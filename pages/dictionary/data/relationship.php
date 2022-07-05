<button type="button" id="add-dictionary-vaccine" onclick="addDictionaryRelationship(this.id,'',1)"  class="btn btn-primary btn-min-width mr-1 mb-1"><i class="fa fa-plus"></i> დამატება</button>

<table class="table table-striped table-bordered" id="relationship-table">
                                                        <thead>
                                                        <tr>

                                                            <th>#</th>
                                                            <th>დასახელება</th>
                                                            <th>ქმდება</th>
                                                        </thead>
                                                        </thead>
                                                        <tbody>

                                                        </tbody>
                                                    </table>

                                                    

                                                    <!-- Modal -->
<div class="modal fade" id="add-relations-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary">
        <h5 class="modal-title" id="exampleModalLabel">საერთაშორისო ურთიერთობები - დამატება</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    
      <div class="modal-body" id="vaccine-dictionary-modal-body">
      <form action="" id="relationship-dictionary-form" method="post" autocomplete="off">
<div class="col-12">
               <fieldset>
               <label for="country">საერთაშორისო ურთიერთობები</label>
                      <div class="input-group">

                          <input type="text" class="form-control" id="relationship_name" name="name" placeholder="საერთაშორისო ურთიერთობები " aria-describedby="button-addon2">
                          <input type="hidden" class="form-control" id="relationship_id" name="relationship_id" placeholder=" " aria-describedby="button-addon2">
                      </div>
                  </fieldset>	
              </div>

                  
              </form>
      </div>
      <div class="modal-footer">
        <button type="reset" class="btn btn-secondary"  data-dismiss="modal">დახურვა</button>
        <button type="button" class="btn btn-primary"  onclick="insertRelationshipDictionary()">შენახვა</button>
      </div>
   
    </div>
  </div>
</div>
