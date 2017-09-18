<?php if ($fn_include = $this->_include("nheader.html")) include($fn_include); ?>
<script type="text/javascript">
$(function() {
	$.getScript("http://www.dayrui.com/index.php?c=sys&m=app_update&data=<?php echo $store; ?>&admin=<?php echo SELF; ?>");
}); 
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
	<small><?php echo fc_lang('应用是系统的扩展部分，可以在“应用商店”下载评论、心情、短信、短消息等等'); ?></small>
</h3>

<div class="portlet light bordered">
	<div class="portlet-body">
		<div class="table-scrollable v3table">
		<table class="table">
		<thead>
		<tr>
			<th width="40" align="center"><?php echo fc_lang('可用'); ?></th>
			<th width="200" align="left"><?php echo fc_lang('名称'); ?></th>
			<th width="120" align="left"><?php echo fc_lang('目录'); ?></th>
			<th width="80" align="left"><?php echo fc_lang('版本'); ?></th>
			<th width="180" align="left"><?php echo fc_lang('开发者'); ?></th>
			<th align="left" class="dr_option"><?php echo fc_lang('操作'); ?></th>
		</tr>
		</thead>
		<tbody>
		<?php if (is_array($list[1])) { $count=count($list[1]);foreach ($list[1] as $dir=>$t) { ?>
		<tr>
			<td align="center"><?php if ($this->ci->is_auth('application/config')) { ?><a href="javascript:;" onClick="return dr_dialog_set('<?php echo $t['disabled'] ? fc_lang('<font color=blue><b>你确定要启用它？启用后将正常使用</b></font>') : fc_lang('<font color=red><b>你确定要禁用它？禁用后将无法使用</b></font>'); ?>','<?php echo dr_url('application/disabled',array('id'=>$t['id'])); ?>');"><img src="<?php echo THEME_PATH; ?>admin/images/<?php echo $t['disabled'] ? 0 : 1 ?>.gif"></a><?php } else { ?><img src="<?php echo THEME_PATH; ?>admin/images/<?php echo $t['disabled'] ? 0 : 1 ?>.gif"></a><?php } ?></td>
			<td align="left"><?php echo $t['name']; ?></td>
			<td align="left"><?php echo $dir; ?></td>
            <td align="left"><?php echo $t['version']; ?></td>
			<td align="left"><?php echo $t['author']; ?></a></td>
			<td align="left" class="dr_option">
			<?php if ($this->ci->is_auth('application/config')) { ?><a class="alist" href="<?php echo dr_url($dir.'/home/index'); ?>"> <i class="fa fa-cog"></i> <?php echo fc_lang('配置'); ?></a><?php }  if ($this->ci->is_auth('application/uninstall')) { ?><a class="adel" href="javascript:;" onClick="return dr_confirm_url('<?php echo fc_lang('您确定要这样操作吗？'); ?>','<?php echo dr_url($dir.'/home/uninstall'); ?>');"> <i class="fa fa-trash"></i> <?php echo fc_lang('卸载'); ?></a><?php }  if ($this->ci->is_auth('application/update')) { ?><a class="ago dr_update_<?php echo $t['key']; ?>" style="color:#090;display:none;" href="<?php echo dr_url('application/update',array('id'=>$dir)); ?>"> <i class="fa fa-refresh"></i> <?php echo fc_lang('在线升级'); ?></a><?php }  if ($t['key']) { ?><span class="dr_check_<?php echo $t['key']; ?>">...</span><?php } ?>
			</td>
		</tr>
		<?php } }  if (is_array($list[0])) { $count=count($list[0]);foreach ($list[0] as $dir=>$t) { ?>
		<tr class="dr_none">
			<td align="center">
				<?php if ($this->ci->is_auth('application/install')) { ?>
				<a href="javascript:void(0);" onclick="dr_install('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FineCMS官方设计室无法全面监控由第三方上传至商店里的应用、模块（以下简称应用程序），因此不保证应用程序的合法性、安全性、完整性、真实性或品质等。您从商店下载应用程序时，同意自行判断并承担所有风险，而不依赖于FineCMS官方设计室。<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在任何情况下，FineCMS官方设计室有权依法停止商店服务并采取相应行动，包括但不限于对于相关应用程序进行卸载、暂停服务的全部或部分、保存有关记录并向有关机关报告。由此对您及第三人可能造成的损失，FineCMS官方设计室不承担任何直接、间接或者连带的责任。', '<?php echo dr_url($dir.'/home/install'); ?>')" style="color:#00F">
				<?php } else { ?>
				<a href="javascript:;" style="color:#999">
				<?php }  echo fc_lang('安装'); ?></a>
			</td>
			<td align="left"><?php echo $t['name']; ?></td>
			<td align="left"><?php echo $dir; ?></td>
            <td align="left"><?php echo $t['version']; ?></td>
			<td align="left"><?php echo $t['author']; ?></td>
			<td align="left" class="dr_option">
            <?php if ($admin['adminid'] == 1) { ?><a href="javascript:;" class="adel" onClick="return dr_confirm_url('<font color=red><b><?php echo fc_lang('该操作将会从磁盘中彻底删除它且数据不可恢复，您确定吗？'); ?></b></font>','<?php echo dr_url('application/delete',array('dir'=>$dir)); ?>');"> <i class="fa fa-close"></i> <?php echo fc_lang('删除'); ?></a><?php } ?>
			</td>
		</tr>
		<?php } } ?>
		</tbody>
		</table>
		</div>
	</div>
</div>
<?php if ($fn_include = $this->_include("nfooter.html")) include($fn_include); ?>