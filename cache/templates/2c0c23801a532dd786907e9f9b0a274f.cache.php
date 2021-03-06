<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8" />
    <title><?php echo fc_lang('%s管理中心', SITE_NAME); ?></title>
    <meta name="robots" content="noindex,nofollow">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="<?php echo fc_lang('%s后台管理中心', SITE_NAME); ?>" name="description" />
    <link rel="shortcut icon" href="<?php echo THEME_PATH; ?>home/img/top.ico" type="image/x-icon" />
    <link href="<?php echo THEME_PATH; ?>admin/login/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo THEME_PATH; ?>admin/login/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<?php echo THEME_PATH; ?>admin/login/css/animate.min.css" rel="stylesheet">
    <link href="<?php echo THEME_PATH; ?>admin/login/css/style.min.css" rel="stylesheet">
    <link href="<?php echo THEME_PATH; ?>admin/login/css/login.min.css" rel="stylesheet">

    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>
    <script type="text/javascript" src="<?php echo THEME_PATH; ?>admin/login/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#user").focus();
        });
    </script>   
</head>
<!-- END HEAD -->

<body class="signin">
<div class="signinpanel">
    <div class="row">
         <div class="col-sm-7">

        </div> 
        <div class="col-sm-5">
            <form class="login-form" action="" method="post">
                <h4 class="no-margins">后台登录</h4>
                <input type="text" class="form-control uname" id="user" name="username" placeholder="用户名" />
                <input type="password" class="form-control pword m-b" name="password" placeholder="密码" />
                <button id="submit" name="submit"  class="btn btn-success btn-block"><?php echo fc_lang('登录'); ?></button>
            </form>
        </div>
    </div>
    <!--<div class="signup-footer">
         <div class="pull-left">
            &copy; <?php echo date('Y'); ?> 技术支持：福建润商网络技术有限公司
        </div> 
    </div>-->
</div>
</body>

</html>


