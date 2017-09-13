<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.7.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */
	
class Poster_model extends CI_Model {

	/**
	 * 广告模型类
	 */
    public function __construct() {
        parent::__construct();
    }
	
	/**
	 * 广告位类型
	 */
	public function get_space_type() {
        return array(
            1   => fc_lang('矩形横幅广告'),
            2   => fc_lang('固定位置广告'),
            3   => fc_lang('屏幕漂浮广告'),
            4   => fc_lang('屏幕对联广告'),
            5   => fc_lang('文字代码广告'),
            6   => fc_lang('视频滚动广告'),
            //7   => fc_lang('视频播放代码广告'),播放器支持不会，暂取消
            8   => fc_lang('视频播放图片广告'),
        );
    }


    // 删除广告及附件
    public function delete($where) {

        $row = $this->link->where($where)->get(SITE_ID.'_poster')->result_array();
        if (!$row) {
            return;
        }

        $this->load->model('attachment_model');
        foreach ($row as $t) {
            $this->link->where('id', $t['id'])->delete(SITE_ID.'_poster');
            $this->link->where('id', $t['sid'])->set('items', 'items-1', FALSE)->update(SITE_ID.'_poster_space');
            $this->attachment_model->delete_for_table($this->db->dbprefix(SITE_ID.'_poster').'-'.$t['id']);
        }

        return;
    }

    // 广告缓存
    public function cache($site, $name = '') {

        $this->ci->clear_cache('poster-'.$site);
        $this->ci->clear_cache('poster-video-'.$site);
        $this->ci->clear_cache('poster-text-'.$site);
        $this->ci->clear_cache('poster-code-'.$site);

        $this->ci->dcache->delete('poster-'.$site);
        $this->ci->dcache->delete('poster-text-'.$site);
        $this->ci->dcache->delete('poster-video-'.$site);
        $this->ci->dcache->delete('poster-code-'.$site);

        if (!isset($this->site[$site]) || !$this->site[$site]) {
            return;
        }

        $code = $cache = $video = $text = array();
        $data = $this->site[$site]->where('status', 1)->get($site.'_poster_space')->result_array();
        if ($data) {
            foreach ($data as $t) {
                if ($t['type'] == 6) {
                    $text[] = $t['id'];
                } elseif ($t['type'] == 7) {
                    $code[] = $t['id'];
                } elseif ($t['type'] == 8) {
                    $video[] = $t['id'];
                } else {
                    $t['value'] = dr_string2array($t['value']);
                    $cache[$t['id']] = $t;
                }
            }
            $this->ci->dcache->set('poster-'.$site, $cache);
            $this->ci->dcache->set('poster-text-'.$site, $text);
            $this->ci->dcache->set('poster-video-'.$site, $video);
            $this->ci->dcache->set('poster-code-'.$site, $code);
        }

        // 返回
        if ($name == 'text') {
            return $text;
        } elseif ($name == 'code') {
            return $code;
        } elseif ($name == 'video') {
            return $video;
        } else {
            return $cache;
        }
    }

    // 获取广告位的广告数据
    public function poster($id, $all = 0, $not = 0) {

        if (is_array($id)) {
            $name = 'poster-'.md5(dr_array2string($id)).'-'.SITE_ID.'-'.$all.'-'.$not;
        } else {
            $name = 'poster-'.$id.'-'.SITE_ID.'-'.$all.'-'.$not;
        }

        $data = $this->ci->get_cache_data($name);
        if ($data) {
            return $data;
        }

        $link = $this->site[SITE_ID];
        if ($not) {
            $link->where('id <>', $not);
        }
        if (is_array($id)) {
            $link->where_in('sid', $id);
        } else {
            $link->where('sid', $id);
        }

        $link->where('status', 1);
        $link->where('`starttime` < '.SYS_TIME);
        $link->where('(`endtime` = 0 or '.SYS_TIME.' < `endtime`)');
        if (!$all) {
            $data = $link->order_by('RAND()')->get(SITE_ID.'_poster')->row_array();
        } else {
            $data = $link->limit($all)->order_by('RAND()')->get(SITE_ID.'_poster')->result_array();
        }

        if (!$data) {
            return FALSE;
        }

        $this->ci->set_cache_data($name, $data, SYS_CACHE_POSTER);

        return $data;

    }

