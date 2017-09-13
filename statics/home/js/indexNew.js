$(function(){
  //预约顾问；
  appointment();
  //广告关闭
  adClose();  

  navHeightLight();
	

  $("#iiTax_type li").each(function(){
    $(this).click(function(){
      var data = $(this).data("name");
        location.href = "/index.php?c=taxtool&m="+data;
      })
    });
    $(".reset").click(function(e){
        e.preventDefault();
        $(".num").val("")
    })
  })

	
//预约顾问；
  var appointment = function(){
      var contact = $(".contact "),
      post_demands = $(".container .post_demands img");
      
      contact.find(".close").on('click',function(){
          toggleContact()  ;
      });
      post_demands.on('click',function(){
          toggleContact()  ;
      });

      var toggleContact = function(){
          contact.toggle();
          post_demands.toggle();
      };
  };

  //广告关闭
  function adClose(){
  
    $(".ad .close").on('click', function(event) {
        var $ad = $(this).parent(".ad");
            $ad.hide();
        var cookieValue = $ad.attr("data");
        setCookie(cookieValue,"close");
    });

    var $topAd = $(".topAd"),
        $leftAd = $(".leftAd"),
        $rightAd = $(".rightAd");
    var adTopState = getCookie("top");
    var adLeftState = getCookie("left");
    var adRightState = getCookie("right");

    if(adTopState){$topAd.hide();}
    if(adLeftState){$leftAd.hide();}
    if(adRightState){$rightAd.hide();}

  }
  /*设置广告cookie*/
  function setCookie(name,value,hours){
    var exp = new Date();
    exp.setTime(exp.getTime() + hours*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
    console.log()
  }
  /*获取广告cookie*/
  function getCookie(name){
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
    return unescape(arr[2]);
    else
    return null;
  }

  /*导航栏高亮*/
  var navHeightLight = function(){
      var href = location.href,
          reg = /(\w+\.com\/){1}/;
      var navIndex = href.split(reg)[2];
      
      var tabArray = ["first","publish&publish_job","taxtool","video","account","answer-list-nzgs","shop","news"]
      var tabIndex ;
          getIndex();
      function getIndex(){
          if(!navIndex){tabIndex = 0;return;}
          $.each(tabArray,function(index){
              var t = searchArray(tabArray[index],"&");

              if(t != -1){
                tabIndex = index; return false; 
              }
          });

          function searchArray(i,selector){
              var a = i.split(selector);
              var t;
              for(var j=0;j<a.length;j++){
                  
                  if(navIndex)t = navIndex.indexOf(a[j]);
                  if(t != -1){
                    return t; 
                  }
              }
              return t;
          }
      };
       
      
      $(".head .g-header-nav a").eq(tabIndex).addClass("on");
  }
  
	
