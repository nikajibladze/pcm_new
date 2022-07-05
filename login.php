<?php require_once 'core/login.php';?>
<?php require_once 'core/settings.php';?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PCM</title>

    <!-- Font Awesome CSS -->


    <link rel="apple-touch-icon" href="app-assets/images/logo/logo.png">
<link rel="shortcut icon" type="image/x-icon" href="app-assets/images/logo/logo.png">
    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/login/style.min.css">
    <link rel="stylesheet" href="assets/login/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

    <!-- Preloader -->
    <div class="preloader-container">
        <div class="preloader-wrapper">
            <div class="preloader-border"></div>
            <div class="preloader-line-mask">
                <div class="preloader-line"></div>
            </div>
        </div>
    </div>

    <!-- Content -->
    <div class="container-fluid">
        <div class="row min-vh-100">

            <div class="col-lg-4 bg-image order-2 order-lg-1" data-img-src="assets/images/123.jpg">
                <div class="row h-100">

                    <div class="col-12 d-none d-lg-block">
                      
                    </div>
                    <div class="col-12 pt-5 mt-4 pt-lg-0 mt-lg-0">
                        <img src="assets/login/TavdacvaLogo.png" class="login-logo" alt="logo" style="">
                        <div class="px-3 px-xl-4">

                            <!-- <h1 class="module"></h1> -->

                        </div>
                    </div>

                </div>
            </div>

            <div class="col-lg-8 order-1 order-lg-2">
                <div class="row h-100 align-content-between">

                    <div class="col-12">
                        <div class="row align-items-center py-4 mb-4 mb-lg-0">

                            <div class="col-6 d-lg-none">
                                <div class="px-3">
                                    
                                </div>
                            </div>

                            <div class="col-6 col-lg-12">
                                <div class="text-right px-3 px-xl-4 mt-xl-2">

                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-12">
                        <div class="container">
                            <div class="row mb-5">
                                <div class="col-md-8 offset-md-2 col-xl-6 offset-xl-3">
                                    <div class="p-lg-4 mb-4 mb-xl-5">

                                        <div class="mb-4 text-center">
                                            <img src="https://pophonic.com/_brave-151210120/assets/svg/upload/login-03.svg"
                                                alt="Login" data-width="64px" data-height="64px">
                                        </div>

                                        <div class="pb-1"></div>

                                        <h3 class="section-title-4 text-center font-weight-800 mb-4">
                                            სისტემაში შესვლა
                                            <div class="title-divider-round"></div>
                                        </h3>

                                        <form autocomplete="off" method="post" action="">

                                            <div class="input-group input-group-lg input-group-round mb-4">
                                                <label class="text-uppercase px-3" for="user_name">მომხმარებლის სახელი</label>
                                                <div class="input-group-inner">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text input-group-icon"><i
                                                                class="far fa-user"></i></span>
                                                    </div>
                                                    <input type="text" class="form-control form-control-lg"
                                                        placeholder="მომხმარებლის სახელი" name="user_name" id="user_name">
                                                    <div class="input-focus-bg"></div>
                                                </div>
                                            </div>

                                            <div class="input-group input-group-lg input-group-round mb-4">
                                                <div class="d-flex w-100 justify-content-between">
                                                    <label class="text-uppercase px-3" for="password">პაროლი</label>
                                                    
                                                </div>
                                                <div class="input-group-inner">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text input-group-icon"><i
                                                                class="far fa-eye-slash"></i></span>
                                                    </div>
                                                    <input type="password" id="password" name="password" class="form-control form-control-lg"
                                                        placeholder="პაროლი">
                                                    <div class="input-focus-bg"></div>
                                                </div>
                                            </div>

                                            <div data-height="5px"></div>
                                            <?=$response?>
                                            <button type="submit" name="login" class="btn btn-lg btn-round btn-primary btn-block mb-0"><i
                                                    class="fas fa-sign-in-alt"></i>შესვლა</button>



                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12"></div>

                </div>
            </div>

        </div>
    </div>

    <!-- jQuery -->
    <script src="assets/login/js/vendor/jquery-3.5.1.min.js"></script>

    <!-- Bootstrap js -->
    <script src="assets/login/js/bootstrap.bundle.min.js"></script>
    <!-- Custom js -->
    <script src="assets/login/js/custom.js"></script>

</body>

</html>