    // 获取广告位显示结果
    public function code($id) {

        $space = $this->ci->get_cache('poster-'.SITE_ID, $id);
        if (!$space) {
            return '广告位不存在';
        }

        $cfg = $space['value'][$space['type']];
        $code = '';
        $data = $this->poster($id);
        $value = dr_string2array($data['value']);
        switch ($space['type']) {
            case 1:
                // 横幅矩形广告
                $code.= '<div id="dr_poster_'.$id.'" style="width:'.$cfg['width'].'px;height:'.$cfg['height'].'px">';
                $code.= $this->_show($data['id'], $value['file'], $cfg);
                $code.= '</div>';
                break;
            case 2:
                // 固定位置广告
                $css = '';
                if ($cfg['center']) {
                    // 屏幕居中
                    $l = intval($cfg['left']) - $cfg['width']/2;
                    $t = intval($cfg['top']) - $cfg['height']/2;
                    $css = 'position:fixed;left:50%;top:50%;margin-left:'.$l.'px;margin-top:'.$t.'px';
                } else {
                    // 普通
                    $css = 'position:fixed;left:'.intval($cfg['left']).'px;top:'.intval($cfg['top']).'px';
                }
                $code.= '<div class="dr_poster_fixed" id="dr_poster_'.$id.'" style="z-index:9999999;'.$css.';width:'.($cfg['width']).'px;height:'.$cfg['height'].'px">';
                $code.= '<div>';
                $code.= $this->_show($data['id'], $value['file'], $cfg);
                $code.= '</div>';
                $code.= '<div style="text-align:right;padding-top:5px"><a href="#;" onclick="$(\'#dr_poster_'.$id.'\').hide()">关闭</a></div>';
                $code.= '</div>';
                break;
            case 3:
                // 滚动漂浮广告
                $css = 'position:absolute;left:'.rand(10, 80).'%;top:'.rand(10, 80).'%;';
                $code.= '<div onMouseOver="dr_poster_'.$id.'_stop()" onMouseOut="dr_poster_'.$id.'_stop2()" id="dr_poster_'.$id.'" style="z-index:9999999;'.$css.';width:'.($cfg['width']).'px;height:'.$cfg['height'].'px">';
                $code.= '<div>';
                $code.= $this->_show($data['id'], $value['file'], $cfg);
                $code.= '</div>';
                $code.= '<div style="text-align:right;padding-top:5px"><a href="#;" onclick="$(\'#dr_poster_'.$id.'\').hide()">关闭</a></div>';
                $code.= '</div>';
                $code.= '
               <script>
                var dr_poster_'.$id.'_xPos = '.rand(10, 480).';
                var dr_poster_'.$id.'_yPos = '.rand(10, 480).';
                var dr_poster_'.$id.'_step = 1;
                var dr_poster_'.$id.'_delay = 30;
                var dr_poster_'.$id.'_height = 0;
                var dr_poster_'.$id.'_Hoffset = 0;
                var dr_poster_'.$id.'_Woffset = 0;
                var dr_poster_'.$id.'_yon = '.rand(10, 400).';
                var dr_poster_'.$id.'_xon = '.rand(10, 800).';
                var dr_poster_'.$id.'_pause = 1;
                var dr_poster_'.$id.'_interval;
                function dr_poster_'.$id.'_changePos()
                {
                    if (dr_poster_'.$id.'_pause == 0) return;
                    dr_poster_'.$id.'_width = document.documentElement.clientWidth;
                    dr_poster_'.$id.'_height = document.documentElement.clientHeight;
                    dr_poster_'.$id.'_Hoffset = '.$cfg['height'].'; //
                    dr_poster_'.$id.'_Woffset = '.$cfg['width'].'; //
                    $("#dr_poster_'.$id.'").css("left", dr_poster_'.$id.'_xPos + document.body.scrollLeft);
                    $("#dr_poster_'.$id.'").css("top",  dr_poster_'.$id.'_yPos + document.body.scrollTop);
                    if (dr_poster_'.$id.'_yon) {
                        dr_poster_'.$id.'_yPos = dr_poster_'.$id.'_yPos + dr_poster_'.$id.'_step;
                    } else {
                        dr_poster_'.$id.'_yPos = dr_poster_'.$id.'_yPos - dr_poster_'.$id.'_step;
                    }
                    if (dr_poster_'.$id.'_yPos < 0) {
                        dr_poster_'.$id.'_yon = 1;
                        dr_poster_'.$id.'_yPos = 0;
                    }
                    if (dr_poster_'.$id.'_yPos >= (dr_poster_'.$id.'_height - dr_poster_'.$id.'_Hoffset)) {
                        dr_poster_'.$id.'_yon = 0;
                        dr_poster_'.$id.'_yPos = (dr_poster_'.$id.'_height - dr_poster_'.$id.'_Hoffset);
                    }
                    if (dr_poster_'.$id.'_xon) {
                        dr_poster_'.$id.'_xPos = dr_poster_'.$id.'_xPos + dr_poster_'.$id.'_step;
                    }
                    else
                    {
                        dr_poster_'.$id.'_xPos = dr_poster_'.$id.'_xPos - dr_poster_'.$id.'_step;
                    }
                    if (dr_poster_'.$id.'_xPos < 0)
                    {
                        dr_poster_'.$id.'_xon = 1;
                        dr_poster_'.$id.'_xPos = 0;
                    }
                    if (dr_poster_'.$id.'_xPos >= (dr_poster_'.$id.'_width - dr_poster_'.$id.'_Woffset)) {
                        dr_poster_'.$id.'_xon = 0;
                        dr_poster_'.$id.'_xPos = (dr_poster_'.$id.'_width - dr_poster_'.$id.'_Woffset);
                    }
                }

                function dr_poster_'.$id.'_stop() {
                    dr_poster_'.$id.'_pause = 0;
                }

                function dr_poster_'.$id.'_stop2() {
                    dr_poster_'.$id.'_pause = 1;
                }

                function dr_poster_'.$id.'_start() {
                    document.getElementById("dr_poster_'.$id.'").visibility = "visible";
                    dr_poster_'.$id.'_interval = setInterval("dr_poster_'.$id.'_changePos()", dr_poster_'.$id.'_delay);
                }
                dr_poster_'.$id.'_start();
                </script>
                ';
                break;
            case 4:
                // 左联
                $css = 'position:fixed;left:20px;top:20px;';
                if ($cfg['top']) {
                    $css.= 'margin-top:'.$cfg['top'].'px;';
                }
                if ($cfg['left']) {
                    $css.= 'margin-left:'.$cfg['left'].'px;';
                }
                $code.= '<div class="dr_poster_fixed" id="dr_poster_'.$id.'_left" style="z-index:9999999;'.$css.';width:'.($cfg['width']).'px;height:'.$cfg['height'].'px">';
                $code.= '<div>';
                $code.= $this->_show($data['id'], $value['file'], $cfg);
                $code.= '</div>';
                $code.= '<div style="text-align:right;padding-top:5px"><a href="#;" onclick="$(\'#dr_poster_'.$id.'_right\').hide()">关闭</a></div>';
                $code.= '</div>';

                // 右联
                $left = $data;
                $data = $this->poster($id, 0, $left['id']);
                if (!$data) {
                    $data = $left;
                } else {
                    $value = dr_string2array($data['value']);
                }
                $css = 'position:fixed;right:20px;top:20px;';
                if ($cfg['top']) {
                    $css.= 'margin-top:'.$cfg['top'].'px;';
                }
                if ($cfg['right']) {
                    $css.= 'margin-right:'.$cfg['right'].'px;';
                }
                $code.= '<div class="dr_poster_fixed" id="dr_poster_'.$id.'_right" style="z-index:9999999;'.$css.';width:'.$cfg['width'].'px;height:'.$cfg['height'].'px">';
                $code.= '<div>';
                $code.= $this->_show($data['id'], $value['file'], $cfg);
                $code.= '</div>';
                $code.= '<div style="text-align:right;padding-top:5px"><a href="#;" onclick="$(\'#dr_poster_'.$id.'_right\').hide()">关闭</a></div>';
                $code.= '</div>';
                break;
            case 5:
                // 代码
                $code.= '<div id="dr_poster_'.$id.'">';
                $code.= $value['code'];
                $code.= '</div>';
                break;
        }

        return $code;
    }

