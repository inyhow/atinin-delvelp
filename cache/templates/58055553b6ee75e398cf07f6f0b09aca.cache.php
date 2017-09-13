<?php if ($fn_include = $this->_include("header2.html", "/")) include($fn_include); ?>
        <style>
        body, h1, h2, h3, h4, h5, h6 {
            font-family: "微软雅黑";
        }
        .container {
             width: 100%!important;
             padding-left: 0;
             padding-right: 0;
       }
        .container .container>div{width:auto;}
        .page-content {
            background: #eff3f8;
            padding: 15px 20px;
        }
        .close{
            opacity: 1;
            background: none!important;
            text-indent: 0;
        }
        </style>
    <!-- END HEAD -->
<script type="text/javascript" src="<?php echo HOME_THEME_PATH; ?>shop/js/mzp-packed.js"></script>
<link rel="stylesheet" href="<?php echo HOME_THEME_PATH; ?>shop/css/zzsc.css">
<link rel="stylesheet" href="<?php echo HOME_THEME_PATH; ?>shop/css/magiczoomplus.css">
<script language="javascript">
    // 这是加入收藏夹的ajax请求，我就随意写了一下提示信息，至于美化啊什么交给你们了
    function dr_favorite() {
        $.get("/index.php?s=<?php echo MOD_DIR; ?>&c=api&m=favorite&id=<?php echo $id; ?>", function(data){
            if (data == 1) {
                dr_tips("No login, no collection");
            } else if (data == 2) {
                dr_tips("Goods do not exist, can not be collected");
            } else if (data == 3) {
                dr_tips("Update collection success", 3, 1);
            } else if (data == 4) {
                dr_tips("Successful collection", 3, 1);
            }
        });
    }


    // 购物车
    var is_cart = true;
    function dr_cart() {
        if (!is_cart) {
            alert('Refresh and try again');
            return;
        }
        var num = $("#touchspin_6").attr("value");
        var cart = "<?php echo dr_url('order/cart/add', array('mid'=>APP_DIR, 'cid'=>$id)); ?>&num="+num;
        is_cart = false;
        $.ajax({type: "GET", url: cart, dataType:"jsonp",
            success: function (data) {
                if (data.status) {
                    var html = "<div style=\"font-size:14px\">Successfully added to the shopping cart! There are <font color=red>"+data.code+"</font> kinds of goods in the shopping cart</div>";
                    art.dialog({
                        id: 'cart',
                        lock: true,
                        opacity: 0.1,
                        content: html,
                        ok: function () {
                            location.href="<?php echo dr_url('order/cart/index'); ?>";
                            is_cart = true;
                            return false;
                        },
                        okVal: 'Go to settle accounts',
                        cancelVal: 'Continue shopping',
                        cancel: function () {
                            is_cart = true;
                            return true;
                        }
                    });
                } else {
                    dr_tips(data.code);
                    is_cart = true;
                }
            }
        });
    }

    $(window).ready(
            function () {
                var show =  $("#showArea");
                var left = 0;
                var picBox = $(".smallPic");
                var bigPic = $("#main_img");
                var img = $("#showArea img");
                var speed = img.width()*4;

                show.css("width",((img.length+1)*img.width()).toString()+"px");
                img.hover(
                        function () {
                            bigPic.attr("src",this.src);
                            $(".MagicZoomBigImageCont img").attr("src",this.src);
                            $(".MagicThumb-container img").attr("href",this.src);
                            $("#zoom1").attr("href",this.src);
                        }
                );

                $("#gobottom").click(
                        function () {
                            if (parseInt(show.css("left"))-speed <= (-(show.width() - picBox.width()+speed))) {
                                return 0;
                            }
                            show.animate({
                                "left" : left -= speed
                            },200)
                        }
                );
                $("#gotop").click(
                        function () {
                            if (show.css("left") >= "0px") {
                                return 0;
                            }
                            show.animate({
                                "left": left += speed
                            }, 200)

                        }
                );

            }

    );

    function add(id){
        var input = $(id);
        var v = input.attr("value");
        input.attr("value",++v);
    }

    function reduce(id){
        var input = $(id);
        var v = input.attr("value");
        if (v > 1) {
            input.attr("value", --v);
        }
    }
