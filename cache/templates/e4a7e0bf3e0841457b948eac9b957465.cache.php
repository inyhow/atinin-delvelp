<?php if ($fn_include = $this->_include("header.html")) include($fn_include);  if (get_ad_status(1)) {  $poster = dr_poster_list(2, 1);  if (is_array($poster)) { $count=count($poster);foreach ($poster as $i=>$t) { ?>
<div style="background:url(<?php echo $t['file']; ?>) center center no-repeat; height:281px;"></div>
<?php } }  } ?>
<div id="container2">
    <div id="mainBody_in">
        <div class="right_in_right_titile">
            <div class="weizhi_now"><?php echo dr_catpos($catid, '', true, '{name}'); ?></div>
            <div class="position_now"> <img src="skin/images/home_btnsd.gif" width="10" height="9" align="absmiddle" />&nbsp; <img src="skin/images/jiantou.gif" align="absmiddle" />&nbsp; <a href="<?php echo SITE_URL; ?>"><?php if (SITE_TEMPLATE==cn) { ?>网站首页<?php } else { ?>Home<?php } ?></a>&nbsp;<img src="skin/images/jiantou.gif" align="absmiddle" /> &nbsp;<span class="color4c5560"></span><?php echo dr_catpos($catid, '', true, '{name}'); ?>
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
                                <a href="<?php echo $t['url']; ?>" class="pro_menubg_<?php if ($catid==3 || $catid =='') { ?>over<?php } ?>"><?php echo $t['name']; ?></a>
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
                <div class="right_in_right_content">
                    <div class="NEWS_in_right_content">
                        <ul>
                            <?php $return = $this->list_tag("action=module module=news catid=$catid order=updatetime page=1"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                            <li>
                                <div class="news_left_contents"><a target="_blank" href="<?php echo $t['url']; ?>"><?php echo dr_strcut($t['title'], 60); ?></a></div>
                                <div class="news_left_times"> [<?php echo dr_date($t['_updatetime'], 'Y-m-d'); ?>] </div>
                                <div class="clearfloat"></div>
                            </li>
                            <?php } } ?>
                        </ul>
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td align="center">
                                <style>
                                    <!-- #dcms_pager .pages {
                                        border: none;
                                        text-transform: uppercase;
                                        font-size: 12px;
                                        margin: 10px 0 10px 0;
                                        padding: 0;
                                        height: 20px;
                                        clear: both;
                                        text-align: center;
                                    }
                                    
                                    #dcms_pager .pages a {
                                        border: 1px solid #ccc;
                                        text-decoration: none;
                                        margin: 0 5px 0 0;
                                        padding: 0 3px 0 3px;
                                        font-size: 12px;
                                        height: 16px;
                                        line-height: 16px;
                                    }
                                    
                                    #dcms_pager .pages a:hover {
                                        border: 1px solid #aeaeae;
                                    }
                                    
                                    #dcms_pager .pages .pgEmpty {
                                        border: 1px solid #eee;
                                        color: #eee;
                                    }
                                    
                                    #dcms_pager .pages .pgCurrent {
                                        border: 1px solid #aeaeae;
                                        color: #000;
                                        font-weight: bold;
                                        background-color: #eee;
                                    }
                                    
                                    -->
                                </style>
                                <div id="dcms_pager" >
                                  <div class=pages><?php echo str_replace(array("<li>","<li class=\"active\">","<li class=\"page-active active\">","<li class=\"triangles_right\">","</li>","<a>"),array("","","","","","<a class=\"page-number pgcurrent\">"),$pages); ?></div>
                                </div>
                             </td>
                        </tr>
                    </table> 
                    </div>
                </div>
                <div style="clear:both"></div>
            </div>
        </div>
        <div class="clearfloat"></div>
    </div>
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