    // 显示广告内容
    private function _show($id, $file, $cfg) {

        $code = '';
        $file = $file ? dr_get_file($file) : THEME_PATH.'admin/images/poster.png';
        $file_ext = strtolower(substr(strrchr($file, '.'), 1));
        if (in_array($file_ext, array('gif','png','jpg'))) {
            $code.= '<a href="'.$this->get_url($id).'" target="_blank"><img src="'.$file.'"  width="'.$cfg['width'].'" height="'.$cfg['height'].'" /></a>';
        } elseif ($file_ext == 'swf') {
            $code.= '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="'.$cfg['width'].'" height="'.$cfg['height'].'" id="swf_poster_'.$id.'" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0">';
            $code.= '<param name="movie" value="'.$file.'" />';
            $code.= '<param name="quality" value="autohigh" />';
            $code.= '<param name="wmode" value="opaque" />';
            $code.= '<embed wmode="opaque" src="'.$file.'" quality="autohigh" name="flashad" swliveconnect="TRUE" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="'.$cfg['width'].'" height="'.$cfg['height'].'"></embed>';
            $code.= '</object>';
        } else {
            $code.= '无效文件（'.$file.'），必须是图片或者swf动画。';
        }

        return $code;
    }

    // 广告显示地址
    public function get_url($id) {
        return SITE_URL.'index.php?c=api&m=poster_show&id='.$id;
    }
}