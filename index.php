
<?php require_once 'core/config.php'; ?>
<?php require_once 'core/settings.php'; ?>
<?php 
if(!isset($_SESSION["user_id"])){
   header('location:login.php');
}
?>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="MOD medical">
    <meta name="keywords" content="PCM">
    <meta name="author" content="MOD PHP DEVELOPERS">
    <title>PCM</title>
    <?php require_once 'links/header-links.php';?>
</head>
<!-- END: Head-->
<!-- BEGIN: Body-->
<body class="vertical-layout vertical-menu 2-columns   fixed-navbar" data-open="click" data-menu="vertical-menu"
    data-col="2-columns">
    <!-- BEGIN: Header-->
    <nav class="header-navbar navbar-expand-md navbar navbar-with-menu fixed-top navbar-semi-dark navbar-shadow">
        <div class="navbar-wrapper">
            <div class="navbar-header">
                <ul class="nav navbar-nav flex-row">
                    <li class="nav-item mobile-menu d-md-none mr-auto"><a
                            class="nav-link nav-menu-main menu-toggle hidden-xs" onclick="prevent(event)" href="#"><i
                                class="feather icon-menu font-large-1"></i></a></li>
                    <li class="nav-item" onclick="logoClick()"><a class="navbar-brand" href="#" onclick="prevent(event)"><img
                                class="brand-logo" alt="logo" src="app-assets/images/logo/logo.png">
                        </a></li>
                    <li class="nav-item d-md-none"><a class="nav-link open-navbar-container" onclick="prevent(event)"
                            data-toggle="collapse" data-target="#navbar-mobile"><i class="fa fa-ellipsis-v"></i></a>
                    </li>
                </ul>
            </div>
            <div class="navbar-container content">
                <div class="collapse navbar-collapse" id="navbar-mobile">
                    <ul class="nav navbar-nav mr-auto float-left">
                        <li class="nav-item d-none d-md-block" id="shrink-logo"><a
                                class="nav-link nav-menu-main menu-toggle hidden-xs" id="checkShrink" href="#"><i
                                    class="fa fa-bars"></i></a></li>

                        <li class="nav-item d-none d-md-block"><a class="nav-link nav-link-expand" href="#"
                                onclick="prevent(event)"><i class="fa fa-window-maximize"></i></a></li>

                    </ul>
                    <ul class="nav navbar-nav float-right">
                    <li class="dropdown dropdown-notification nav-item"><a class="nav-link nav-link-label" href="#" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-bell"></i><span class="badge badge-pill badge-danger badge-up" id="counter-badge">5</span></a>
                <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                  <li class="dropdown-menu-header">
                    <h6 class="dropdown-header m-0"><span class="grey darken-2">ღონისძიების შეხსენება </span><span id="notification-counter" class="notification-tag badge badge-danger float-right m-0">5 ახალი</span></h6>
                  </li>
                  <li class="scrollable-container media-list ps" id="notifications-menu">
              

                      <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 0px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></li>
                  <li class="dropdown-menu-footer"><a class="dropdown-item text-muted text-center" href="javascript:void(0)">ყველა შეხსნების წაშლა</a></li>
                </ul>
              </li>
                        <li class="dropdown dropdown-user nav-item"><a
                                class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                <div class="avatar avatar-online"><img
                                        src="app-assets/images/portrait/small/avatar-s-27.png" alt="avatar"><i></i>
                                </div><span class="user-name"><?=$_SESSION['username']?></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="login.php?logout=true"><i class="fa fa-power-off"></i> გამოსვლა</a>
                                <input type="hidden" id="user_id" value="<?=$_SESSION["user_id"]?>">
                                <input type="hidden" id="tmp_pass" value="<?=$_SESSION["tmp_pass"]?>">
                                <input type="hidden" id="role_id" value="<?=$_SESSION["role"]?>" >
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <!-- END: Header-->
    <!-- BEGIN: Main Menu-->
    <div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
        <div class="main-menu-content">
            <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">

                <li class="navigation-header"><span>მენიუ</span><i class=" " data-toggle="tooltip"
                        data-placement="right" data-original-title="ნავიგაცია"></i>
                </li>

                <li class=" nav-item" id="histories" onclick="mainPage()"><a href="#"
                        onclick="prevent(event)"><i class="fa fa-home "></i><span
                            class="menu-title">მთავარი</span></a>
                </li>
                <?php 
                if($_SESSION["role"]==1){                
                ?>
                <li class="nav-item" id="users" onclick="Users()"><a href="#" onclick="prevent(event)"><i
                            class="fa fa-user"></i><span class="menu-title" id="visits-link">მომხმარებლები</span></a>
                </li>
        <?php 
        }?>
                <li class=" nav-item"><a href="#" id="lab_new" onclick="reportsPage()"><i
                            class="fa fa-bar-chart"></i><span class="menu-title">ანგარიშგება</span></a>
                    
                </li>

                </li>
                <?php 
                if($_SESSION["role"]==1){                
                ?>
        <li class=" nav-item" onclick="getDictionary(this.id)"  id="dictionary_id"><a href="#" id="dictionary" onclick="prevent(event)"><i
                    class="fa fa-book"></i><span class="menu-title">ცნობარი</span></a>
            
        </li>

        <?php 
        }?>



              

                <!-- <li class=" nav-item" id="user-info" onclick="VisitUserInfoTop(this.id)"><a href="#"
                        onclick="prevent(event)"><i class="fa fa-bar-chart"></i><span
                            class="menu-title">ანგარიშგება</span></a>
                </li> -->

            </ul>
        </div>
    </div>
    <!-- END: Main Menu-->

    <!-- BEGIN: Content-->
    <div class="app-content content">

        <div class="content-overlay"></div>
        <div class="content-wrapper">
        <div id="main-load-div">
                        <div id="spinner-div" class="spinner-border text-primary" role="status">
                            <span class="sr-only">Loading...</span>
                        </div>
                    </div>
            <div class="content-body">
                <!-- Description -->
              
                <section id="description" class="card">

                <div class="card-body" id="top-content"><div class="users-list-filter px-1">
   
