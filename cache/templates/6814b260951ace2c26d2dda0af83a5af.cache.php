<?php if ($fn_include = $this->_include("nheader.html")) include($fn_include); ?>
<script type="text/javascript">
$(function() {
	<?php if ($result == 1) { ?>
	dr_tips('<?php echo fc_lang("操作成功"); ?>', 3, 1);
    <?php } else if ($result) { ?>
    dr_tips('<?php echo $result; ?>', 3);
    <?php }  if (empty($data['SITE_IMAGE_WATERMARK'])) { ?>
    $('.dr_image').hide();
    <?php } else { ?>
	dr_set_mw_type(<?php echo intval($data['SITE_IMAGE_TYPE']); ?>);
    <?php }  if (empty($data['SITE_CLOSE'])) { ?>
        $('.dr_close_msg').hide();
    <?php } else { ?>
        $('.dr_close_msg').show();
    <?php } ?>
    dr_theme(<?php echo $is_theme; ?>);
});
function dr_form_check() {
	if (d_required('name')) return false;
	if (d_isdomain('domain')) return false;
	return true;
}
function dr_set_mw_type(id) {
	$(".dr_mw_1").hide();
	$(".dr_mw_0").hide();
	$(".dr_mw_"+id).show();
}
function dr_theme(id) {
    if (id == 1) {
        $("#dr_theme_html").html($("#dr_web").html());
    } else {
        $("#dr_theme_html").html($("#dr_local").html());
    }
}
</script>
<div id="dr_local" style="display: none">
    <label class="col-md-2 control-label"><?php echo fc_lang('主题风格'); ?>：</label>
    <div class="col-md-9">
        <label><select class="form-control" name="data[SITE_THEME]">
            <option value="default"> -- </option>
            <?php if (is_array($theme)) { $count=count($theme);foreach ($theme as $t) { ?>
            <option<?php if ($t==$data['SITE_THEME']) { ?> selected=""<?php } ?> value="<?php echo $t; ?>"><?php echo $t; ?></option>
            <?php } } ?>
        </select></label>
        <span class="help-block"><?php echo fc_lang('位于网站主站根目录下：根目录/statics/风格名称/'); ?></span>
    </div>
</div>
<div id="dr_web" style="display: none">
    <label class="col-md-2 control-label"><?php echo fc_lang('远程资源'); ?>：</label>
    <div class="col-md-9">
        <input class="form-control  input-xlarge" type="text" placeholder="http://" name="data[SITE_THEME]" value="<?php echo strpos($data['SITE_THEME'], 'http') === 0 ? $data['SITE_THEME'] : ''; ?>">
        <span class="help-block"><?php echo fc_lang('网站将调用此地址的css,js,图片等静态资源'); ?></span>
    </div>
</div>

