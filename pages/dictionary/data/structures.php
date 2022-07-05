<button type="button" id="add-dictionary-vaccine" onclick="addDictionaryStructures(this.id,1,1)" data-toggle="modal" data-target="#structures-modal" class="btn btn-primary btn-min-width mr-1 mb-1"><i class="fa fa-plus"></i> დამატება</button>

<table class="table table-striped table-bordered" id="structures-table">
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
<div class="modal fade" id="structures-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary">
        <h5 class="modal-title structure-title " id="exampleModalLabel">სტრუქტურა - დამატება</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    
      <div class="modal-body" id="vaccine-dictionary-modal-body">
      <form action="" id="procedure-dictionary-form" method="post" autocomplete="off">
<div class="col-12">
               <fieldset>
               <label for="structure">სტრუქტურა</label>
                      <div class="input-group">

                          <input type="text" class="form-control" id="structure" name="structure" placeholder="სტრუქტურა " aria-describedby="button-addon2">
                          <input type="hidden" class="form-control" id="structure_id" name="structure_id" placeholder="id" aria-describedby="button-addon2">
                      </div>
                  </fieldset>	
              </div>

                  
              </form>
      </div>
      <div class="modal-footer">
        <button type="reset" class="btn btn-secondary"  data-dismiss="modal">დახურვა</button>
        <button type="button" class="btn btn-primary"  onclick="insertStucture()">შენახვა</button>
      </div>
   
    </div>
  </div>
</div>