</div>
                </section>
                <!--/ Description -->
                <!-- CSS Classes -->
                <section id="css-classes" class="card">
               
                    <div class="card-content">
                        <div class="card-body card-dashboard" id="bottom-content">
              


                        </div>
                    </div>
                </section>
                <!--/ CSS Classes -->

            </div>
        </div>
    </div>
    <button type="button" class="btn btn-primary" id="tmp_pass_btn" data-toggle="modal" data-target="#iconForm"></button>
    <div class="modal fade" id="iconForm" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel34" style="display: none;" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
										  <div class="modal-header bg-primary">
											<h3 class="modal-title" id="myModalLabel34">ერთჯერადი პაროლის რედაქტირება</h3>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											  <span aria-hidden="true">×</span>
											</button>
										  </div>
										  <form id="reset_tmp_password_form" method="post" action="">
											<div class="modal-body">
												<label for="user_password_tmp">ერთჯერადი პაროლი: </label>
												<div class="form-group position-relative has-icon-left">
													<input type="password" placeholder="ერთჯერადი პაროლი" autocomplete="on" id="user_password_tmp" name="user_password_tmp" class="form-control">
													<div class="form-control-position">
														<i class="fa fa-lock font-medium-5 line-height-1 text-muted icon-align"></i>
													</div>
												</div>

												<label for="user_password">ახალი პაროლი: </label>
												<div class="form-group position-relative has-icon-left">
													<input type="password" placeholder="ახალი პაროლი" id="user_password" autocomplete="on" name="user_password" class="form-control">
													<div class="form-control-position">
														<i class="fa fa-lock font-medium-5 line-height-1 text-muted icon-align"></i>
													</div>
												</div>

                                                <label for="user_password_confirm">გაიმეორეთ პაროლი: </label>
												<div class="form-group position-relative has-icon-left">
													<input type="password" placeholder="გაიმეორეთ პაროლი" id="user_password_confirm" autocomplete="on" name="user_password_confirm" class="form-control">
													<div class="form-control-position">
														<i class="fa fa-lock font-medium-5 line-height-1 text-muted icon-align"></i>
													</div>
												</div>
											</div>
											<div class="modal-footer">											
                                                <button type="button" id="reset_tmp_password" class="btn btn-outline-primary" onclick="resetTmpPassword(this.id)" >რედაქტირება <i class="fa fa-edit"></i></button>					
                                                <input type="reset" class="btn btn-outline-danger " data-dismiss="modal" value="დახურვა">
                                            </div>
										  </form>
										</div>
									  </div>
									</div>
    <!-- END: Content-->
    <!-- BEGIN: Page JS-->
   
    <?php require_once 'links/footer-links.php';?>
    <!-- END: Page JS-->
    <script>
    $(document).ready(function() {
        mainPage(<?=$_SESSION["role"]?>);
   
       
    });
    </script>
</body>
<!-- END: Body-->

</html>