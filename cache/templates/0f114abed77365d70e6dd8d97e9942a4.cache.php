<?php if ($fn_include = $this->_include("nheader.html")) include($fn_include); ?>
<script type="text/javascript">
function dr_to_key() {
	$.post("<?php echo dr_url('system/syskey'); ?>", function(data){
        $("#sys_key").val(data);
    });
    $.post("<?php echo dr_url('system/referer'); ?>", function(data){
        $("#sys_referer").val(data);
    });
}
</script>
<div class="page-bar">
    <ul class="page-breadcrumb mylink">
        <?php echo $menu['link']; ?>
    </ul>
    <ul class="page-breadcrumb myname">
        <?php echo $menu['name']; ?>
    </ul>
    <div class="page-toolbar">
        <div class="btn-group pull-right">
            <button type="button" class="btn green btn-sm btn-outline dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <?php echo fc_lang('操作菜单'); ?>
                <i class="fa fa-angle-down"></i>
            </button>
            <ul class="dropdown-menu pull-right" role="menu">
                <?php if (is_array($menu['quick'])) { $count=count($menu['quick']);foreach ($menu['quick'] as $t) { ?>
                <li>
                    <a href="<?php echo $t['url']; ?>"><?php echo $t['icon'];  echo $t['name']; ?></a>
                </li>
                <?php } } ?>
                <li class="divider"> </li>
                <li>
                    <a href="javascript:window.location.reload();">
                        <i class="icon-refresh"></i> <?php echo fc_lang('刷新页面'); ?></a>
                </li>
            </ul>
        </div>
    </div>
</div>
<h3 class="page-title">
    <small></small>
</h3>

