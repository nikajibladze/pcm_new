<div class="col-12">

<button type="button" id="add-user" onclick="addEditUser(this.id,1)"  class="btn btn-primary btn-min-width mr-1 mb-1"><i class="fa fa-plus"></i> მომხმარებლის დამატება</button>

<table class="table table-striped table-bordered" id="users-table">
                                                        <thead>
                                                        <tr>

                                                            <th>#</th>
                                                            <th>სახელი</th>
                                                            <th>გვარი</th>
                                                            <th>მომხმარებლის სახელი</th>
                                                            <th>სტრუქტურა</th>
                                                            <th>როლი</th>
                                                            <th>ქმედება</th>
                                                        </thead>
                                                        </thead>
                                                        <tbody>

                                                        </tbody>
                                                    </table>
                                                    </div>


   <div class="modal fade" id="users-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary">
        <h5 class="modal-title" id="exampleModalLabel">მომხმარებელი - დამატება</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    
      <div class="modal-body" id="user-modal-body">
    
      </div>
      <div class="modal-footer">
        <button type="reset" class="btn btn-secondary"  data-dismiss="modal"><i class="fa fa-ban" aria-hidden="true"></i> დახურვა</button>
        <button type="button" class="btn btn-primary"  onclick="addUser()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> შენახვა</button>
      </div>
   
    </div>
  </div>
</div>



<div class="modal fade" id="generate-pass-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary">
        <h5 class="modal-title" id="exampleModalLabel">მომხმარებელი - დამატება</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    
      <div class="modal-body" id="generate-modal-body">
    
      </div>
      <div class="modal-footer">
        <button type="reset" class="btn btn-secondary"  data-dismiss="modal"><i class="fa fa-ban" aria-hidden="true"></i> დახურვა</button>
        <button type="button" class="btn btn-primary"  onclick="resetPass()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> შენახვა</button>
      </div>
   
    </div>
  </div>
</div>
