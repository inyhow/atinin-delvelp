<?php if ($fn_include = $this->_include("nheader.html")) include($fn_include); ?>
<link type="text/css" rel="stylesheet" href="<?php echo THEME_PATH; ?>admin/order/admin.css" />
<script type="text/javascript">
    // 退款
    function dr_order_tuikuan(id) {
        var url = "<?php echo dr_url('order/operate/tuikuan'); ?>&id="+id;
        art.dialog.open(url, { title: '<?php echo lang("code-08"); ?>',
            ok: function () {
                var iframe = this.iframe.contentWindow;
                if (!iframe.document.body) {
                    alert('iframe loading')
                    return false;
                };
                var data = iframe.$("#myform2").serialize();
                $.ajax({type: "POST", url:url+'&submit=1', data: data, dataType:'json', success: function (data) {
                    if (data.code == 1) {
                        dr_tips("<?php echo fc_lang('操作成功，正在刷新...'); ?>", 3, 1);
                        setTimeout('window.location.reload(true)', 3000); // 刷新页
                    } else {
                        dr_tips(data.msg);
                    }
                }});
                return true;
            },
            cancel: true
        });
        return;
    }
    // 关闭订单
    function dr_order_close(id) {
        var url = "<?php echo dr_url('order/operate/close'); ?>&id="+id;
        art.dialog.open(url, { title: '<?php echo lang("mod-088"); ?>',
            ok: function () {
                var iframe = this.iframe.contentWindow;
                if (!iframe.document.body) {
                    alert('iframe loading')
                    return false;
                };
                var data = iframe.$("#myform2").serialize();
                $.ajax({type: "POST", url:url+'&submit=1', data: data, dataType:'json', success: function (data) {
                    if (data.code == 1) {
                        dr_tips("<?php echo fc_lang('操作成功，正在刷新...'); ?>", 3, 1);
                        setTimeout('window.location.reload(true)', 3000); // 刷新页
                    } else {
                        dr_tips(data.msg);
                    }
                }});
                return true;
            },
            cancel: true
        });
        return;
    }
    // 修改价格
    function dr_order_price(id) {
        var url = "<?php echo dr_url('order/operate/price'); ?>&id="+id;
        art.dialog.open(url, { title: '<?php echo lang("mod-090"); ?>',
            ok: function () {
                var iframe = this.iframe.contentWindow;
                if (!iframe.document.body) {
                    alert('iframe loading')
                    return false;
                };
                var data = iframe.$("#myform2").serialize();
                $.ajax({type: "POST", url:url+'&submit=1', data: data, dataType:'json', success: function (data) {
                    if (data.code == 1) {
                        dr_tips("<?php echo fc_lang('操作成功，正在刷新...'); ?>", 3, 1);
                        setTimeout('window.location.reload(true)', 3000); // 刷新页
                    } else {
                        dr_tips(data.msg);
                    }
                }});
                return true;
            },
            cancel: true
        });
        return;
    }
    // 物流发货
    function dr_order_shipping(id) {
        var url = "<?php echo dr_url('order/operate/shipping'); ?>&id="+id;
        art.dialog.open(url, { title: '<?php echo lang("mod-092"); ?>',
            ok: function () {
                var iframe = this.iframe.contentWindow;
                if (!iframe.document.body) {
                    alert('iframe loading')
                    return false;
                };
                var data = iframe.$("#myform2").serialize();
                $.ajax({type: "POST", url:url+'&submit=1', data: data, dataType:'json', success: function (data) {
                    if (data.code == 1) {
                        dr_tips("<?php echo fc_lang('操作成功，正在刷新...'); ?>", 3, 1);
                        setTimeout('window.location.reload(true)', 3000); // 刷新页
                    } else {
                        dr_tips(data.msg);
                    }
                }});
                return true;
            },
            cancel: true
        });
        return;
    }
    // 确认收货
    function dr_order_shouhuo(id) {
        art.dialog.confirm('<b><font color="red"><?php echo lang("mod-120"); ?></font></b>', function(){
            $.ajax({type: "POST",dataType:"json", url: "<?php echo dr_url('order/operate/shouhuo'); ?>&id="+id,
                success: function(data) {
                    //验证成功
                    if (data.code == 1) {
                        $.dialog.tips("<?php echo fc_lang('操作成功，正在刷新...'); ?>", 3, 1);
                        setTimeout('window.location.reload(true)', 3000); // 刷新页
                    } else {
                        dr_tips(data.msg, 3, 2);
                        return true;
                    }
                },
                error: function(HttpRequest, ajaxOptions, thrownError) {

                }
            });
            return true;
        });
    }
    // 确认到账
    function dr_order_daozhang(id) {
        art.dialog.confirm('<b><font color="red"><?php echo lang("mod-121"); ?></font></b>', function(){
            $.ajax({type: "POST",dataType:"json", url: "<?php echo dr_url('order/operate/daozhang'); ?>&id="+id,
                success: function(data) {
                    //验证成功
                    if (data.code == 1) {
                        $.dialog.tips("<?php echo fc_lang('操作成功，正在刷新...'); ?>", 3, 1);
                        setTimeout('window.location.reload(true)', 3000); // 刷新页
                    } else {
                        dr_tips(data.msg, 3, 2);
                        return true;
                    }
                },
                error: function(HttpRequest, ajaxOptions, thrownError) {

                }
            });
            return true;
        });
    }
    // 备注
    function dr_save_note(id) {
        $.ajax({type: "POST",dataType:"json", data:{note:$('#sell_note').val()}, url: "<?php echo dr_url('order/operate/save_note'); ?>&id="+id,
            success: function(data) {
                //验证成功
                if (data.code == 1) {
                    $('#sell_note').val(data.msg);
                    $('#sell_note_ok').html('<img src="<?php echo THEME_PATH; ?>admin/images/1.gif">');
                    setTimeout("$('#sell_note_ok').html('')", 3000);
                } else {
                    dr_tips(data.msg, 3, 2);
                    return true;
                }
            },
            error: function(HttpRequest, ajaxOptions, thrownError) {

            }
        });
    }
    // 返回
    function dr_order_back() {
        var url = '';
        parent.$(".subnav-menu > li").each(function(){
            if ($(this).attr('class') == 'dropdown') {
                var aa = $(this).html();
                if (aa.match(/m=([a-z]+)\'/) != null) {
                    url = "<?php echo $back; ?>"+aa.match(/m=([a-z]+)\'/)[1];
                    window.location.href = url;
                    return;
                }
            }
        });
        if (url == '') {
            window.location.href = "<?php echo $back; ?>index";
        }
    }
</script>