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
	
class Navigator_model extends CI_Model {
	
	public $link;
	public $tablename;
	private $categorys;
	
	/**
	 * 网站导航
	 */
    public function __construct() {
        parent::__construct();
		$this->link = $this->site[SITE_ID];
		$this->tablename = $this->link->dbprefix(SITE_ID.'_navigator');
    }
	
	/**
	 * 获取导航信息
	 *
	 * @param	intval	$id
	 * @return	array
	 */
	public function get($id) {
		return $this->link->where('id', $id)->get($this->tablename)->row_array();
	}

    /**
     * 获取分类导航信息
     *
     * @return	array
     */
    public function get_data($type) {

        $data = $this->link->where('type', $type)->order_by('displayorder ASC,id ASC')->get($this->tablename)->result_array();
        if (!$data) {
            return array();
        }

        $nav = array();
        foreach ($data as $t) {
            $nav[$t['id']] = $t;
        }

        return $nav;
    }

    /**
     * 获取全部导航信息
     *
     * @return	array
     */
    public function get_data_all() {

        $data = $this->link->order_by('displayorder ASC,id ASC')->get($this->tablename)->result_array();
        if (!$data) {
            return array();
        }

        $nav = array();
        foreach ($data as $t) {
            $nav[$t['id']] = $t;
        }

        return $nav;
    }
	
	/**
	 * 添加
	 *
	 * @param	array	$data
	 * @return	intval
	 */
	public function add($data) {
	
		if (!$data) {
            return NULL;
        }

        $pid = (int)$data['pid'];
        $extend = (int)$data['extend'];

		$this->link->insert($this->tablename, array(
            'url' => $data['url'],
			'pid' => $pid,
            'pids' => '',
            'type' => $data['type'],
            'mark' => $data['mark'],
			'name' => $data['name'],
			'show' => 1,
			'title' => $data['title'],
			'thumb' => $data['thumb'],
			'child' => 0,
			'target' => 0,
            'extend' => $extend,
            'childids' => '',
            'displayorder' => 0,
		));
		
		$id = $this->link->insert_id();

        // 继承下级栏目
        if ($data['mark'] && $extend && $data['extends']) {
            $this->set_extend($id, $data['mark'], $data['extends'], $data['type']);
        }

		$this->repair();
		
		return $id;
	}

    // 继承下级数据项
    public function set_extend($id, $mark, $extends, $type) {

        $pids = array();

        foreach ($extends as $t) {
            $pid = isset($pids[$t['pid']]) && $pids[$t['pid']] ? (int)$pids[$t['pid']] : $id;
            if (strpos($mark, 'page') === 0) {
                $mark2 = 'page-'.$t['id'];
            } else {
                list($a, $b, $c) = explode('-', $mark);
                $mark2 = $a.'-'.$b.'-'.$t['id'];
            }
            // 判断重复性
            if (!$this->link
                      ->where('pid', $pid)
                      ->where('type', $type)
                      ->where('mark', $mark2)
                      ->count_all_results($this->tablename)) {
                // 保存数据
                $this->link->insert($this->tablename, array(
                    'url' => $t['url'],
                    'pid' => $pid,
                    'pids' => '',
                    'type' => $type,
                    'mark' => $mark2,
                    'name' => $t['name'],
                    'show' => 1,
                    'title' => $t['title'] ? $t['title'] : '',
                    'thumb' => $t['thumb'] ? $t['thumb'] : '',
                    'child' => 0,
                    'target' => 0,
                    'extend' => 1,
                    'childids' => '',
                    'displayorder' => 0,
                ));
                // 归类父id
                $pids[$t['id']] = $this->link->insert_id();
            }
        }

    }
	
	/**
	 * 修改
	 *
	 * @param	intval	$id
	 * @param	array	$data
	 * @return	string
	 */
	public function edit($id, $data) {

		$this->link->where('id', $id)->update($this->tablename, array(
			'pid' => $data['pid'],
			'url' => $data['url'],
			'name' => $data['name'],
			'title' => $data['title'] ? $data['title'] : '',
			'thumb' => $data['thumb'],
            'extend' => (int)$data['extend'],
		));

		$this->repair();
		
		return $id;
	}

