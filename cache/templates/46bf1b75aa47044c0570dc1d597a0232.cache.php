<div class="gb_top">
    <div class="gb_topn">
        <div class="gb_topn_l"><img src="<?php echo HOME_THEME_PATH; ?>logo.png" height="70" /></div>
        <div class="gb_topn_r">
            <div class="gb_yuyan">
                <table width="100%" height="31" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="51%">
                            <script language="JavaScript" type="text/javascript">
                                function search_OnSubmit() {
                                    var KeyWord = get("KeyWord").value.Trim();
                                    if (KeyWord.length < 1) {
                                        alert("请输入关键字");
                                        return false;
                                    }
                                }
                            </script>
                            <form style="margin:0px;padding:0px;" method="get" target="_blank" action="<?php echo SITE_URL; ?>index.php">
                                <input name="c" type="hidden" value="so">
                                <input name="module" type="hidden" value="<?php if (defined('MOD_DIR')) {  echo MOD_DIR;  } ?>">
                                <table width="100%" height="31" border="0" cellspacing="0" cellpadding="0" class="test">
                                    <tr>
                                        <td width="20%" align="right" valign="middle"> 
                                            <img src="skin/images/gb_search_tou.jpg" width="10" height="31" />
                                        </td>
                                        <td width="40%">
                                            <input class="gb_search" name="keyword" id="KeyWord" type="text" value="Search" onfocus="if (this.value=='Search') this.value='';" />
                                        </td>
                                        <td width="50%" align="left" valign="middle">
                                            <input type="image" style="cursor: pointer;" src="skin/images/gb_search_niu.jpg" />
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </td>
                        <td width="30%" align="left" valign="middle" style="min-width:300px;"><?php if ($fn_include = $this->_include("language.html", "/")) include($fn_include); ?></td>
                     </tr>
                </table>
            </div>
            <div id="navigation">
                <div id="smoothmenu1" class="ddsmoothmenu gb_dh">
                    <ul>
                        <li> <a href="<?php echo SITE_URL; ?>" title="<?php echo SITE_TITLE; ?>">Home</a> </li>
                        <?php $return = $this->list_tag("action=navigator type=0 pid=0 num=6"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                        <li> <a title="<?php echo $t['name']; ?>" href="<?php echo $t['url']; ?>" target="_parent"><?php echo $t['name']; ?></a>
                            <ul>
                                <?php if ($t['child']) {  $return_t2 = $this->list_tag("action=navigator pid=$t[id]  return=t2"); if ($return_t2) extract($return_t2); $count_t2=count($return_t2); if (is_array($return_t2)) { foreach ($return_t2 as $key_t2=>$t2) { ?>
                                <li> <a title="<?php echo $t2['name']; ?>" href="<?php echo $t2['url']; ?>" onfocus="this.blur()" style="width:150px;"> <?php echo $t2['name']; ?></a>
                                    <ul>
                                        <?php if ($t2['child']) {  $return_t3 = $this->list_tag("action=navigator pid=$t2[id]  return=t3"); if ($return_t3) extract($return_t3); $count_t3=count($return_t3); if (is_array($return_t3)) { foreach ($return_t3 as $key_t3=>$t3) { ?>
                                        <li><a title="<?php echo $t3['name']; ?>" href="<?php echo $t3['url']; ?>" onfocus="this.blur()"> <?php echo $t3['name']; ?></a> </li>
                                        <?php } }  } ?>
                                    </ul>
                                </li>
                                <?php } }  } ?>
                            </ul>
                        </li>
                        <?php } } ?>
                        <!--<script type="text/javascript" src="js/jquery.min.js"></script>-->
                        <script type="text/javascript" src="skin/js/ddsmoothmenu.js"></script>
                        <script type="text/javascript">
                            ddsmoothmenu.init({
                                mainmenuid: "smoothmenu1", //menu DIV id
                                orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
                                classname: 'ddsmoothmenu', //class added to menu's outer DIV
                                //customtheme: ["#1c5a80", "#18374a"],
                                contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
                            })
                        </script>
                    </ul>
                </div>
            </div>
        </div>
        <div style=" clear:both;"></div>
    </div>
</div>