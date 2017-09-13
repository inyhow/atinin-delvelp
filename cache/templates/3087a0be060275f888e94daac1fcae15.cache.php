<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><?php if (SITE_TEMPLATE==cn) { ?>会员登录<?php } else { ?>Member Login<?php } ?></title>
    <meta name="keywords" content="<?php echo $meta_keywords; ?>" />
    <meta name="description" content="<?php echo $meta_description; ?>" />
    <link href="skin/css/style3.css" rel="stylesheet" type="text/css" />
    <link href="skin/css/css.css" rel="stylesheet" type="text/css" />
    <link href="skin/css/mini-login-form-min.css" rel="stylesheet" type="text/css" />
    <link href="skin/css/login_mini_form_aliyun.css" rel="stylesheet" type="text/css" />
    <link href="skin/css/rwd-sc.css" rel="stylesheet" type="text/css" media="all" />
    <link href="skin/css/home-buyer.css" rel="stylesheet" type="text/css" media="all" />
    <link href="skin/css/menu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="skin/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="skin/js/jquery.jslides.js"></script>    
    <style type="text/css">
        <!-- #Marquee {
            height: 20px;
            overflow: hidden;
        }
        
        #Marquee li {
            height: 20px;
            list-style: none;
        }
        
        #Marquee li a {
            color: #ccc;
        }
        
        #Marquee li a:hover {
            color: #eee;
            text-decoration: underline;
        }
        
        .rollBox {
            width: 1002px;
            overflow: hidden;
            margin: 0 auto;
            position: relative;
        }
        
        .rollBox .title {
            width: 100%;
            height: 60px;
            font: 20px Microsoft YaHei;
            line-height: 60px;
            color: #000;
        }
        
        .rollBox .LeftBotton {
            height: 20px;
            width: 20px;
            background: url(../images/left_btn.jpg) no-repeat;
            overflow: hidden;
            cursor: pointer;
            position: absolute;
            right: 21px;
            top: 15px;
        }
        
        .rollBox .RightBotton {
            height: 20px;
            width: 21px;
            background: url(../images/right_btn.jpg) no-repeat;
            overflow: hidden;
            cursor: pointer;
            position: absolute;
            right: 0px;
            top: 15px;
        }
        
        .rollBox .Cont {
            width: 100%;
            overflow: hidden;
        }
        
        .rollBox .ScrCont {
            width: 10000000px;
        }
        
        .rollBox .Cont .pic {
            width: 234px;
            height: 190px;
            border: 1px solid #d7d7d7;
            float: left;
            margin-right: 19px;
        }
        
        .rollBox .Cont .pic img {
            padding: 1px;
            width: 232px;
            height: 81px;
        }
        
        .rollBox .Cont .pic p {
            line-height: 18px;
            padding: 5px 10px;
        }
        
        .rollBox .Cont a:link,
        .rollBox .Cont a:visited {
            color: #666;
            text-decoration: none;
            display: block;
        }
        
        .rollBox .Cont a:hover {
            color: #818181;
        }
        
        .rollBox #List1,
        .rollBox #List2 {
            float: left;
        }
        
        -->
    </style>
</head>