    /**
     * pids
     *
     * @param	integer	$catid	��ĿID
     * @param	array	$pids	��Ŀ¼ID
     * @param	integer	$n		���ҵĲ��
     * @return	string
     */
    private function get_pids($catid, $pids = '', $n = 1) {

        if ($n > 5 || !is_array($this->categorys)
            || !isset($this->categorys[$catid])) {
            return FALSE;
        }

        $pid = $this->categorys[$catid]['pid'];
        $pids = $pids ? $pid.','.$pids : $pid;

        if ($pid) {
            $pids = $this->get_pids($pid, $pids, ++$n);
        } else {
            $this->categorys[$catid]['pids'] = $pids;
        }

        return $pids;
    }

    /**
     * childids
     *
     * @param	$catid	��ĿID
     * @return	string
     */
    private function get_childids($catid) {

        $childids = $catid;

        if (is_array($this->categorys)) {
            foreach ($this->categorys as $id => $cat) {
                if ($cat['pid'] && $id != $catid
                    && $cat['pid'] == $catid) {
                    $childids.= ','.$this->get_childids($id);
                }
            }
        }

        return $childids;
    }

    /**
     * �ҳ���Ŀ¼�б�
     *
     * @param	array	$data
     * @return	bool
     */
    private function get_categorys($data = array()) {

        if (is_array($data) && !empty($data)) {
            foreach ($data as $catid => $c) {
                $this->categorys[$catid] = $c;
                $result = array();
                foreach ($this->categorys as $_k => $_v) {
                    if ($_v['pid']) {
                        $result[] = $_v;
                    }
                }
            }
        }

        return true;
    }

    /**
     * 修复id
	 */
	public function repair($site = SITE_ID) {

        $this->categorys = $categorys = array();
        $this->categorys = $categorys = $this->get_data_all();
        $this->get_categorys($categorys);

        if (is_array($this->categorys)) {
            foreach ($this->categorys as $catid => $cat) {
                $pids = $this->get_pids($catid);
                $childids = $this->get_childids($catid);
                $child = is_numeric($childids) ? 0 : 1;
                if ($categorys[$catid]['pids'] != $pids
                    || $categorys[$catid]['childids'] != $childids
                    || $categorys[$catid]['child'] != $child) {
                    $this->link->where('id', $cat['id'])->update($this->tablename, array(
                        'pids' => $pids,
                        'child' => $child,
                        'childids' => $childids,
                    ));
                }
            }
        }
	}

    // 获取自己id和子id
    private function _get_id($id) {

        if (!$id) {
            return NULL;
        }

        $this->categorys[$id] = $id;

        $data = $this->link
                     ->select('id,child')
                     ->where('pid', $id)
                     ->get($this->tablename)
                     ->result_array();
        if (!$data) {
            return NULL;
        }

        foreach ($data as $t) {
            $this->categorys[$t['id']] = $t['id'];
            if ($t['child']) {
                $this->_get_id($t['id']);
            }
        }
    }

    public function delete($ids) {

        $this->categorys = array();
        foreach ($ids as $id) {
            $this->_get_id($id);
        }

        if ($this->categorys) {
            $this->link->where_in('id', $this->categorys)->delete($this->tablename);
            $this->load->model('attachment_model');
            foreach ($this->categorys as $id) {
                $this->attachment_model->delete_for_table($this->tablename.'-'.$id);
            }
        }

    }

    // 更新是否继承下级
    public function update_extend($ids, $extend) {

        // 更新所有子类的extend值
        if ($ids) {
            $this->link->where('id IN('.$ids.')')->update($this->tablename, array('extend' => $extend));
        }

        return NULL;
    }

