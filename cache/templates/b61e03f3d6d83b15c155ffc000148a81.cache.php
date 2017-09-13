<?php if ($fn_include = $this->_include("header.html")) include($fn_include);  if (get_ad_status(1)) {  $poster = dr_poster_list(2, 1);  if (is_array($poster)) { $count=count($poster);foreach ($poster as $i=>$t) { ?>
<div style="background:url(<?php echo $t['file']; ?>) center center no-repeat; height:281px;"></div>
<?php } }  } ?>
<div id="container2">
    <div id="mainBody_in">
        <div class="right_in_right_titile">
            <div class="weizhi_now"><?php echo $name; ?></div>
            <div class="position_now"> <img src="skin/images/home_btnsd.gif" width="10" height="9" align="absmiddle" />&nbsp; <img src="skin/images/jiantou.gif" align="absmiddle" />&nbsp; About A&T&nbsp;<img src="skin/images/jiantou.gif" align="absmiddle" /> &nbsp;<span class="color4c5560"></span><?php echo $name; ?>
            </div>
        </div>
        <!--中间内容开始-->
        <div id="left">
            <div class="left_in_nav">
                <!--左边二级导航栏开始-->
                <div id="pro_nav_content">
                    <div id="DivList">
                        <?php $return = $this->list_tag("action=navigator type=0 pid=6"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                        <div id="yiji_nav">
                            <div>
                                <a href="<?php echo $t['url']; ?>" class="pro_menubg_"><?php echo $t['name']; ?></a>
                            </div>
                        </div>
                        <div id="Div_173" class="sub" style="display:none; width:100%;">
                            <div style="">
                            </div>
                        </div>
                        <?php } } ?>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function() {
                            var fid = '173';
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
                <!--<div style="line-height:22px; height:22px; text-align:center; color:#6b6b6b">作者：<?php echo $author; ?> &nbsp;时间 ：<?php echo $updatetime; ?>&nbsp;浏览：<?php echo dr_show_hits($id); ?>
                </div>-->
                <div class="right_in_right_content">
                    <div class="about_us_content_right">
                        <p><span style="font-size: 14px;"><span style="font-family:SimSun;"><?php echo $content; ?></span></span>
                        </p>
                    </div>
                </div>
                <div style="clear:both"></div>
                <div style="height:30px;"></div>                
            <!-- JiaThis Button BEGIN -->
            <div class="jiathis_style_24x24">
               <span class="jiathis_txt" style="font-size:12px;">Share to：</span>
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
	url:"http://en.hf872.com/index.php?c=cron",  
	dataType: "jsonp",
	success: function(json){ },  
	error: function(){ }  
});  
</script>