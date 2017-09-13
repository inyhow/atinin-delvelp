<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><?php echo $meta_title; ?></title>
    <meta name="keywords" content="<?php echo $meta_keywords; ?>" />
    <meta name="description" content="<?php echo $meta_description; ?>" />
    <link href="skin/css/shopstyle.css" rel="stylesheet" type="text/css" />
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
    <script type="text/javascript">
        <!--
        function MM_jumpMenu(targ, selObj, restore) { //v3.0
            eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value + "'");
            if (restore) selObj.selectedIndex = 0;
        }
        //-->
    </script>
    <script src="skin/js/common.js" type="text/javascript"></script>
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
                                    <table width="100%" height="31" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="20%" align="right" valign="middle">
                                                <img src="skin/images/gb_search_tou.jpg" width="10" height="31" />
                                            </td>
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
    <link href="skin/css/base.css" rel="stylesheet">
    <link href="skin/css/index.css" rel="stylesheet">
    <link href="skin/css/banner.css" rel="stylesheet">
    <link href="skin/css/ie.css" rel="stylesheet">
    <script type="text/javascript" src="skin/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="skin/js/glide.min.js"></script>
    <script type="text/javascript" src="skin/js/jquery.jplaceholder.js"></script>
    <script type="text/javascript" src="skin/js/indexnew.js"></script>
    <style type="text/css">
        h1.brandPic_title>a>img {
            position: relative;
            top: -4px;
        }
        
        #adScreen #dr_poster_5 {
            height: auto !important;
        }
        
        #adScreen #dr_poster_5 img {
            width: 1920px;
            height: auto !important;
            position: relative;
            left: 50%;
            margin-left: -960px;
        }
    </style>
    <div class="container">
        <div class="banner full-screen">
            <div id="adScreen">
            <?php if (get_ad_status(5)) {  $poster = dr_poster_list(5, 1);  if (is_array($poster)) { $count=count($poster);foreach ($poster as $i=>$t) { ?>
                <div id="dr_poster_5" style="width:px;height:px"><a href="<?php echo $t['url']; ?>" target="_blank"><img src=" <?php echo $t['file']; ?>"  width="" height="" /></a></div>  
               
            <?php } }  } ?>
            </div>
        </div>
        <!--显示页面位置end-->
        <div class="productBox scrollSpyBox">
            <div class="affix_p" data-spy="affix" data-offset-top="1150" data-offset-bottom="500">
                <div id="myScrollspy">
                    <div class="catalog-scroller">

                        <div class="affixIcon"><img src="skin/images/fireicon.png"></div>
                        <dl class="nav" id="myNav">
                            <dt class="active"><a href="#section-1">Import&export customs clearance Logistics</a></dt>
                            <dt><a href="#section-2">2F</a></dt>
                            <dt><a href="#section-3">3F</a></dt>
                            <dt><a href="#section-4">4F</a></dt>
                        </dl>
                    </div>
                </div>
            </div>
        <!-- 进出口通关物流-->
        <div class="brandPic ">
            <?php $return_c1 = $this->list_tag("action=category module=shop site=2 id=1 key=k1  return=c1"); if ($return_c1) extract($return_c1); $count_c1=count($return_c1); if (is_array($return_c1)) { foreach ($return_c1 as $key_c1=>$c1) { ?>
            <div class="navTitle">
                <h1 class="brandPic_title">
                    <a><img src="<?php echo THEME_PATH; ?>home/img/iconbg09.png" ></a>
                    <span style="font-size:23px;position:relative;top:-1px;">1F· </span> <span id="section-1" style="position:relative;top:-3px;"><a href="<?php echo $c1['url']; ?>" target="_blank"><?php echo $c1['name']; ?></a></span>
                </h1>
                <div class="navBox">
                    <ul class="nav01" id="gsnav" data="<?php echo $c1['catids'][1]; ?>">
                        <?php $return_c2 = $this->list_tag("action=category module=shop pid=$c1[id]  return=c2"); if ($return_c2) extract($return_c2); $count_c2=count($return_c2); if (is_array($return_c2)) { foreach ($return_c2 as $key_c2=>$c2) { ?> 
                        <li <?php if ($c2['id'] == $c1['catids'][k1+1]) { ?>class="on"<?php } ?> data="<?php echo $c2['id']; ?>"><a><?php echo $c2['name']; ?></a></li>  
                        <?php } } ?>
                        <li class="more"><a href="<?php echo $c1['url']; ?>" target="_blank">More ></a></li>
                    </ul>
                </div>
            </div>
        <div class="brandPic_left"> 
            <?php if (get_ad_status(6)) {  $poster = dr_poster_list(6, 1);  if (is_array($poster)) { $count=count($poster);foreach ($poster as $i=>$t) { ?>
                <div id="dr_poster_5" style="width:px;height:px"><a href="<?php echo $t['url']; ?>" target="_blank"><img src=" <?php echo $t['file']; ?>"  width="" height="" /></a></div>  
               
            <?php } }  } ?>
        </div>
        <div class="brandPic_right">
            <div class="brandPicBox">
                <div class="picRow02">
                    <?php $return_c2 = $this->list_tag("action=category module=shop pid=$c1[id]  return=c2"); if ($return_c2) extract($return_c2); $count_c2=count($return_c2); if (is_array($return_c2)) { foreach ($return_c2 as $key_c2=>$c2) { ?>
                    <ul id="tab<?php echo $c2['id']; ?>" <?php if ($c2['id'] != $c1['catids'][k1+1]) { ?>style="display:none;"<?php } ?>>
                        <?php $return = $this->list_tag("action=module module=shop catid=$c2[id] order=displayorder_desc num=8"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                        <li>
                            <div class="picBox">
                                <a href="<?php echo $t['url']; ?>" target="_blank"><img src="<?php if ($t['thumb']!='') {  echo dr_thumb($t['thumb']);  } else {  echo THEME_PATH; ?>home/img/ad13.png<?php } ?>"></a> 
                            </div>
                            <div class="textBox">
                                <span class="textRow"><a href="<?php echo $t['url']; ?>" target="_blank"><?php echo dr_strcut($t['title'], 24); ?></a></span>
                                <span class="textRow price">￥<?php echo $t['order_price']; ?><span style="float:right">Deal：<?php echo $t['order_volume']; ?></span></span>
                            </div>
                        </li>
                        <?php } } ?>
                    </ul>
                    <?php } } ?>
                </div> 
            </div>            
        </div>
    </div>
    <?php } } ?>
     <!--产业布局-->
        <div class="brandPic ">
            <?php $return_c1 = $this->list_tag("action=category module=shop id=2 key=k1  return=c1"); if ($return_c1) extract($return_c1); $count_c1=count($return_c1); if (is_array($return_c1)) { foreach ($return_c1 as $key_c1=>$c1) { ?>
            <div class="navTitle">
                <h1 class="brandPic_title">
                    <a><img src="<?php echo THEME_PATH; ?>home/img/iconbg09.png" ></a>
                    <span style="font-size:23px;position:relative;top:-1px;">2F· </span> <span id="section-2" style="position:relative;top:-3px;"><a href="<?php echo $c1['url']; ?>" target="_blank"><?php echo $c1['name']; ?></a></span>
                </h1>
                <div class="navBox">
                    <ul class="nav01" id="gsnav" data="<?php echo $c1['catids'][1]; ?>">
                        <?php $return_c2 = $this->list_tag("action=category module=shop pid=$c1[id]  return=c2"); if ($return_c2) extract($return_c2); $count_c2=count($return_c2); if (is_array($return_c2)) { foreach ($return_c2 as $key_c2=>$c2) { ?> 
                        <li <?php if ($c2['id'] == $c1['catids'][k1+1]) { ?>class="on"<?php } ?> data="<?php echo $c2['id']; ?>"><a><?php echo $c2['name']; ?></a></li>  
                        <?php } } ?>
                        <li class="more"><a href="<?php echo $c1['url']; ?>" target="_blank">More ></a></li>
                    </ul>
                </div>
            </div>
        <div class="brandPic_left"> 
            <div class="brandImg">
            <?php if (get_ad_status(7)) {  $poster = dr_poster_list(7, 1);  if (is_array($poster)) { $count=count($poster);foreach ($poster as $i=>$t) { ?>
                <div id="dr_poster_5" style="width:px;height:px"><a href="<?php echo $t['url']; ?>" target="_blank"><img src=" <?php echo $t['file']; ?>"  width="" height="" /></a></div>  
               
            <?php } }  } ?>
            </div>
        </div>
        <div class="brandPic_right">
            <div class="brandPicBox">
                <div class="picRow02">
                    <?php $return_c2 = $this->list_tag("action=category module=shop pid=$c1[id]  return=c2"); if ($return_c2) extract($return_c2); $count_c2=count($return_c2); if (is_array($return_c2)) { foreach ($return_c2 as $key_c2=>$c2) { ?>
                    <ul id="tab<?php echo $c2['id']; ?>" <?php if ($c2['id'] != $c1['catids'][k1+1]) { ?>style="display:none;"<?php } ?>>
                        <?php $return = $this->list_tag("action=module module=shop catid=$c2[id] order=displayorder_desc num=8"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                        <li>
                            <div class="picBox">
                                <a href="<?php echo $t['url']; ?>" target="_blank"><img src="<?php if ($t['thumb']!='') {  echo dr_thumb($t['thumb']);  } else {  echo THEME_PATH; ?>home/img/ad13.png<?php } ?>"></a> 
                            </div>
                            <div class="textBox">
                                <span class="textRow"><a href="<?php echo $t['url']; ?>" target="_blank"><?php echo dr_strcut($t['title'], 24); ?></a></span>
                                <span class="textRow price">￥<?php echo $t['order_price']; ?><span style="float:right">Deal：<?php echo $t['order_volume']; ?></span></span>
                            </div>
                        </li>
                        <?php } } ?>
                    </ul>
                    <?php } } ?>
                </div> 
            </div>            
        </div>
    </div>
    <?php } } ?>
      <!--供应链金融-->
        <div class="brandPic ">
            <?php $return_c1 = $this->list_tag("action=category module=shop id=3 key=k1  return=c1"); if ($return_c1) extract($return_c1); $count_c1=count($return_c1); if (is_array($return_c1)) { foreach ($return_c1 as $key_c1=>$c1) { ?>
            <div class="navTitle">
                <h1 class="brandPic_title">
                    <a><img src="<?php echo THEME_PATH; ?>home/img/iconbg09.png" ></a>
                    <span style="font-size:23px;position:relative;top:-1px;">3F· </span> <span id="section-3" style="position:relative;top:-3px;"><a href="<?php echo $c1['url']; ?>" target="_blank"><?php echo $c1['name']; ?></a></span>
                </h1>
                <div class="navBox">
                    <ul class="nav01" id="gsnav" data="<?php echo $c1['catids'][1]; ?>">
                        <?php $return_c2 = $this->list_tag("action=category module=shop pid=$c1[id]  return=c2"); if ($return_c2) extract($return_c2); $count_c2=count($return_c2); if (is_array($return_c2)) { foreach ($return_c2 as $key_c2=>$c2) { ?> 
                        <li <?php if ($c2['id'] == $c1['catids'][k1+1]) { ?>class="on"<?php } ?> data="<?php echo $c2['id']; ?>"><a><?php echo $c2['name']; ?></a></li>  
                        <?php } } ?>
                        <li class="more"><a href="<?php echo $c1['url']; ?>" target="_blank">More ></a></li>
                    </ul>
                </div>
            </div>
        <div class="brandPic_left"> 
            <div class="brandImg">
            <?php if (get_ad_status(8)) {  $poster = dr_poster_list(8, 1);  if (is_array($poster)) { $count=count($poster);foreach ($poster as $i=>$t) { ?>
                <div id="dr_poster_5" style="width:px;height:px"><a href="<?php echo $t['url']; ?>" target="_blank"><img src=" <?php echo $t['file']; ?>"  width="" height="" /></a></div>  
               
            <?php } }  } ?>
            </div>
        </div>
        <div class="brandPic_right">
            <div class="brandPicBox">
                <div class="picRow02">
               <!--glide轮播-->
                            <div id="Glide02" class="glide">
                                <div class="glide__wrapper">
                                    <ul class="glide__track">
                                        <li class="glide__slide">
                                            <div class="box" style="background-color: #77A7FB; ">
                                                <?php if (get_ad_status(10)) {  $poster = dr_poster_list(10, 1);  if (is_array($poster)) { $count=count($poster);foreach ($poster as $i=>$t) { ?>
                                                    <div id="dr_poster_5" style="width:px;height:px"><a href="<?php echo $t['url']; ?>" target="_blank"><img src=" <?php echo $t['file']; ?>"  width="" height="" /></a></div>  

                                                <?php } }  } ?>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="glide__bullets"></div>
                            </div>                    
                    <?php $return_c2 = $this->list_tag("action=category module=shop pid=$c1[id]  return=c2"); if ($return_c2) extract($return_c2); $count_c2=count($return_c2); if (is_array($return_c2)) { foreach ($return_c2 as $key_c2=>$c2) { ?>
                    <ul id="tab<?php echo $c2['id']; ?>" <?php if ($c2['id'] != $c1['catids'][k1+1]) { ?>style="display:none;"<?php } ?>>
                        <?php $return = $this->list_tag("action=module module=shop catid=$c2[id] order=displayorder_desc num=8"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                        <li>
                            <div class="picBox">
                                <a href="<?php echo $t['url']; ?>" target="_blank"><img src="<?php if ($t['thumb']!='') {  echo dr_thumb($t['thumb']);  } else {  echo THEME_PATH; ?>home/img/ad13.png<?php } ?>"></a> 
                            </div>
                            <div class="textBox">
                                <span class="textRow"><a href="<?php echo $t['url']; ?>" target="_blank"><?php echo dr_strcut($t['title'], 24); ?></a></span>
                                <span class="textRow price">￥<?php echo $t['order_price']; ?><span style="float:right">Deal：<?php echo $t['order_volume']; ?></span></span>
                            </div>
                        </li>
                        <?php } } ?>
                    </ul>
                    <?php } } ?>
                </div> 
            </div>            
        </div>
    </div>
    <?php } } ?>
        <!-- 虚拟生产 -->
        <div class="productBox" style="padding-bottom:60px;">
        <div class="brandPic ">
            <?php $return_c1 = $this->list_tag("action=category module=shop id=4 key=k1  return=c1"); if ($return_c1) extract($return_c1); $count_c1=count($return_c1); if (is_array($return_c1)) { foreach ($return_c1 as $key_c1=>$c1) { ?>
            <div class="navTitle">
                <h1 class="brandPic_title">
                    <a><img src="<?php echo THEME_PATH; ?>home/img/iconbg09.png" ></a>
                    <span style="font-size:23px;position:relative;top:-1px;">4F· </span> <span id="section-4" style="position:relative;top:-3px;"><a href="<?php echo $c1['url']; ?>" target="_blank"><?php echo $c1['name']; ?></a></span>
                </h1>
                <div class="navBox">
                    <ul class="nav01" id="gsnav" data="<?php echo $c1['catids'][1]; ?>">
                        <?php $return_c2 = $this->list_tag("action=category module=shop pid=$c1[id]  return=c2"); if ($return_c2) extract($return_c2); $count_c2=count($return_c2); if (is_array($return_c2)) { foreach ($return_c2 as $key_c2=>$c2) { ?> 
                        <li <?php if ($c2['id'] == $c1['catids'][k1+1]) { ?>class="on"<?php } ?> data="<?php echo $c2['id']; ?>"><a><?php echo $c2['name']; ?></a></li> 
                        <?php } } ?>
                        <li class="more"><a href="<?php echo $c1['url']; ?>" target="_blank">More ></a></li>
                    </ul>
                </div>
            </div>
        <div class="brandPic_left"> 
            <div class="brandImg">
            <?php if (get_ad_status(9)) {  $poster = dr_poster_list(9, 1);  if (is_array($poster)) { $count=count($poster);foreach ($poster as $i=>$t) { ?>
                <div id="dr_poster_5" style="width:px;height:px"><a href="<?php echo $t['url']; ?>" target="_blank"><img src=" <?php echo $t['file']; ?>"  width="" height="" /></a></div>  
               
            <?php } }  } ?>
            </div>
        </div>
        <div class="brandPic_right">
             <div class="brandPicBox">
                <div class="picRow02">
                     <!--glide轮播-->
                            <div id="Glide02" class="glide">
                                <div class="glide__wrapper" >
                                    <ul class="glide__track">

                                        <li class="glide__slide">
                                            <div class="box" style="background-color: #77A7FB; ">
                                                <?php if (get_ad_status(11)) {  $poster = dr_poster_list(11, 1);  if (is_array($poster)) { $count=count($poster);foreach ($poster as $i=>$t) { ?>
                                                    <div id="dr_poster_5" style="width:px;height:px"><a href="<?php echo $t['url']; ?>" target="_blank"><img src=" <?php echo $t['file']; ?>"  width="" height="" /></a></div>  

                                                <?php } }  } ?>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="glide__bullets"></div>
                            </div>
                    <?php $return_c2 = $this->list_tag("action=category module=shop pid=$c1[id]  return=c2"); if ($return_c2) extract($return_c2); $count_c2=count($return_c2); if (is_array($return_c2)) { foreach ($return_c2 as $key_c2=>$c2) { ?>
                    <ul id="tab<?php echo $c2['id']; ?>" <?php if ($c2['id'] != $c1['catids'][k1+1]) { ?>style="display:none;"<?php } ?>>
                        <?php $return = $this->list_tag("action=module module=shop catid=$c2[id] order=displayorder_desc num=8"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                        <li>
                            <div class="picBox">
                                <a href="<?php echo $t['url']; ?>" target="_blank"><img src="<?php if ($t['thumb']!='') {  echo dr_thumb($t['thumb']);  } else {  echo THEME_PATH; ?>home/img/ad13.png<?php } ?>"></a> 
                            </div>
                            <div class="textBox">
                                <span class="textRow"><a href="<?php echo $t['url']; ?>" target="_blank"><?php echo dr_strcut($t['title'], 24); ?></a></span>
                                <span class="textRow price">￥<?php echo $t['order_price']; ?><span style="float:right">Deal：<?php echo $t['order_volume']; ?></span></span>
                            </div>
                        </li>
                        <?php } } ?>
                    </ul>
                    <?php } } ?>
                </div> 
            </div>            
        </div>
    </div>
    <?php } } ?>
