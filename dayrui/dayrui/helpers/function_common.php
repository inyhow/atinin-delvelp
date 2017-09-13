<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 公共函数
 *
 */

//广告状态
function get_ad_status($id) {

	$ci	= &get_instance();
	$data = $ci->db
			   ->where('id', $id)
			   ->get('1_poster_space')
			   ->row_array();

	return $data['status'];		   
}

//会员所在会员组
function get_groupid($uid) {

	$ci	= &get_instance();
	$data = $ci->db
			   ->where('uid', $uid)
			   ->limit(1)
			   ->get('member')
			   ->row_array();

	return $data['groupid'];		   
}

//个人认证证书
function get_personal($num) {

	switch ($num)
		{
		case 1:
		  echo "会计从业资格证";
		  break;
		case 2:
		  echo "助理/初级会计师证";
		  break;
		case 3:
		  echo "中级会计师证";
		  break;
		case 4:
		  echo "高级会计师证";
		  break;
		case 5:
		  echo "税务师证";
		  break;
		case 10:
		  echo "注册会计师证";
		  break;
		}
}

//企业性质
function get_nature($num) {

	$ci	= &get_instance();
	$data = $ci->db
			   ->select('pids,name')
			   ->where('id', $num)
			   ->limit(1)
			   ->get('linkage_data_2')
			   ->row_array();

	$shi = $data['name'];

	$pid = explode(',',$data['pids']);
	if($pid[1]){
		$data1 = $ci->db
			   ->select('pids,name')
			   ->where('id', $pid[1])
			   ->limit(1)
			   ->get('linkage_data_2')
			   ->row_array();
		$sheng = $data1['name'];
	}else{
		$data2 = $ci->db
			   ->select('name')
			   ->where('id', $pid[0])
			   ->limit(1)
			   ->get('linkage_data_2')
			   ->row_array();
		$sheng = $data2['name'];
	}
	
	return $sheng.' > '.$shi;
}


//获取个人、公司信息
function get_info($uid) {

	if($uid){
		//$company = $this->db->where('uid',$uid)->get('member')->row_array();
	    //$info = $this->db->where('uid',$uid)->get('member_data')->row_array();
	    $ci	= &get_instance();
		$info = $ci->db
				   ->where('uid', $uid)
				   ->limit(1)
				   ->get('member_data')
				   ->row_array();

	    return $info;
	}
	
}


//工作年限
function get_worklife($num) { 

	switch ($num)
		{
		case 1:
		  echo "1年以内";
		  break;
		case 2:
		  echo "1~3年";
		  break;
		case 3:
		  echo "3-5年";
		  break;
		case 4:
		  echo "5~10年";
		  break;
		case 5:
		  echo "10年以上";
		  break;
		default:
		  echo "1年以内";
		  break;
		}
}

//求职学历
function get_education($num) { 

	switch ($num)
		{
		case 1:
		  echo "高中";
		  break;
		case 2:
		  echo "大专";
		  break;
		case 3:
		  echo "本科";
		  break;
		case 4:
		  echo "硕士";
		  break;
		case 5:
		  echo "博士";
		  break;
		default:
		  echo "高中";
		  break;
		}

}


//区域
function get_area($num) {

	$ci	= &get_instance();
	$data = $ci->db
			   ->select('pids,name')
			   ->where('id', $num)
			   ->limit(1)
			   ->get('linkage_data_1')
			   ->row_array();

	$shi = $data['name'];

	$pid = explode(',',$data['pids']);
	if($pid[1]){
		$data1 = $ci->db
			   ->select('pids,name')
			   ->where('id', $pid[1])
			   ->limit(1)
			   ->get('linkage_data_1')
			   ->row_array();
		$sheng = $data1['name'];
	}else{
		$data2 = $ci->db
			   ->select('name')
			   ->where('id', $pid[0])
			   ->limit(1)
			   ->get('linkage_data_1')
			   ->row_array();
		$sheng = $data2['name'];
	}
	
	return $sheng.$shi;
}


//招聘薪资待遇
function get_jobsallary_type($num) { 

	switch ($num)
		{
		case 1:
		  echo "面议";
		  break;
		case 2:
		  echo "1000~3000";
		  break;
		case 3:
		  echo "3000~5000";
		  break;
		case 4:
		  echo "5000~8000";
		  break;
		case 5:
		  echo "8000以上";
		  break;
		default:
		  echo "面议";
		  break;
		}

}

//求职薪资待遇
function get_qzsallary_type($num) { 

	switch ($num)
		{
		case 1:
		  echo "面议";
		  break;
		case 2:
		  echo "1000~3000";
		  break;
		case 3:
		  echo "3000~5000";
		  break;
		case 4:
		  echo "5000~8000";
		  break;
		case 5:
		  echo "8000以上";
		  break;
		default:
		  echo "面议";
		  break;

		}

}