</script>
<div style="height:30px;"></div>
<div class="box_row banner05" style="border-top: 0px solid #f48000;">
</div>
<div class="page-container">
    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="container">
                <ul class="page-breadcrumb breadcrumb">
                    <li>
                        <a href="<?php echo SITE_URL; ?>">Home</a>
                         > 
                    </li>
                    <li>
                        <a href="<?php echo MODULE_URL; ?>">A&T Mall</a>
                         > 
                    </li>
                    <?php echo dr_catpos($catid, '', true, '<li><a href="{url}">{name}</a> > </li>');  if (IS_PC) { ?>
                    <li>
                        <span><?php echo $title; ?></span>
                    </li>
                    <?php } ?>
                </ul>

                <div class="page-content-inner">
                    <div class="search-page search-content-2">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="portlet light">
                                    <div class="row">
                                        <div class="col-md-5" style="width:420px;">
                                           
                                            <div class="left-pro">
                                                <div class="t2">
                                                    <a href="<?php echo dr_get_file($duotu[0]); ?>" id="zoom1" class="MagicZoom"><img width="360" height="360" src="<?php echo dr_thumb($duotu[0],'360','360'); ?>" id="main_img" class="main_img" width="100%"/></a>
                                                </div>
                                                <div class="t1">
                                                    <img src="<?php echo HOME_THEME_PATH; ?>shop/images/left.gif" id="gotop" />
                                                    <div class="smallPic">
                                                        <div id="showArea">
                                                            <?php if (is_array($duotu)) { $count=count($duotu);foreach ($duotu as $pic) { ?>
                                                            <a href="<?php echo dr_get_file($pic); ?>" rel="zoom1" rev="<?php echo dr_get_file($pic); ?>">
                                                                <img src="<?php echo dr_get_file($pic); ?>" width="320" height="300">
                                                            </a>
                                                            <?php } } ?>
                                                        </div>
                                                    </div>
                                                    <img src="<?php echo HOME_THEME_PATH; ?>shop/images/right.gif" onclick="" id="gobottom"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="portlet light" style="padding-top:0px;margin-bottom:0;padding-left: 0px;">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <span class="caption-subject font-dark bold uppercase"><?php echo $title; ?></span>
                                                    </div>
                                                </div>
                                                <div class="search-post-foot" style="padding-top:0px;text-align:left;padding-bottom: 10px">
                                                 
                                                    <div class="search-post-meta">
                                                        <i class="icon-calendar font-blue"></i>
                                                        <?php echo $updatetime; ?>
                                                    </div>
                                                    <div class="search-post-meta">
                                                        <i class="icon-fire font-blue"></i>
                                                        <?php echo dr_show_hits($id); ?> times
                                                    </div>
                                                  
                                                    <div class="search-post-meta">
                                                        <i class="icon-flag font-blue"></i>
                                                        <a href="javascript:dr_favorite();">Join the collection</a>
                                                    </div>
                                                </div>

                                                <form action="<?php echo SITE_URL; ?>" method="get" class="form-horizontal" novalidate="novalidate">
                                                    <input type="hidden" name="s" value="order">
                                                    <input type="hidden" name="c" value="home">
                                                    <input type="hidden" name="m" value="index">
                                                    <input type="hidden" name="mid" value="<?php echo MOD_DIR; ?>">
                                                    <input type="hidden" name="cid" value="<?php echo $id; ?>">
                                                    <div class="form-body" style="padding-top:10px;">
                                                        <div class="form-group">
                                                            <label class="col-md-2 control-label"><strong>Region：</strong></label>
                                                            <div class="col-md-10"><div class="form-control-static "><i class="fa fa-truck"></i>&nbsp;<?php echo dr_linkagepos('fujian-en', $fj_area, ' > '); ?></div></div>
                                                        </div> <div class="form-group">
                                                            <label class="col-md-2 control-label"><strong>Price：</strong></label>
                                                            <div class="col-md-10"><div class="form-control-static "><i class="fa fa-cny"></i>&nbsp;<?php echo $order_price; ?></div></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-2 control-label"><strong>Surplus：</strong></label>
                                                            <div class="col-md-10"><div class="form-control-static "><i class="fa fa-hourglass-end"></i>&nbsp;<?php echo $order_quantity; ?></div></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-2 control-label"><strong>Sold：</strong></label>
                                                            <div class="col-md-10"><div class="form-control-static "><i class="fa fa-shopping-cart"></i>&nbsp;<?php echo $order_volume; ?></div></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-2 control-label" for="touchspin_6"><strong>Quantity purchased：</strong></label>
                                                            <div class="col-md-4">
                                                                <div class="input-group bootstrap-touchspin">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-default bootstrap-touchspin-down" onclick="reduce('#touchspin_6')" type="button">-</button>
                                                                    </span><span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span>
                                                                    <input id="touchspin_6" type="text" value="1" name="num" class="form-control" style="display: block;">
                                                                    <span class="input-group-addon bootstrap-touchspin-postfix" style="display: none;"></span>
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-default bootstrap-touchspin-up" onclick="add('#touchspin_6')" type="button">+</button>
                                                                    </span>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-body">
                                                        <div class="form-group">
                                                            <div class=" col-md-offset-2 col-md-8">
                                                                <button type="submit" class="mysubmit btn yellow" style="background:#f48000"><i class="fa fa-check"></i> Buy now</button>
                                                                <a class="btn btn-default" href="javascript:;" onclick="dr_cart()"><i class="fa fa-cart-plus"></i>&nbsp;Join the shopping cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="portlet light">
                                    <div class="portlet-body" style="height: auto;">
                                        <div style="border-top:3px solid #ddd;background:#fafafa;">
                                            <div style="border-top:4px solid #f48000  ;width:100px;text-align:center;margin-top:-4px;font-size:16px;height:39px;line-height:29px;">Product details</div>
                                        </div>
                                        <?php echo $content; ?>
                                    </div>
                                    <?php echo dr_module_comment(MOD_DIR, $id); ?>
                                    <div class="relatedReading">
                                        <header>
                                            <img src="<?php echo THEME_PATH; ?>home/img/orangeBg.png">
                                            <span>You may need more</span>
                                        </header>
                                        <section class="box_row">
                                            <?php $return = $this->list_tag("action=related tag=$tag num=4"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                            <div class="relatedPic">
                                                <div><a href="<?php echo $t['url']; ?>" target="_blank"><img style="width:240px;height:240px;" src="<?php if ($t['thumb']!='') {  echo dr_thumb($t['thumb']);  } else {  echo THEME_PATH; ?>home/img/relatedReading.png<?php } ?>"></a></div>
                                                <div class="relatedPicText"><a href="<?php echo $t['url']; ?>"><?php echo dr_strcut($t['title'], 25); ?></a></div>
                                            </div>
                                            <?php } } ?>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="<?php echo HOME_THEME_PATH; ?>shop/js/zzsc.js"></script>
<script type="text/javascript" src="<?php echo HOME_THEME_PATH; ?>photo/src/js/hammer.min.js"></script>
<script type="text/javascript" language="javascript" src="<?php echo HOME_THEME_PATH; ?>photo/lib/FlameViewportScale.js"></script>
<script type="text/javascript" language="javascript" src="<?php echo HOME_THEME_PATH; ?>photo/src/js/jquery.tosrus.min.all.js"></script>
<link type="text/css" media="all" rel="stylesheet" href="<?php echo HOME_THEME_PATH; ?>photo/src/css/jquery.tosrus.all.css" />
<script type="text/javascript" language="javascript">
    jQuery(function($) {
        $('#myphoto a').tosrus({
            pagination: {
                add: true
            },
            caption: {
                add: true
            },
            slides: {
                scale: 'fill'
            }
        });

    });
</script>

<?php if ($fn_include = $this->_include("footer1.html")) include($fn_include); ?>
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