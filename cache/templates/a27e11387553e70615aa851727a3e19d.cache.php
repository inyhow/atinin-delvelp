<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><?php echo $meta_title; ?></title>
    <meta name="keywords" content="<?php echo $meta_keywords; ?>" />
    <meta name="description" content="<?php echo $meta_description; ?>" />
    <link href="skin/css/style.css" rel="stylesheet" type="text/css" />
    <link href="skin/css/style3.css" rel="stylesheet" type="text/css" />
    <link href="skin/css/css.css" rel="stylesheet" type="text/css" />
    <link href="skin/css/mini-login-form-min.css" rel="stylesheet" type="text/css" />
    <link href="skin/css/login_mini_form_aliyun.css" rel="stylesheet" type="text/css" />
    <link href="skin/css/rwd-sc.css" rel="stylesheet" type="text/css" media="all" />
    <link href="skin/css/home-buyer.css" rel="stylesheet" type="text/css" media="all" />
    <link href="skin/css/register-en.css" rel="stylesheet" type="text/css" media="all" />
    <link href="skin/css/menu-en.css" rel="stylesheet" type="text/css" media="all" />
    <!-- BEGIN CORE PLUGINS -->
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/js.cookie.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN THEME GLOBAL SCRIPTS -->

    <!-- END CORE PLUGINS -->

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
                            <li> <a href="<?php echo SITE_URL; ?>" title="<?php echo SITE_TITLE; ?>">Home</a> </li>
                            <?php $return = $this->list_tag("action=navigator type=0 pid=0 num=6"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                            <li> <a title="<?php echo $t['name']; ?>" href="<?php echo $t['url']; ?>" target="_parent"><?php echo $t['name']; ?></a>
                                <ul>
                                    <?php if ($t['child']) {  $return_t2 = $this->list_tag("action=navigator pid=$t[id]  return=t2"); if ($return_t2) extract($return_t2); $count_t2=count($return_t2); if (is_array($return_t2)) { foreach ($return_t2 as $key_t2=>$t2) { ?>
                                    <li> <a title="<?php echo $t2['name']; ?>" href="<?php echo $t2['url']; ?>" onfocus="this.blur()" style="width:200px;"> <?php echo $t2['name']; ?></a>
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
    <div class="esc-container">
        <div class="register-container">
            <div class="register-block">
                <h2 class="u-title-3">Supply chain membership registration &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:14px;">Existing accounts are logged in </span><a href="/index.php?s=member&c=login&m=index" style="font-size:14px;color:#f8af23;">here</a></h2>
                <div class="util-clearfix">
                    <div class="form-area">
                        <form class="ui-form ui-form-horizontal" id="register-form" action="/index.php?c=form_zhuce" method="post" name="myform">
                            <input type="hidden" name="back" value="<?php echo $back_url; ?>">
                            <div class="ui-form-item">
                                <?php if ($result_error) { ?>
                                <div class="alert alert-danger">
                                    <button class="close" data-close="alert"></button>
                                    <span><?php echo $result_error['msg']; ?></span>
                                </div>
                                <?php } ?>
                                <div class="ui-form-item">
                                    <label class="ui-form-label">
                                <m class="ui-form-required">*</m>
                                Enterprise name:
                            </label>
                                    <div class="ui-form-control">
                                        <input class="ui-textfield ui-textfield-system ui-control-xxl" id="companyName" name="data[title]" value="" type="text" placeholder="Enterprise name" maxlength="64">
                                    </div>
                                </div>
                                <div class="ui-form-item">
                                    <label class="ui-form-label">
                                <m class="ui-form-required">*</m>
                                Business address:
                            </label>
                                    <div class="ui-form-control china-selector-widget" id="china-selector-widget">
                                        <div class="ui-combobox ui-combobox-separate" data-id="china-selector-input-area">
                                            <input class="ui-textfield ui-textfield-system ui-control-xxl" type="text" data-id="china-selector-input" name="data[address]" id="province-input" placeholder="Please enter your contact address ">
                                            <span class="ui-combobox-trigger"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ui-form-item">
                                    <label class="ui-form-label">
                                    <m class="ui-form-required">*</m>
                                    Main business:
                                    </label>
                                    <div class="ui-form-control china-selector-widget" id="china-selector-widget">
                                        <div class="ui-combobox ui-combobox-separate" data-id="china-selector-input-area">
                                            <input class="ui-textfield ui-textfield-system ui-control-xxl" type="text" data-id="china-selector-input" name="data[business]" id="province-input" placeholder="Main business">
                                            <span class="ui-combobox-trigger"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ui-form-item">
                                    <label class="ui-form-label">
                                    <m class="ui-form-required">*</m>
                                    Cooperation matters：
                                    </label>
                                    <div style="text-align: left;margin-left: 110px">
                                        <label class="ui-checkbox"><input type="checkbox" name="data[cooperation][]" value="Customs declaration"   /> Customs declaration </label>
                                        <label class="ui-checkbox"><input type="checkbox" name="data[cooperation][]" value="Logistics"   /> Logistics </label>
                                        <label class="ui-checkbox"><input type="checkbox" name="data[cooperation][]" value="Tax rebate"   /> Tax rebate</label>
                                        <label class="ui-checkbox"><input type="checkbox" name="data[cooperation][]" value="Settlement"   /> Settlement </label>
                                        <label class="ui-checkbox"><input type="checkbox" name="data[cooperation][]" value="Financing"   /> Financing</label>
                                        <label class="ui-checkbox"><input type="checkbox" name="data[cooperation][]" value="Credit insurance"   /> Credit insurance </label>
                                        <label class="ui-checkbox"><input type="checkbox" name="data[cooperation][]" value="Factoring"   />Factoring </label>
                                        <label class="ui-checkbox"><input type="checkbox" name="data[cooperation][]" value="Distribution execution"   />Distribution execution</label>
                                        <label class="ui-checkbox"><input type="checkbox" name="data[cooperation][]" value="Purchasing execution"   /> Purchasing execution</label>
                                        <label class="ui-checkbox"><input type="checkbox" name="data[cooperation][]" value="Overseas Warehous"   />Overseas Warehous</label>
                                        <label class="ui-checkbox"><input type="checkbox" name="data[cooperation][]" value="Supply chain management"   /> Supply chain management </label>
                                        <label class="ui-checkbox"><input type="checkbox" name="data[cooperation][]" value="Cross-border electricity supplier"   /> Cross-border electricity supplier </label>
                                    </div>
                                </div>
                                <div class="ui-form-item">
                                    <label class="ui-form-label">
                                <m class="ui-form-required">*</m>
                                Contacts:
                            </label>
                                    <div class="ui-form-control">
                                        <input class="ui-textfield ui-textfield-system ui-control-xxl" id="userName" name="data[contact]" value="" type="text" placeholder="Contacts" maxlength="10">
                                    </div>
                                </div>
                                <div class="ui-form-item">
                                    <label class="ui-form-label">
                                <m class="ui-form-required">*</m>
                                Mobile phone:
                            </label>

                                    <div class="ui-form-control">
                                        <input class="ui-textfield ui-textfield-system ui-control-xxl" id="mobilePhone" name="data[phone]" value="" type="text" placeholder="Mobile phone" maxlength="11">
                                    </div>
                                </div>
                                <div class="ui-form-item">
                                    <label class="ui-form-label">
                                Fixed telephone:
                            </label>
                                    <div class="ui-form-control">
                                        <input class="ui-textfield ui-textfield-system" style="width:100px;" id="phoneArea" name="data[areacode]" value="" type="text" placeholder="Area code" maxlength="4">
                                        <input class="ui-textfield ui-textfield-system ui-control-l" id="phoneNumber" name="data[phonenumber]" value="" type="text" placeholder="Phone number" maxlength="11">
                                    </div>
                                </div>
                                <div class="ui-form-item">
                                    <label class="ui-form-label">
                                <m class="ui-form-required">*</m>
                                Understanding channels:
                            </label>

                                    <div class="ui-form-control">
                                        <select class="ui-textfield ui-textfield-select ui-control-xxl" name="data[channel]" id="dr_channel"><option value="" >Understanding channels</option><option value="Acquaintance introduction" >Acquaintance introduction</option><option value="Webpage" >Webpage</option><option value="Advertisement" >Advertisement</option></select>
                                    </div>
                                </div>
                                <!--<?php if ($code) { ?>
                        <div class="form-group">
                            <?php if (strlen(SYS_GEE_CAPTCHA_ID) > 10) {  echo dr_geetest();  } else { ?>
                            <div class="col-sm-6" style="padding-left:0;padding-right:0">
                                <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="验证码" name="code" />
                            </div>
                            <div class="col-sm-6">
                                <img align="absmiddle" style="cursor:pointer;" onclick="this.src='<?php echo dr_member_url('api/captcha', array('width' => 120, 'height' => 40)); ?>&'+Math.random();" src="<?php echo dr_member_url('api/captcha', array('width' => 120, 'height' => 40)); ?>" />
                            </div>
                            <?php } ?>
                        </div>
                        <?php } ?>-->
                                <div class="ui-form-item">
                                    <div class="ui-form-control">
                                    </div>
                                </div>
                                <div class="ui-form-item">
                                    <div style="float:right;margin-right:-210px;">
                                        <button type="submit" id="register" class="ui-button ui-button-primary ui-button-large">Register immediately</button>
                                    </div>
                                </div>
                        </form>
                        </div>


                        <!--<div class="banner-area">
                    <img style="margin-top: 20px;" src="skin/images/reg-bg.jpg" width="650" height="360">
                </div>-->
                    </div>
                </div>
            </div>
        </div>
        <?php if ($fn_include = $this->_include("footer1.html", "/")) include($fn_include); ?>
<script type="text/javascript">
$.ajax({  
	type: "GET",  
	async: false,  
	url:"http://en.hf872.com/index.php?c=cron",  
	dataType: "jsonp",
	success: function(json){ },  
	error: function(){ }  
});  
</script>