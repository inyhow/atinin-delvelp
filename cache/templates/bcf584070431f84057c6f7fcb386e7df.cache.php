<?php if ($fn_include = $this->_include("order_header.html")) include($fn_include); ?>
<script type="text/javascript">
	$(function() {
		$(".table-list tr").last().removeClass("dr_border_none");
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

<div class="mytopsearch">
	<form method="post" class="row" action="" name="searchform" id="searchform">
		<input name="search" id="search" type="hidden" value="1" />
		<div class="col-md-12">
			<label><?php echo lang('mod-133'); ?></label>
			<label style="padding-right: 5px;"><i class="fa"></i></label>
			<label style="padding-right: 10px;">
				<select name="data[mid]" class="form-control">
					<?php if (is_array($module)) { $count=count($module);foreach ($module as $t) { ?>
					<option value="<?php echo $t['dirname']; ?>" <?php if ($param['mid']==$t['dirname']) { ?>selected<?php } ?>><?php echo $t['name']; ?></option>
					<?php } } ?>
				</select>
			</label>
			<label>
				<select name="data[field]" class="form-control">
					<?php if (is_array($field)) { $count=count($field);foreach ($field as $key=>$t) {  if ($key!=sell_username && $key!=shipping_name && $key!=shipping_phone && $key!=id) { ?>
					<option value="<?php echo $t['fieldname']; ?>" <?php if ($param['field']==$t['fieldname']) { ?>selected<?php } ?>><?php echo $t['name']; ?></option>
					<?php }  } } ?>
				</select>
			</label>
			<label><i class="fa fa-caret-right"></i></label>
			<label style="padding-right: 20px;"><input type="text" class="form-control" placeholder="<?php echo fc_lang(''); ?>" value="<?php echo $param['keyword']; ?>" name="data[keyword]" /></label>
			<label><?php echo lang('mod-006'); ?> ：</label>
			<label><?php echo dr_field_input('start', 'Date', array('option'=>array('format'=>'Y-m-d','width'=>'100')), (int)$param['start']); ?></label>
			<label><i class="fa fa-minus"></i></label>
			<label style="margin-right:10px"><?php echo dr_field_input('end', 'Date', array('option'=>array('format'=>'Y-m-d','width'=>'100')), (int)$param['end']); ?></label>
			<label><button type="submit" class="btn green btn-sm" name="submit" > <i class="fa fa-search"></i> <?php echo fc_lang('搜索'); ?></button></label>
		</div>
	</form>
</div>

<div class="row myrow">

	<?php if (is_array($list)) { $count=count($list);foreach ($list as $t) { ?>
	<div class="portlet box green" style="border:1px solid #8bb4e7">
		<div class="portlet-title" style="background-color:#8bb4e7; ">
			<div class="tools" style="float: left">
				<label><i class="fa fa-calendar"></i> <?php echo dr_date($t['order_time'], '', ''); ?></label>
				&nbsp;&nbsp;
				<label><i class="fa fa-shopping-cart"></i> <?php echo lang('mod-000'); ?>：<a style="color: #fff" href="<?php echo dr_url('order/home/info', array('id'=>$t['id'])); ?>"><?php echo $t['sn']; ?></a></label>
				&nbsp;&nbsp;
				
			</div>
			<div class="tools">
				<?php echo dr_order_status($t); ?>
				<a href="javascript:;" class="collapse" data-original-title="开启/隐藏"> </a>
			</div>
		</div>
		<div class="portlet-body dr_order">
			<div class="row">
				<div class="col-md-6">
					<?php if (is_array($t['goods'])) { $count=count($t['goods']);foreach ($t['goods'] as $ii=>$g) { ?>
					<div class="media">
						<a class="pull-left" href="javascript:;">
							<img src="<?php echo dr_thumb($g['thumb'], 55, 55); ?>" width="55" height="55">
						</a>
						<div class="media-body">
							<h5 class="media-heading"><a href="<?php echo $g['url']; ?>" target="_blank"><?php echo $g['title']; ?></a></h5>
							<?php $sku=dr_string2array($g['sku']); if (is_array($sku)) { $count=count($sku);foreach ($sku as $s=>$u) { ?>
							<lable><?php echo $s; ?>：<?php echo $u; ?>&nbsp;&nbsp;</lable>
							<?php } } ?>
							<p>x<?php echo $g['quantity']; ?></p>
						</div>
					</div>
					<?php } } ?>
				</div>
				<div class="col-md-2 order_p">
					<p><a href="javascript:;" onclick="dr_dialog_member('<?php echo $t['buy_uid']; ?>')"><?php echo $t['buy_username']; ?></a></p>
				</div>
				<div class="col-md-2 order_p">
					<p><strong><?php if ($t['order_score']) {  echo intval($t['order_price']);  echo SITE_SCORE;  } else { ?>¥<?php echo number_format($t['order_price'], 2);  } ?></strong></p>
					<?php if ($t['pay_type'] == 3) { ?>
					<p><a href="<?php echo dr_url('order/transfer/info',array('id' => $t['id'])); ?>"><?php echo $paytype[$t['pay_type']]['name']; ?></a></p>
					<?php } else { ?>
					<p><?php if ($paytype[$t['pay_type']]) {  echo $paytype[$t['pay_type']]['name'];  } else { ?>未知<?php } ?></p>
					<?php } ?>
				</div>
				<div class="col-md-2 order_p">
					<?php echo dr_order_member_option($t['sell_uid'], $t); ?>

					<p><a href="<?php echo dr_url('order/home/info', array('id'=>$t['id'])); ?>" class="btn blue btn-xs"> <i class="fa fa-shopping-cart"></i> <?php echo lang('mod-057'); ?></a></p>
				</div>
			</div>
		</div>
	</div>
	<?php } } ?>

	<div id="pages"><a><?php echo fc_lang('共%s条', $param['total']); ?></a><?php echo $pages; ?></div>

</div>


<?php if ($fn_include = $this->_include("nfooter.html")) include($fn_include); ?>