<form action="" class="form-horizontal" method="post" name="myform" id="myform" onsubmit="return dr_form_check()">
































    <div class="portlet light bordered myfbody">
        <div class="portlet-title tabbable-line">
            <input type="hidden" name="page" id="mypage" value="<?php echo $page; ?>">
            <ul class="nav nav-tabs" style="float:left;">
                <li class="<?php if ($page==0) { ?>active<?php } ?>">
                    <a href="#tab_0" data-toggle="tab" onclick="$('#mypage').val('0')"> <i class="fa fa-cog"></i> <?php echo fc_lang('基本设置'); ?> </a>
                </li>
                






                <li class="<?php if ($page==3) { ?>active<?php } ?>">
                    <a href="#tab_3" data-toggle="tab" onclick="$('#mypage').val('3')"> <i class="fa fa-internet-explorer"></i> <?php echo fc_lang('SEO设置'); ?> </a>
                </li>
                






                <li class="<?php if ($page==5) { ?>active<?php } ?>">
                    <a href="#tab_5" data-toggle="tab" onclick="$('#mypage').val('5')"> <i class="fa fa-tint"></i> <?php echo fc_lang('导航名称'); ?> </a>
                </li>
            </ul>
        </div>
        <div class="portlet-body">
            <div class="tab-content">

                <div class="tab-pane <?php if ($page==0) { ?>active<?php } ?>" id="tab_0">
                    <div class="form-body">


                        <div class="form-group">
                            <label class="col-md-2 control-label" style="padding-top: 10px"><?php echo fc_lang('网站状态'); ?>：</label>
                            <div class="col-md-9">
                                <div class="radio-list">
                                    <label class="radio-inline"><input type="radio" onclick="$('.dr_close_msg').hide()" name="data[SITE_CLOSE]" value="0" <?php if (empty($data['SITE_CLOSE'])) { ?>checked<?php } ?> /> <?php echo fc_lang('开启'); ?></label>
                                    <label class="radio-inline"><input type="radio" onclick="$('.dr_close_msg').show()" name="data[SITE_CLOSE]" value="1" <?php if ($data['SITE_CLOSE']) { ?>checked<?php } ?> /> <?php echo fc_lang('关闭'); ?></label>
                                </div>
                                <span class="help-block"><?php echo fc_lang('当关闭网站时，除管理员之外的用户将无法访问（静态页面除外）'); ?></span>
                            </div>
                        </div>
                        <div class="form-group dr_close_msg">
                            <label class="col-md-2 control-label"><?php echo fc_lang('关闭理由'); ?>：</label>
                            <div class="col-md-9">
                                <textarea class="form-control" style="height:100px" name="data[SITE_CLOSE_MSG]"><?php echo $data['SITE_CLOSE_MSG'] ? $data['SITE_CLOSE_MSG'] : '网站升级中....'; ?></textarea>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><?php echo fc_lang('网站名称'); ?>：</label>
                            <div class="col-md-9">
                                <label><input class="form-control" type="text" name="data[SITE_NAME]" id="dr_name" value="<?php echo $data['SITE_NAME']; ?>"></label>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><?php echo fc_lang('时间格式'); ?>：</label>
                            <div class="col-md-9">
                                <label><input class="form-control" type="text" name="data[SITE_TIME_FORMAT]" value="<?php echo $data['SITE_TIME_FORMAT']; ?>"></label>
                                <span class="help-block"><?php echo fc_lang('网站时间显示格式与date函数一致，默认Y-m-d H:i:s'); ?></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><?php echo fc_lang('网站语言'); ?>：</label>
                            <div class="col-md-9">
                                <label><select class="form-control" name="data[SITE_LANGUAGE]">
                                    <option value="zh-cn"> -- </option>
                                    <?php if (is_array($lang)) { $count=count($lang);foreach ($lang as $t) { ?>
                                    <option<?php if ($t==$data['SITE_LANGUAGE']) { ?> selected=""<?php } ?> value="<?php echo $t; ?>"><?php echo $t; ?></option>
                                    <?php } } ?>
                                </select></label>
                                <span class="help-block"><?php echo fc_lang('网站核心目录及各个模块或应用目录：/language/语言名称/'); ?></span>
                            </div>
                        </div>
                       










                        <div class="form-group" id="dr_theme_html">

                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><?php echo fc_lang('模板目录'); ?>：</label>
                            <div class="col-md-9">
                                <label><select class="form-control" name="data[SITE_TEMPLATE]">
                                    <option value="default"> -- </option>
                                    <?php if (is_array($template_path)) { $count=count($template_path);foreach ($template_path as $t) { ?>
                                    <option<?php if ($t==$data['SITE_TEMPLATE']) { ?> selected=""<?php } ?> value="<?php echo $t; ?>"><?php echo $t; ?></option>
                                    <?php } } ?>
                                </select></label>
                                <span class="help-block"><?php echo fc_lang('位于网站主站根目录下：核心目录/dayrui/templates/目录名称/'); ?></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><?php echo fc_lang('网站时区'); ?>：</label>
                            <div class="col-md-9">
                                <label><select class="form-control" name="data[SITE_TIMEZONE]">
                                    <option value=""> -- </option>
                                    <option value="-12" <?php if ($data['SITE_TIMEZONE']=="-12") { ?>selected<?php } ?>>(GMT -12:00)</option>
                                    <option value="-11" <?php if ($data['SITE_TIMEZONE']=="-11") { ?>selected<?php } ?>>(GMT -11:00)</option>
                                    <option value="-10" <?php if ($data['SITE_TIMEZONE']=="-10") { ?>selected<?php } ?>>(GMT -10:00)</option>
                                    <option value="-9" <?php if ($data['SITE_TIMEZONE']=="-9") { ?>selected<?php } ?>>(GMT -09:00)</option>
                                    <option value="-8" <?php if ($data['SITE_TIMEZONE']=="-8") { ?>selected<?php } ?>>(GMT -08:00)</option>
                                    <option value="-7" <?php if ($data['SITE_TIMEZONE']=="-7") { ?>selected<?php } ?>>(GMT -07:00)</option>
                                    <option value="-6" <?php if ($data['SITE_TIMEZONE']=="-6") { ?>selected<?php } ?>>(GMT -06:00)</option>
                                    <option value="-5" <?php if ($data['SITE_TIMEZONE']=="-5") { ?>selected<?php } ?>>(GMT -05:00)</option>
                                    <option value="-4" <?php if ($data['SITE_TIMEZONE']=="-4") { ?>selected<?php } ?>>(GMT -04:00)</option>
                                    <option value="-3.5" <?php if ($data['SITE_TIMEZONE']=="-3.5") { ?>selected<?php } ?>>(GMT -03:30)</option>
                                    <option value="-3" <?php if ($data['SITE_TIMEZONE']=="-3") { ?>selected<?php } ?>>(GMT -03:00)</option>
                                    <option value="-2" <?php if ($data['SITE_TIMEZONE']=="-2") { ?>selected<?php } ?>>(GMT -02:00)</option>
                                    <option value="-1" <?php if ($data['SITE_TIMEZONE']=="-1") { ?>selected<?php } ?>>(GMT -01:00)</option>
                                    <option value="0" <?php if ($data['SITE_TIMEZONE']=="0") { ?>selected<?php } ?>>(GMT)</option>
                                    <option value="1" <?php if ($data['SITE_TIMEZONE']=="1") { ?>selected<?php } ?>>(GMT +01:00)</option>
                                    <option value="2" <?php if ($data['SITE_TIMEZONE']=="2") { ?>selected<?php } ?>>(GMT +02:00)</option>
                                    <option value="3" <?php if ($data['SITE_TIMEZONE']=="3") { ?>selected<?php } ?>>(GMT +03:00)</option>
                                    <option value="3.5" <?php if ($data['SITE_TIMEZONE']=="3.5") { ?>selected<?php } ?>>(GMT +03:30)</option>
                                    <option value="4" <?php if ($data['SITE_TIMEZONE']=="4") { ?>selected<?php } ?>>(GMT +04:00)</option>
                                    <option value="4.5" <?php if ($data['SITE_TIMEZONE']=="4.5") { ?>selected<?php } ?>>(GMT +04:30)</option>
                                    <option value="5" <?php if ($data['SITE_TIMEZONE']=="5") { ?>selected<?php } ?>>(GMT +05:00)</option>
                                    <option value="5.5" <?php if ($data['SITE_TIMEZONE']=="5.5") { ?>selected<?php } ?>>(GMT +05:30)</option>
                                    <option value="5.75" <?php if ($data['SITE_TIMEZONE']=="5.75") { ?>selected<?php } ?>>(GMT +05:45)</option>
                                    <option value="6" <?php if ($data['SITE_TIMEZONE']=="6") { ?>selected<?php } ?>>(GMT +06:00)</option>
                                    <option value="6.5" <?php if ($data['SITE_TIMEZONE']=="6.6") { ?>selected<?php } ?>>(GMT +06:30)</option>
                                    <option value="7" <?php if ($data['SITE_TIMEZONE']=="7") { ?>selected<?php } ?>>(GMT +07:00)</option>
                                    <option value="8" <?php if ($data['SITE_TIMEZONE']=="" || $data['SITE_TIMEZONE']=="8") { ?>selected<?php } ?>>(GMT +08:00)</option>
                                    <option value="9" <?php if ($data['SITE_TIMEZONE']=="9") { ?>selected<?php } ?>>(GMT +09:00)</option>
                                    <option value="9.5" <?php if ($data['SITE_TIMEZONE']=="9.5") { ?>selected<?php } ?>>(GMT +09:30)</option>
                                    <option value="10" <?php if ($data['SITE_TIMEZONE']=="10") { ?>selected<?php } ?>>(GMT +10:00)</option>
                                    <option value="11" <?php if ($data['SITE_TIMEZONE']=="11") { ?>selected<?php } ?>>(GMT +11:00)</option>
                                    <option value="12" <?php if ($data['SITE_TIMEZONE']=="12") { ?>selected<?php } ?>>(GMT +12:00)</option>
                                </select></label>
                                <span class="help-block"><?php echo fc_lang('例如中国地区选择“GMT +08:00”表示东八区'); ?></span>
                            </div>
                        </div>

                    </div>
                </div>
                









































































                <div class="tab-pane <?php if ($page==3) { ?>active<?php } ?> " id="tab_3">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-2 control-label"><?php echo fc_lang('SEO连接符'); ?>：</label>
                            <div class="col-md-9">
                                <label><input class="form-control" type="text" name="data[SITE_SEOJOIN]" value="<?php echo $data['SITE_SEOJOIN'] ? $data['SITE_SEOJOIN'] : '_'; ?>"></label>
                                <span class="help-block"><?php echo fc_lang('默认为"_"，如：文章标题[连接符]栏目名称[连接符]模块名称'); ?></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><?php echo fc_lang('SEO标题'); ?>：</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="data[SITE_TITLE]" value="<?php echo $data['SITE_TITLE']; ?>">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><?php echo fc_lang('SEO关键字'); ?>：</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="data[SITE_KEYWORDS]" value="<?php echo $data['SITE_KEYWORDS']; ?>">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><?php echo fc_lang('SEO描述信息'); ?>：</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="data[SITE_DESCRIPTION]" value="<?php echo $data['SITE_DESCRIPTION']; ?>">

                            </div>
                        </div>
                    </div>
                </div>
                

























































































































                <div class="tab-pane  <?php if ($page==5) { ?>active<?php } ?>" id="tab_5">
                    <div class="form-body">

                        <?php for ($i = 0; $i <= 9; $i ++) { ?>
                        <div class="form-group">
                            <label class="col-md-2 control-label">type=<?php echo $i; ?>：</label>
                            <div class="col-md-9">
                                <label> <input class="form-control" type="text" name="navigator[<?php echo $i; ?>]" value="<?php echo $navigator[$i]; ?>" /></label>

                            </div>
                        </div>
                        <?php } ?>

                    </div>
                </div>
























            </div>
        </div>
    </div>

    <div class="myfooter">
        <div class="row">
            <div class="portlet-body form">
                <div class="form-body">
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn green"> <i class="fa fa-save"></i> <?php echo fc_lang('保存'); ?></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<?php if ($fn_include = $this->_include("nfooter.html")) include($fn_include); ?>