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
				<span style="color:#fff;background-color:#F8C303;font-family:微软雅黑;font-size:36px;padding:10px;margin-top:20px">业务拍档</span> 
			</h4>
            <h5>
                <p style="font-family:微软雅黑;font-size:18px;text-align:left;line-height:36px">

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业务拍档是外贸服务<span style="font-size:25px;">3.0时代的服务模式升级</span>，是联标发展引入产业链条上的各类第三方服务企业（如货代、报关行、财税公司、金融机构、行业专家等）成为紧密合作伙伴。
                </p><br />               
                <p style="font-family:微软雅黑;font-size:20px;text-align:left;line-height:36px">

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通过内部的自由协作，为具有出口服务需求的客户，提供<span style="font-size:25px;">本地化、贴身化、个性化</span>的<span style="font-size:25px;">低成本</span>一站式流程服务，<span style="font-size:25px;">整合各种资源</span>，为您提升核心竞争力，扩大市场规模。
                </p>
			</h5>
        </div>
        <div class="contenttwo">
            <img src="skin/images/yewu2.jpg" alt="" />

            <h4>
                <p style="line-height:36px">&nbsp;</p>
				<p style="width:380px;font-family:微软雅黑;font-size:18px;text-align:left;line-height:36px">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对于业务拍档来说，一个形象的比喻是“航空母舰”和“航母编队”的关系。联标发展相当于航母，发挥平台、资源和品牌优势，业务拍档则相当于巡洋舰、驱逐舰、核潜艇等，承接市场开拓、客户服务的工作。
				</p>
                <p style="width:380px;font-family:微软雅黑;font-size:18px;text-align:left;line-height:36px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在激烈的市场竞争中，联标发展和业务拍档组成强大的航母战斗群，建立了<span style="font-size:25px;">大纵深、多层次、火力集中</span>的攻防体系，助您保驾护航、开疆拓土。
                </p>
			</h4>
        </div>
        <div class="contentthree">
            <p style="font-family:微软雅黑;font-size:28px;text-align:center;line-height:36px">&nbsp;联系我们</p>
            <h4><img src="skin/images/yewu3.jpg" alt="" />
				<p style="font-family:微软雅黑;font-size:14px;text-align:left;line-height:36px">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;福建省联标国际发展有限公司<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：福建省福州市鼓楼区古田路107号中美大厦11层<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：0591-87553670<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;传真：0591-83279101<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;网址：www.atinin.cn<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱：lbgj@atinin.com
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
	url:"http://demo.hf872.com/index.php?c=cron",  
	dataType: "jsonp",
	success: function(json){ },  
	error: function(){ }  
});  
</script>