<body>
    <div class="gb_top">
        <div class="gb_topn">
            <div class="gb_topn_l"><img src="<?php echo HOME_THEME_PATH; ?>logo.png" height="70" /></div>
            <div class="gb_topn_r">
                <div class="gb_yuyan">
                <table width="100%" height="31" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="51%">
                            <script language="JavaScript" type="text/javascript">
                                function search_OnSubmit() {
                                    var KeyWord = get("KeyWord").value.Trim();
                                    if (KeyWord.length < 1) {
                                        alert("请输入关键字");
                                        return false;
                                    }
                                }
                            </script>
                            <form style="margin:0px;padding:0px;" method="get" target="_blank" action="<?php echo SITE_URL; ?>index.php">
                                <input name="c" type="hidden" value="so">
                                <input name="module" type="hidden" value="<?php if (defined('MOD_DIR')) {  echo MOD_DIR;  } ?>">
                                <table width="100%" height="30" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="10%" align="right" valign="middle"> <img src="skin/images/gb_search_tou.jpg" width="10" height="31" /></td>
                                        <td width="40%">
                                            <input class="gb_search" name="keyword" id="KeyWord" type="text" value="Search" onfocus="if (this.value=='Search') this.value='';" />
                                        </td>
                                        <td width="50%" align="left" valign="middle">
                                            <input type="image" style="cursor: pointer;" src="skin/images/gb_search_niu.jpg" />
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </td>
                        <td width="30%" align="left" valign="middle"><?php if ($fn_include = $this->_include("language.html", "/")) include($fn_include); ?></td>
                        <td width="19%">&nbsp;</td>
                    </tr>
                </table>
            </div>
                <div id="navigation">
                    <div id="smoothmenu1" class="ddsmoothmenu gb_dh">
                        <ul>
                            <li> <a href="<?php echo SITE_URL; ?>" title="<?php echo SITE_TITLE; ?>"><?php if (SITE_TEMPLATE==cn) { ?>首页<?php } else { ?>Home<?php } ?></a> </li>
                       <?php $return = $this->list_tag("action=navigator type=0 pid=0 num=6"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                        <li> <a title="<?php echo $t['name']; ?>" href="<?php echo $t['url']; ?>" target="_parent"><?php echo $t['name']; ?></a>
                            <ul>
                                <?php if ($t['child']) {  $return_t2 = $this->list_tag("action=navigator pid=$t[id]  return=t2"); if ($return_t2) extract($return_t2); $count_t2=count($return_t2); if (is_array($return_t2)) { foreach ($return_t2 as $key_t2=>$t2) { ?>
                                <li> <a title="<?php echo $t2['name']; ?>" href="<?php echo $t2['url']; ?>" onfocus="this.blur()" style="width:150px;"> <?php echo $t2['name']; ?></a>
                                    <ul>
                                        <?php if ($t2['child']) {  $return_t3 = $this->list_tag("action=navigator pid=$t2[id]  return=t3"); if ($return_t3) extract($return_t3); $count_t3=count($return_t3); if (is_array($return_t3)) { foreach ($return_t3 as $key_t3=>$t3) { ?>
                                        <li><a title="<?php echo $t3['name']; ?>" href="<?php echo $t3['url']; ?>" onfocus="this.blur()"> <?php echo $t3['name']; ?></a> </li>
                                        <?php } }  } ?>
                                    </ul>
                                </li>
                                <?php } }  } ?>
                            </ul>
                        </li>
                        <?php } } ?>

                            <!--<script type="text/javascript" src="js/jquery.min.js"></script>-->
                            <script type="text/javascript" src="skin/js/ddsmoothmenu.js"></script>
                            <script type="text/javascript">
                                ddsmoothmenu.init({
                                    mainmenuid: "smoothmenu1", //menu DIV id
                                    orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
                                    classname: 'ddsmoothmenu', //class added to menu's outer DIV
                                    //customtheme: ["#1c5a80", "#18374a"],
                                    contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
                                })
                            </script>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- END HEAD -->
    <body class=" login">
        <div id="content" class="main container util-clearfix">
            <!-- tangram:1405 begin-->
            <script type="text/javascript">
                window.SCXmanConfig = {
                    enableKeepLogin: true
                };
            </script>
            <div id="screen-banner">
            </div>
            <div id="action-container" class="util-clearfix">
                <div id="action-banner" class="util-clearfix" data-spm="actionbanner">

                </div>
                <div id="login-form-wrapper" data-spm="login" class="util-clearfix col-m-24 col-xs-60">
                    <div class="inner">
                        <div id="login-form">
                            <div id="login-wrap" class="login-static  nc-outer-box">
                                <form id="login-form" name="login-form" method="post" class="form clr style-type-vertical lang-zh_CN vertical-zh_CN ">
                                    <div id="login-title" style="font-size:12px;font-weight:normal;">
                                        <br />
                                        <br />
                                        <br />
                                    </div>
                                    <div id="login-content" class="form clr">
                                        <dl>
                                            <dt class="fm-label">
                                            <div class="fm-label-wrap clr">
                                                <span id="login-id-label-extra" class="fm-label-extra"></span>
                                                <label for="fm-login-id"><?php if (SITE_TEMPLATE==cn) { ?>登录名<?php } else { ?>Login Name<?php } ?>:</label>
                                            </div>
                                            </dt>
                                            <div class="fm-field-wrap ">
                                                <input id="fm-login-id" class="fm-text" name="data[username]" tabindex="1" placeholder="" value="" autocorrect="off" autocapitalize="off" />
                                            </div>
                                        </dl>
                                        <dl>
                                            <dt class="fm-label">
                                            <div class="fm-label-wrap clr">
                                                <span class="fm-label-extra">
                                                    <a id="forgot-password-link" href="index.php?s=member&c=login&m=find" target="_blank" data-spm-protocol="i"><?php if (SITE_TEMPLATE==cn) { ?>忘记登录密码名<?php } else { ?>Forgot login password<?php } ?>？</a>
                                                </span>
                                                <label for="fm-login-password"><?php if (SITE_TEMPLATE==cn) { ?>登录密码<?php } else { ?>Login password<?php } ?>:</label>
                                            </div>
                                            </dt>
                                            <div class="fm-field-wrap">
                                                <input id="fm-login-password" class="fm-text" type="password" name="data[password]"  tabindex="2" placeholder="" autocorrect="off" autocapitalize="off" />
                                            </div>
                                        </dl>
                                        <dl>
                                            <dt class="fm-label">
                                            </dt>
                                            <?php if ($code) { ?>
                                            <div class="fm-field-wrap" style="overflow:hidden">
                                                <?php if (strlen(SYS_GEE_CAPTCHA_ID) > 10) {  echo dr_geetest();  } else { ?>
                                                <div  class="fm-label-wrap" >
                                                    <input class="fm-text" type="text" autocomplete="off" placeholder="" name="code" style="width:200px;margin-top:0px"/>
                                                </div>
                                                <div  class="fm-label-wrap" >
                                                    <img align="absmiddle" style="cursor:pointer;" onclick="this.src='<?php echo dr_member_url('api/captcha', array('width' => 90, 'height' => 34)); ?>&'+Math.random();" src="<?php echo dr_member_url('api/captcha', array('width' => 90, 'height' => 34)); ?>" />
                                                </div>
                                                <?php } ?>
                                            </div>
                                            <?php } ?>  
                                        </dl>                                        
                                    </div>
                                    <div id="login-submit">
                                        <input type="hidden" name="event_submit_do_login" value="submit" />
                                        <input id="fm-login-submit" value="<?php if (SITE_TEMPLATE==cn) { ?>登录<?php } else { ?>Login<?php } ?>" class="fm-button fm-submit" type="submit" tabindex="4" name="submit-btn" />
                                    </div>
                                    <div id="login-other">
                                        <div class="login-login-links">
                                            <br>
                                            <br>
                                        </div>
                                        <div class="register">
                                            <a href="index.php?c=page&id=22" class="register" target=" _blank" data-spm-protocol="i"><?php if (SITE_TEMPLATE==cn) { ?>免费注册<?php } else { ?>Free Signup<?php } ?></a>
                                        </div>
                                    </div>
                                    <div id="login-title" style="font-size:12px;font-weight:normal;">
                                    </div>
                                </form>
                                <br />
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <style type="text/css">
                #login-form {
                    background-color: #fff;
                }
                
                #screen-banner {
                    position: absolute;
                    top: 90px;
                    left: 0px;
                    width: 100%;
                    height: 675px;
                    background: url('skin/images/login-bg.jpg') center center no-repeat;
                }
                
                #banner {
                    display: none;
                }
                
                #action-container {
                    position: relative;
                    max-width: 1200px;
                    min-height: 600px;
                }
                
                #action-banner {
                    float: left;
                    width: 60%;
                    height: 600px;
                }
                
                #action-banner a {
                    display: block;
                    width: 100%;
                    height: 100%;
                    text-decoration: none;
                }
                
                #login-form-wrapper {
                    float: left;
                    margin-right: 0px;
                    margin-top: 0px;
                    margin-bottom: 0px;
                    padding-bottom: 0px;
                }
                
                #advisory {
                    padding: 10px 0px;
                }
                
                #ui-footer {
                    position: relative;
                    left: auto;
                    bottom: auto;
                }
                
                @media (max-width: 1022px) {
                    #screen-banner {
                        display: none;
                    }
                    #login-form-wrapper {
                        margin-top: 60px;
                    }
                    #action-banner {
                        display: none;
                    }
                }
            </style>
            <!-- tangram:1405 end-->
        </div>

<?php if ($fn_include = $this->_include("footer1.html", "/")) include($fn_include); ?> 