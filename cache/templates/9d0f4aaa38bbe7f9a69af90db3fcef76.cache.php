<?php if ($fn_include = $this->_include("header.html", "/")) include($fn_include); ?>
<link href="skin/css/liststyle.css" rel="stylesheet" type="text/css" media="all" />
<?php if (get_ad_status(1)) {  $poster = dr_poster_list(3, 1);  if (is_array($poster)) { $count=count($poster);foreach ($poster as $i=>$t) { ?>
<div style="background:url(<?php echo $t['file']; ?>) center center no-repeat; height:382px;"></div>
<?php } }  } ?>

<div class="control">
    <div class="content">
        <div class="contentone">
            <img src="skin/images/yewu1.jpg" alt="" />
            <h4>
				<span style="color:#fff;background-color:#F8C303;font-family:微软雅黑;font-size:36px;padding:10px;margin-top:20px">Business partner</span> 
			</h4>
            <h5>
                <p style="font-family:微软雅黑;font-size:18px;text-align:left;line-height:30px">

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Business partner is the upgrading of foreign trade services 3 era service mode, is the standard development of the introduction of various types of third party service enterprises in the industrial chain (such as freight forwarding, customs, taxation, financial institutions, industry experts) has become a close partner.
                </p><br />               
                <p style="font-family:微软雅黑;font-size:18px;text-align:left;line-height:30px">

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Through free collaboration within, with export service needs of customers, provide low cost localization, close and personalized one-stop service process, the integration of various resources, for you to enhance the core competitiveness, expand the scale of market.
                </p>
			</h5>
        </div>
        <div class="contenttwo">
            <img src="skin/images/yewu2.jpg" alt="" />

            <h4>
                <p style="line-height:15px">&nbsp;</p>
				<p style="width:380px;font-family:微软雅黑;font-size:18px;text-align:left;line-height:24px">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For business partners, an image metaphor is the relationship between an aircraft carrier and an aircraft carrier formation. The joint standard is equivalent to the aircraft carrier, playing platform, resources and brand advantages, business partners are equivalent to cruisers, destroyers, nuclear submarines, etc., to undertake market development, customer service work.。
				</p>
                <p style="width:380px;font-family:微软雅黑;font-size:18px;text-align:left;line-height:24px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In the fierce market competition, the standard development and business partners formed a powerful aircraft carrier battle group, established a large depth, multi-level, concentrated defense systems and help you escort, explore and expand.
                </p>
			</h4>
        </div>
        <div class="contentthree">
            <p style="font-family:微软雅黑;font-size:28px;text-align:center;line-height:36px">&nbsp;Contact us</p>
            <h4><img src="skin/images/yewu3.jpg" alt="" />
				<p style="font-family:微软雅黑;font-size:14px;text-align:left;line-height:36px">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A&T INTERNATIONAL Development Co.,Ltd<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address: No. 107, Gutian Road, tower 11, Gulou District, Fujian, Fuzhou<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Telephone：0591-87553670<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fax：0591-83279101<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Website：www.atinin.cn<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email：lbgj@atinin.com
				</p>
			</h4>
        </div>
    </div>
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