<script type="text/javascript">
$(function() { //防止回车提交表单
    document.onkeydown = function(e){
        var ev = document.all ? window.event : e;
        if (ev.keyCode==13) $("#mark").val("1"); // 标识不能提交表单
    }
    $(".table_form th").last().css('border','none');
    $(".table_form td").last().css('border','none');
    <?php if (get_cookie('finecms-admin-login')) { ?>
    $("#dr_password").focus();
    <?php } else { ?>
    $("#dr_username").focus();
    <?php } ?>
});
function dr_form_check() {
    if ($("#dr_username").val() == '') {
        dr_tips( '<?php echo dr_lang("账号不能为空"); ?>');
        $("#username").focus();
        return false;
    }
    if ($("#mark").val() == 0) {
        return true;
    } else {
        return false;
    }
}
</script>
<div class="table-list" style="width:320px;">
<form action="" method="post" id="myform" name="myform" onsubmit="return dr_form_check()">
    <input name="mark" id="mark" type="hidden" value="0">
<table width="100%" class="table_form">
    <tr>
        <th width="90"><font color="red">*</font>&nbsp;<?php echo fc_lang('账号'); ?>： </th>
        <td><input class="input-text" value="<?php echo get_cookie('finecms-admin-login'); ?>" id="dr_username" type="text" name="data[username]" size="20" /></td>
    </tr>
    <tr class="dr_border_none">
    <th><font color="red">*</font>&nbsp;<?php echo fc_lang('密码'); ?>： </th>
    <td><input class="input-text" id="dr_password" type="password" name="data[password]" size="20" /></td>
    </tr>
</tbody>
</table>
</form>
</div>