<form class="form-horizontal" action="" method="post" id="myform" name="myform">
<input name="page" id="mypage" type="hidden" value="<?php echo $page; ?>" />
    <div class="portlet light bordered myfbody">
        <div class="portlet-title tabbable-line">
            <ul class="nav nav-tabs" style="float:left;">
                
                <li class="<?php if ($page==0) { ?>active<?php } ?>">
                    <a href="#tab_0" data-toggle="tab" onclick="$('#mypage').val('0')"> <i class="fa fa-clock-o"></i> <?php echo fc_lang('缓存时间'); ?> </a>
                </li>
                <li class="<?php if ($page==6) { ?>active<?php } ?>">
                    <a href="#tab_6" data-toggle="tab" onclick="$('#mypage').val('6')"> <i class="fa fa-get-pocket"></i> <?php echo fc_lang('数据安全'); ?> </a>
                </li>
                <li class="<?php if ($page==7) { ?>active<?php } ?>">
                    <a href="#tab_7" data-toggle="tab" onclick="$('#mypage').val('7')"> <i class="fa fa-rmb"></i> <?php echo fc_lang('交易配置'); ?> </a>
                </li>
            </ul>
        </div>
        <div class="portlet-body">
            <div class="tab-content">

            
                <div class="tab-pane <?php if ($page==0) { ?>active<?php } ?>" id="tab_0">
                    <div class="form-body row">
                        <?php if (is_array($config)) { $count=count($config);foreach ($config as $i=>$t) {  if (strpos($i, 'SYS_CACHE') === 0) { ?>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-5 control-label"><?php echo $t; ?>：</label>
                                <div class="col-md-5">
                                    <label><input class="form-control" type="text" name="data[<?php echo $i; ?>]" value="<?php echo intval($data[$i]); ?>" ></label>
                                </div>
                            </div>
                        </div>
                        <?php }  } } ?>
                    </div>
                    <div class="alert alert-danger"><?php echo fc_lang('缓存时间单位秒，设置为0时关闭缓存，为了网站负载力和性能，建议设置一个合理的缓存时间，不建议设置0'); ?></div>
                </div>
                <div class="tab-pane <?php if ($page==6) { ?>active<?php } ?>" id="tab_6">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-2 control-label"><?php echo fc_lang('安全密钥'); ?>：</label>
                            <div class="col-md-9">
                                <label><input class="form-control" type="text" name="data[SYS_KEY]" id="sys_key" value="<?php if ($data['SYS_KEY']) { ?>***<?php } ?>"  ></label>
                                <label><button class="btn btn-sm blue" type="button" name="button" onclick="dr_to_key()"> <?php echo fc_lang('重新生成'); ?> </button></label>
                                <span class="help-block"><?php echo fc_lang('密钥建议定期更换'); ?></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><?php echo fc_lang('来路字符'); ?>：</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="data[SYS_REFERER]" id="sys_referer" value="<?php echo $data['SYS_REFERER']; ?>"  >
                                <span class="help-block"><?php echo fc_lang('用于移动端或API数据调用的认证字符串'); ?>&nbsp;&nbsp;<a href="<?php echo SYS_HELP_URL; ?>240.html" target="_blank" style="color:blue !important"><?php echo fc_lang('格式参考'); ?></a></span>
                            </div>
                        </div>
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label"><?php echo fc_lang('HTTPS模式'); ?>：</label>
                                <div class="col-md-9">
                                    <input type="checkbox" name="data[SYS_HTTPS]" value="TRUE" <?php if ($data['SYS_HTTPS']) { ?>checked<?php } ?> data-on-text="<?php echo fc_lang('开启'); ?>" data-off-text="<?php echo fc_lang('关闭'); ?>" data-on-color="success" data-off-color="danger" class="make-switch" data-size="small">
                                    <span class="help-block"><?php echo fc_lang('开启之后全系统将采用https地址模式'); ?></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane <?php if ($page==7) { ?>active<?php } ?>" id="tab_7">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-2 control-label"><?php echo fc_lang('兑换比例'); ?>：</label>
                            <div class="col-md-9">
                                <?php echo fc_lang('<label>1 '.SITE_MONEY.' = &nbsp;&nbsp;</label><label>%s</label><label>&nbsp;&nbsp;'.SITE_SCORE.'</label>', '<input class="form-control input-small" type="text" name="data[SITE_CONVERT]" value="'.$data['SITE_CONVERT'].'" />'); ?>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><?php echo fc_lang('购买联系方式'); ?>：</label>
                            <div class="col-md-9">
                                <?php echo fc_lang('<label>%s</label><label>&nbsp;&nbsp;'.SITE_SCORE.'</label>', '<input class="form-control input-small" type="text" name="data[SITE_PHONE_MONEY]" value="'.$data['SITE_PHONE_MONEY'].'" />'); ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">SITE_EXPERIENCE：</label>
                            <div class="col-md-9">
                                <label><input class="form-control" type="text" name="data[SITE_EXPERIENCE]" value="<?php echo $data['SITE_EXPERIENCE']; ?>" ></label>
                                <span class="help-block"><?php echo fc_lang('例如“经验值”，“积分值”等等'); ?></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">SITE_SCORE：</label>
                            <div class="col-md-9">
                                <label><input class="form-control" type="text" name="data[SITE_SCORE]" value="<?php echo $data['SITE_SCORE']; ?>" ></label>
                                <span class="help-block"><?php echo fc_lang('例如“虚拟值”，“F币”，“A币”，“B币”等等'); ?></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">SITE_MONEY：</label>
                            <div class="col-md-9">
                                <label><input class="form-control" type="text" name="data[SITE_MONEY]" value="<?php echo $data['SITE_MONEY']; ?>" ></label>
                                <span class="help-block"><?php echo fc_lang('例如“RMB”，“人民币”，“资金”等等，实际交易为人民币'); ?></span>
                            </div>
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
    </div>
</form>
<script type="text/javascript">
<!--
function memcache_test() {
	$("#memcache").val('Loading');
	$.get("<?php echo dr_url('system/memcache'); ?>&"+Math.random(),function(data){
		alert(data);
		$("#memcache").val('<?php echo fc_lang('测试'); ?>');
	})
}
//-->
</script>
<?php if ($fn_include = $this->_include("nfooter.html")) include($fn_include); ?>