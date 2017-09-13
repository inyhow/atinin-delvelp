<?php if ($fn_include = $this->_include("header.html")) include($fn_include); ?>
<link href="skin/css/style.css" rel="stylesheet" type="text/css" />
<div class="gb_banner">
    <!-- 代码 开始 -->
    <div id="full-screen-slider">
        <ul id="slides">
            <?php if (get_ad_status(1)) {  $poster = dr_poster_list(1, 2);  if (is_array($poster)) { $count=count($poster);foreach ($poster as $i=>$t) { ?>
            <li style="background:url('<?php echo $t['file']; ?>') no-repeat center top"><a href="<?php echo $t['url']; ?>"><?php echo $t['title']; ?></a></li>
            <?php } }  } ?>
        </ul>
    </div>
    <!-- 代码 结束 -->
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