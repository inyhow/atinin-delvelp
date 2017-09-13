<?php if ($fn_include = $this->_include("header.html")) include($fn_include);  if (get_ad_status(1)) {  $poster = dr_poster_list(2, 1);  if (is_array($poster)) { $count=count($poster);foreach ($poster as $i=>$t) { ?>
<div style="background:url(<?php echo $t['file']; ?>) center center no-repeat; height:281px;"></div>
<?php } }  } ?>
<div id="container2">
    <div id="mainBody_in">
        <div class="right_in_right_titile">
            <div class="weizhi_now"><?php echo $name; ?></div>
            <div class="position_now"> <img src="skin/images/home_btnsd.gif" width="17" height="19" align="absmiddle" />&nbsp;&nbsp; <img src="skin/images/jiantou.gif" align="absmiddle" />&nbsp;&nbsp; <a href="<?php echo SITE_URL; ?>">网站首页</a>&nbsp;&nbsp;<img src="skin/images/jiantou.gif" align="absmiddle" /> &nbsp;&nbsp;<span class="color4c5560"></span><a href=""><?php echo $name; ?></a>
            </div>
        </div>
        <!--中间内容开始-->
        <div id="left">
            <div class="left_in_nav">
                <!--左边二级导航栏开始-->
                <div id="pro_nav_content">
                    <div id="DivList">
                        <?php $return = $this->list_tag("action=navigator type=0 pid=1"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                        <div id="yiji_nav">
                            <div>
                                <a href="<?php echo $t['url']; ?>" name="sub" id="<?php echo $t['id']; ?>" class="pro_menubg_"><?php echo $t['name']; ?></a>
                            </div>
                        </div>
                        <div id="Div_<?php echo $t['id']; ?>" class="sub" style="display:none; width:100%;">
                            <div style="">
                                <?php if ($t['child']) {  $return_t2 = $this->list_tag("action=navigator pid=$t[id]  return=t2"); if ($return_t2) extract($return_t2); $count_t2=count($return_t2); if (is_array($return_t2)) { foreach ($return_t2 as $key_t2=>$t2) { ?>
                                <div style="padding-left:10px;font-family:微软雅黑;font-size:18px;text-align:left;line-height:26px"> <a title="<?php echo $t2['name']; ?>" class="pro_erjimenubg_" href="<?php echo $t2['url']; ?>" name="sub" id="<?php echo $t['id']; ?>"><span style="font-size:10px"></span><?php echo $t2['name']; ?></a></div>
                                <div id="show74" style="display:none;text-align:left;padding-left:40px;" class="sub1">
                                </div>
                                <?php } }  } ?>
                            </div>
                        </div>
                        <?php } } ?>
                        </div>
                        <script type="text/javascript">
                            $(document).ready(function() {
                                if(<?php echo $id; ?>==4|<?php echo $id; ?>>9&<?php echo $id; ?><17){
                                 var fid = '7';
                                }else if(<?php echo $id; ?>==8|<?php echo $id; ?>>16&<?php echo $id; ?><20){
                                 var fid = '18';
                                }
                                $("#" + fid + "").attr("class", "pro_menubg_over");
                                $("#Div_" + fid + "").css("display", "");
                                var sid = '';
                                $("#show" + sid + "").css("display", "");
                            });
                        </script>
                    </div>
                    <!--左边二级导航栏END-->
                </div>
                <div>
                    <div>
                        <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=<?php echo dr_block(2); ?>&amp;menu=yes" target="_blank"><img src="skin/images/lianxi.jpg" width="229px;"></a>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </div>
                </div>
            </div>
            <div id="right">
            <div class="right_in_right">
                <div class="about_tit">
                    <?php echo $title; ?>
                </div>
                    <div class="right_in_right_content">
                        <div class="about_us_content_right">
                            <p><span style="font-size: 14px;"><span style="font-family:SimSun;">　　<?php echo $content; ?></span></span>
                            </p>
                        </div>
                    </div>
                    <div style="clear:both"></div>
                <div style="height:30px;"></div>                
            <!-- JiaThis Button BEGIN -->
            <div class="jiathis_style_24x24">
               <span class="jiathis_txt" style="font-size:12px;">分享到：</span>
                <a class="jiathis_button_qzone"></a>
                <a class="jiathis_button_tsina"></a>
                <a class="jiathis_button_tqq"></a>
                <a class="jiathis_button_weixin"></a>
                <a class="jiathis_button_renren"></a>
                <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
                <a class="jiathis_counter_style"></a>
            </div>
            <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
            <!-- JiaThis Button END -->                  
                </div>
            </div>
            <div class="clearfloat"></div>
        </div>
    </div>
    <div>
<?php if ($fn_include = $this->_include("footer1.html")) include($fn_include); ?>
<script type="text/javascript">
$.ajax({  
	type: "GET",  
	async: false,  
	url:"http://demo.hf872.com/index.php?c=cron",  
	dataType: "jsonp",
	success: function(json){ },  
	error: function(){ }  
});  
</script>