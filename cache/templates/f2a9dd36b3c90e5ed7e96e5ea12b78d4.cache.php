<?php if ($fn_include = $this->_include("nheader.html")) include($fn_include); ?>
<script type="text/javascript">

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
	<small> </small>
</h3>

<?php if ($share || $page) { ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-green"><i class="fa fa-file-o"></i> <?php echo fc_lang('共享模块'); ?></span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="row">
			<?php if ($share) { ?>
			<form action="index.php?c=category&m=html" method="post">
			<input type="hidden" name="type" value="html" id="category_share">
			<div class="col-sm-4">
				<p class="text-center"><?php echo $share; ?></p>
				<p class="text-center">
					<button type="submit" onclick="$('#category_share').val('html')" class="btn green noloading"><i class="fa fa-refresh"></i> <?php echo fc_lang('生成共享栏目'); ?> </button>
					<button type="submit" onclick="$('#category_share').val('clear')" class="btn red noloading"><i class="fa fa-trash"></i> <?php echo fc_lang('删除静态文件'); ?> </button>
				</p>
			</div>
			</form>
			<form action="index.php?c=show&m=html" method="post">
				<input type="hidden" name="type" value="html" id="show_share">
			<div class="col-sm-4">
				<p class="text-center"><?php echo $share; ?></p>
				<p class="text-center">
					<button type="submit" onclick="$('#show_share').val('html')" class="btn green noloading"><i class="fa fa-refresh"></i> <?php echo fc_lang('生成共享内容'); ?> </button>
					<button type="submit" onclick="$('#show_share').val('clear')" class="btn red noloading"><i class="fa fa-trash"></i> <?php echo fc_lang('删除静态文件'); ?> </button>
				</p>
			</div>
			</form>
			<?php }  if ($page) { ?>
			<div class="col-sm-4">
				<p class="text-center"><?php echo $page; ?></p>
				<p class="text-center">
					<button type="button" class="btn green noloading"><i class="fa fa-refresh"></i> <?php echo fc_lang('生成网站单页'); ?> </button>
					<button type="button" class="btn red noloading"><i class="fa fa-trash"></i> <?php echo fc_lang('删除静态文件'); ?> </button>
				</p>
			</div>
			<?php } ?>
		</div>
	</div>
</div>
<?php }  if (is_array($module)) { $count=count($module);foreach ($module as $t) { ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-green"><i class="fa <?php echo $t['icon']; ?>"></i> <?php echo fc_lang($t['name']); ?></span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="row">
			<?php if (!$t['share']) { ?>
			<form action="index.php?s=<?php echo $t['dirname']; ?>&c=category&m=html" method="post">
			<input type="hidden" name="type" value="html" id="category_<?php echo $t['dirname']; ?>">
			<div class="col-sm-4">
				<p class="text-center"><?php echo $t['select']; ?></p>
				<p class="text-center">
					<button type="submit" onclick="$('#category_<?php echo $t['dirname']; ?>').val('html')" class="btn green noloading"><i class="fa fa-refresh"></i> <?php echo fc_lang('生成模块栏目'); ?> </button>
					<button type="submit" onclick="$('#category_<?php echo $t['dirname']; ?>').val('clear')" class="btn red noloading"><i class="fa fa-trash"></i> <?php echo fc_lang('删除静态文件'); ?> </button>
				</p>
			</div>
			</form>
			<?php } ?>
			<form action="index.php?s=<?php echo $t['dirname']; ?>&c=show&m=html" method="post">
			<input type="hidden" name="type" value="html" id="show_<?php echo $t['dirname']; ?>">
			<div class="col-sm-4">
				<p class="text-center"><?php echo $t['select']; ?></p>
				<p class="text-center">
					<button type="submit" onclick="$('#show_<?php echo $t['dirname']; ?>').val('html')" class="btn green noloading"><i class="fa fa-refresh"></i> <?php echo fc_lang('生成模块内容'); ?> </button>
					<button type="submit" onclick="$('#show_<?php echo $t['dirname']; ?>').val('clear')" class="btn red noloading"><i class="fa fa-trash"></i> <?php echo fc_lang('删除静态文件'); ?> </button>
				</p>
			</div>
			</form>
			<?php if ($page_select) { ?>
			<div class="col-sm-4">
				<p class="text-center"><?php echo $t['page_select']; ?></p>
				<p class="text-center">
					<button type="button" class="btn green noloading"><i class="fa fa-refresh"></i> <?php echo fc_lang('生成模块单页'); ?> </button>
					<button type="button" class="btn red noloading"><i class="fa fa-trash"></i> <?php echo fc_lang('删除静态文件'); ?> </button>
				</p>
			</div>
			<?php } ?>
		</div>
	</div>
</div>
<?php } }  if ($fn_include = $this->_include("nfooter.html")) include($fn_include); ?>