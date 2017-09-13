<?php if ($fn_include = $this->_include("header.html", "/")) include($fn_include); ?>
<link href="skin/css/pubstyle.css" rel="stylesheet" type="text/css" media="all" />
<?php if (get_ad_status(1)) {  $poster = dr_poster_list(3, 1);  if (is_array($poster)) { $count=count($poster);foreach ($poster as $i=>$t) { ?>
<div style="background:url(<?php echo $t['file']; ?>) center center no-repeat; height:382px;"></div>
<?php } }  } ?>
<div class="control">
    <div class="content">
        <div class="contentone">
            <?php $return = $this->list_tag("action=sql sql='select * from  @#1_page where id=4'"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
            <a href="<?php echo $t['url']; ?>"><img src="<?php echo dr_thumb($t['thumb']); ?>" alt="" /></a>
            <h4>
				<span style="font-family:微软雅黑;font-size:18px;text-align:left;">| <a href="<?php echo $t['url']; ?>"><?php echo $t['name']; ?></a></span> 
			</h4>
            <h5>
                <p style="font-family:微软雅黑;font-size:14x;text-align:left;line-height:20px">
                <?php echo dr_strcut(dr_clearhtml($t['description']),150); ?>
                </p>
			</h5>
            <?php } }  echo $error; ?>            
        </div>
        <div class="contenttwo">
            <?php $return = $this->list_tag("action=sql sql='select * from  @#1_page where id=5'"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
            <a href="<?php echo $t['url']; ?>"><img src="<?php echo dr_thumb($t['thumb']); ?>" alt="" /></a>
            <h4>
				<span style="font-family:微软雅黑;font-size:18px;text-align:left;">| <a href="<?php echo $t['url']; ?>"><?php echo $t['name']; ?></a></span> 
			</h4>
            <h5>
                <p style="font-family:微软雅黑;font-size:14x;text-align:left;line-height:20px">
                <?php echo dr_strcut(dr_clearhtml($t['description']),150); ?>
                </p>
			</h5>
            <?php } }  echo $error; ?>  
        </div>
        <div class="contentone">
            <?php $return = $this->list_tag("action=sql sql='select * from  @#1_page where id=6'"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
            <a href="<?php echo $t['url']; ?>"><img src="<?php echo dr_thumb($t['thumb']); ?>" alt="" /></a>
            <h4>
				<span style="font-family:微软雅黑;font-size:18px;text-align:left;">| <a href="<?php echo $t['url']; ?>"><?php echo $t['name']; ?></a></span> 
			</h4>
            <h5>
                <p style="font-family:微软雅黑;font-size:14x;text-align:left;line-height:20px">
                <?php echo dr_strcut(dr_clearhtml($t['description']),150); ?>
                </p>
			</h5>
            <?php } }  echo $error; ?>  
        </div>
        <div class="contenttwo">
            <?php $return = $this->list_tag("action=sql sql='select * from  @#1_page where id=7'"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
            <a href="<?php echo $t['url']; ?>"><img src="<?php echo dr_thumb($t['thumb']); ?>" alt="" /></a>
            <h4>
				<span style="font-family:微软雅黑;font-size:18px;text-align:left;">| <a href="<?php echo $t['url']; ?>"><?php echo $t['name']; ?></a></span> 
			</h4>
            <h5>
                <p style="font-family:微软雅黑;font-size:14x;text-align:left;line-height:20px">
                <?php echo dr_strcut(dr_clearhtml($t['description']),150); ?>
                </p>
			</h5>
            <?php } }  echo $error; ?>  
        </div>
        <div class="contentone">
            <?php $return = $this->list_tag("action=sql sql='select * from  @#1_page where id=8'"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
            <a href="<?php echo $t['url']; ?>"><img src="<?php echo dr_thumb($t['thumb']); ?>" alt="" /></a>
            <h4>
				<span style="font-family:微软雅黑;font-size:18px;text-align:left;">| <a href="<?php echo $t['url']; ?>"><?php echo $t['name']; ?></a></span> 
			</h4>
            <h5>
                <p style="font-family:微软雅黑;font-size:14x;text-align:left;line-height:20px">
                <?php echo dr_strcut(dr_clearhtml($t['description']),150); ?>
                </p>
			</h5>
            <?php } }  echo $error; ?>  
        </div>
        <div class="contenttwo">
            <?php $return = $this->list_tag("action=sql sql='select * from  @#1_page where id=9'"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
            <a href="<?php echo $t['url']; ?>"><img src="<?php echo dr_thumb($t['thumb']); ?>" alt="" /></a>
            <h4>
				<span style="font-family:微软雅黑;font-size:18px;text-align:left;">| <a href="<?php echo $t['url']; ?>"><?php echo $t['name']; ?></a></span> 
			</h4>
            <h5>
                <p style="font-family:微软雅黑;font-size:14x;text-align:left;line-height:20px">
                <?php echo dr_strcut(dr_clearhtml($t['description']),150); ?>
                </p>
			</h5>
            <?php } }  echo $error; ?>  
        </div>
    </div>
</div>
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