    // 同步添加/更新栏目、单页 （用于栏目控制器页面的修复添加时调用）
    public function syn_value($data, $id, $dir = '') {

        // 判断是否添加或修改
        $cat = $this->link
                    ->select('id,pid')
                    ->where('mark', $dir ? 'module-'.$dir.'-'.$id : 'page-'.$id)
                    ->where('extend', 1)
                    ->get($this->tablename)
                    ->row_array();
        if ($cat) {
            // 修改
            $pid = (int)$cat['pid'];
            // 根据栏目/单页的pid来查询出在导航中的pid
            $pcat = $this->link
                         ->select('id')
                         ->where('mark', $dir ? 'module-'.$dir.'-'.$data['pid'] : 'page-'.$data['pid'])
                         ->where('extend', 1)
                         ->get($this->tablename)
                         ->row_array();
            if ($pnav) {
                $pid = $pcat['id'];
            }
            // 保存导航数据
            $this->link->where('id', $cat['id'])->update($this->tablename, array(
                'pid' => $pid,
                'name' => $data['name'],
                'thumb' => $data['thumb'],
                'title' => isset($data['title']) ? $data['title'] : '',
            ));
        } else {
            // 添加
            $pid = intval($data['pid']);
            // 查询菜单父id是否存在于当前导航
            $top = $this->link
                        ->select('extend,id,type')
                        ->where('mark', $dir ? 'module-'.$dir.'-'.$pid : 'page-'.$pid)
                        ->where('extend', 1)
                        ->get($this->tablename)
                        ->row_array();
            if (!$top) {
                // 单页的父级导航没出现在导航表中时，不执行
                return;
            }
            // 保存到导航中
            $this->link->insert($this->tablename, array(
                'url' => '',
                'pid' => $top['id'],
                'pids' => '',
                'name' => $data['name'],
                'mark' => $dir ? 'module-'.$dir.'-'.$id : 'page-'.$id,
                'type' => (int)$top['type'],
                'show' => 1,
                'thumb' => $data['thumb'],
                'title' => isset($data['title']) ? $data['title'] : '',
                'child' => 0,
                'target' => 0,
                'extend' => (int)$top['extend'],
                'childids' => '',
                'displayorder' => 0,
            ));
        }

        return;
    }

    // 生成缓存
    public function cache($site) {

        // 数据表
        $this->link = $this->site[$site];
        $this->tablename = $this->link->dbprefix($site.'_navigator');

        // 修复数据
        $this->repair($site);

        // 查询当前站点的导航数据
        $data = $this->link
                     ->where('show', 1)
                     ->order_by('displayorder ASC,id ASC')
                     ->get($this->tablename)
                     ->result_array();
        // 当前站点有数据时更新缓存
        $this->ci->clear_cache('navigator-'.$site);
        $this->ci->dcache->delete('navigator-'.$site);

        // 数据格式化
        if ($data) {
            // 加载单页模型类
            $this->load->model('page_model');
            $this->page_model->link = $this->site[$site];
            $this->page_model->tablename = $this->link->dbprefix($site.'_page');
            // 初始化数据
            $page = $cache = array();
            foreach ($data as $t) {
                $t['cids'] = $t['childids'] ? explode(',', $t['childids']) : array();
                $t['module'] = $t['catid'] = '';
                $t['catids'] = $t['pageids'] = array();
                if ($t['mark']) {
                    $url = NULL;
                    if (strpos($t['mark'], 'page') === 0) {
                        // 单页链接处理
                        list($a, $id) = explode('-', $t['mark']);
                        if (!$page) {
                            $page = $this->page_model->get_data_all();
                        }
                        if (isset($page[$id]) && $page[$id]) {
                            $url = $this->page_model->get_url($page[$id], $site);
                            $t['pageids'] = $page[$id]['childids'] ? @explode(',', $page[$id]['childids']) : array($id); // 单页id
                            //print_r($t['pageids']);exit;
                        }
                    } elseif (strpos($t['mark'], 'module') === 0) {
                        // 模块链接处理
                        list($a, $dir, $catid) = explode('-', $t['mark']);
                        $m = $this->ci->get_cache('module-'.$site.'-'.$dir);
                        if ($catid) {
                            $c = $m['category'][$catid];
                            if ($c) {
                                $url = isset($c['setting']['linkurl']) && $c['setting']['linkurl'] ? $c['setting']['linkurl'] : dr_category_url($m, $c, 0, $site);
                                $t['catid'] = $catid;
                                $t['catids'] = $c['catids'];
                            }
                        } else {
                            $url = $m['url'];
                        }
                        $t['module'] = $dir;
                    }
                    // 更新URL到数据表
                    if ($url) {
                        $this->link->where('id', $t['id'])->update($this->tablename, array('url' => $url));
                        $t['url'] = $url;
                    }
                }
                $cache[(int)$t['type']][] = $t;
            }

            // 保存缓存到文本
            $this->ci->dcache->set('navigator-'.$site, $cache);
        }

        return $cache;
    }

}