</div>
</div>

        <!--切换-->
        <script type="text/javascript">
            $(function() {
                $("body").attr({
                    'data-spy': "scroll",
                    'data-target': "#myScrollspy"
                });

                $(".nav01 li").each(function(index, el) {
                    $(el).mouseover(function() {
                        var tabIndex = $(el).attr("data");
                        console.log(tabIndex)
                        if ($(this).hasClass("on")) return;
                        $(this).addClass("on").siblings().removeClass("on");
                        $('#tab' + tabIndex).show().siblings("ul").hide();
                    })
                })
            })

            window.onload = function() {
                var slider01 = $('.Glide01').glide({
                    autoheight: true
                });
                var slider01_api = slider01.data('glide_api');
                var slider02 = $('#Glide02').glide({
                    autoheight: true
                });
                var slider02_api = slider02.data('glide_api');
            }
        </script>
        <!--切换-->

        <style type="text/css">
            .map_l h1,
            .map_r h1 {
                font-size: 1.5em;
                font-weight: bold;
            }
            
            hr,
            p {
                margin: 0;
            }
        </style>
    </div>
    <div class="container01" style="width:100%">
        <div class="bottom clear">
            <!-- 页尾 -->

            <div id="contact" class="contact full-width">

                <div class="footer_l contact_l"></div>


                <div class="footer_r contact_r">
                    <div class="close"><img style="margin-left: 40px" src="skin/images/icon_circle_close.png"></div>

                    <form action="/index.php?c=form_service" method="post" name="myform" id="myform">
                        <div class="input_box">
                            <div class="input_group input_account">
                            </div>
                            <div class="input_group input_account">
                            </div>
                            <div class="input_group input_account">
                            </div>
                            <div class="input_group input_account">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <link rel="stylesheet" type="text/css" href="<?php echo THEME_PATH; ?>home/css/affixBeta.css">
        <script type="text/javascript" src="<?php echo THEME_PATH; ?>home/js/affixBeta.js"></script>
        <link rel="stylesheet" type="text/css" href="<?php echo THEME_PATH; ?>home/css/glide.core.css">
        <link rel="stylesheet" type="text/css" href="<?php echo THEME_PATH; ?>home/css/glide.theme.css">
        <style type="text/css">
            h1.brandPic_title>a>img {
                position: relative;
                top: -4px;
            }
            
            #adScreen #dr_poster_17 {
                height: auto !important;
            }
            
            #adScreen #dr_poster_17 img {
                width: 1920px;
                height: auto !important;
                position: relative;
                left: 50%;
                margin-left: -960px;
            }
        </style>

        <!--切换-->
        <script type="text/javascript">
            $(function() {
                $("body").attr({
                    'data-spy': "scroll",
                    'data-target': "#myScrollspy"
                });



                $(".nav01 li").each(function(index, el) {
                    $(el).mouseover(function() {
                        var tabIndex = $(el).attr("data");
                        console.log(tabIndex)
                        if ($(this).hasClass("on")) return;
                        $(this).addClass("on").siblings().removeClass("on");
                        $('#tab' + tabIndex).show().siblings("ul").hide();
                    })
                })
            })

            window.onload = function() {
                var slider01 = $('.Glide01').glide({
                    autoheight: true
                });
                var slider01_api = slider01.data('glide_api');
                var slider02 = $('#Glide02').glide({
                    autoheight: true
                });
                var slider02_api = slider02.data('glide_api');
            }
        </script>
        <!--切换-->
 <?php if ($fn_include = $this->_include("footer1.html")) include($fn_include);  echo '<noscript><noscript>';?>
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