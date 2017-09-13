<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 财税工具计算函数
 *
 */

//1.工资、薪金所得（月薪）
function wages($money,$insurance,$threshold){ 

	$star = $insurance+$threshold;   //开始缴纳所得税点
	if($money<=$star){
		return array('msg'=>'您无需缴纳个人所得税。');
	}else{
		$yingnashui = $money-$star;                      //应纳税所得额

		if($yingnashui<=1500){
			$rate = 3;                                   //适用税率
			$susuan = 0;                                 //速算扣除数
		}elseif($yingnashui>1500 && $yingnashui<=4500){
			$rate = 10;                                  //适用税率
			$susuan = 105;                               //速算扣除数
		}elseif($yingnashui>4500 && $yingnashui<=9000){
			$rate = 20;                                  //适用税率
			$susuan = 555;                               //速算扣除数
		}elseif($yingnashui>9000 && $yingnashui<=35000){
			$rate = 25;                                  //适用税率
			$susuan = 1005;                              //速算扣除数
		}elseif($yingnashui>35000 && $yingnashui<=55000){
			$rate = 30;                                  //适用税率
			$susuan = 2755;                              //速算扣除数
		}elseif($yingnashui>55000 && $yingnashui<=80000){
			$rate = 35;                                  //适用税率
			$susuan = 5505;                              //速算扣除数
		}elseif($yingnashui>80000){
			$rate = 45;                                  //适用税率
			$susuan = 13505;                             //速算扣除数
		}
		$yingjiao = $yingnashui*$rate/100-$susuan;       //应缴税款
		$income = $money-$yingjiao-$insurance;  	     //实发工资
	}

	return array('yingnashui' =>$yingnashui, 'rate' => $rate, 'susuan' =>$susuan,  'yingjiao' => $yingjiao,  'income' => $income);
}


//2.年终奖个人所得税
function bonus($money) { 

	$yingnashui = $money;                         //应纳税所得额
	$average = $yingnashui/12;                    //平均每月

	if($average<=1500){
		$rate = 3;                                //适用税率
		$susuan = 0;                              //速算扣除数
	}elseif($average>1500 && $average<=4500){
		$rate = 10;                               //适用税率
		$susuan = 105;                            //速算扣除数
	}elseif($average>4500 && $average<=9000){
		$rate = 20;                               //适用税率
		$susuan = 555;                            //速算扣除数
	}elseif($average>9000 && $average<=35000){
		$rate = 25;                               //适用税率
		$susuan = 1005;                           //速算扣除数
	}elseif($average>35000 && $average<=55000){
		$rate = 30;                               //适用税率
		$susuan = 2755;                           //速算扣除数
	}elseif($average>55000 && $average<=80000){
		$rate = 35;                               //适用税率
		$susuan = 5505;                           //速算扣除数
	}elseif($average>80000){
		$rate = 45;                               //适用税率
		$susuan = 13505;                          //速算扣除数
	}

	$yingjiao = $yingnashui*$rate/100-$susuan;    //应缴税款
	$income = $money-$yingjiao;  	              //税后收入

	return array('average' =>$average, 'rate' => $rate, 'susuan' =>$susuan,  'yingjiao' => $yingjiao, 'income' => $income);
}



//3.劳务报酬所得
function labor_remuneration($money) { 

	//劳务报酬所得在800元以下的，不用缴纳个人所得税;
	if($money<800){
		return array('msg'=>'收入低于800元，无需纳税。');
	}elseif($money>=800 && $money<=4000){
		//劳务报酬所得大于800元且没有超过4000元，可减除800元的扣除费用;
		$jianchu = 800;                		      //减除费用
		$yingnashui = $money-800;                 //应纳税所得额
		$rate = 20;                               //适用税率
		$susuan = 0;                              //速算扣除数
	}elseif($money>4000 && $money<=20000){
		//不超过20,000元的
		$rate = 20;                               //适用税率
		$susuan = 0;                              //速算扣除数
		$jianchu = $money*0.2;             	      //减除费用
		$yingnashui = $money*(1-0.2);             //应纳税所得额
	}elseif($money>20000 && $money<=50000){
		//超过20,000元到50,000元的部分
		$rate = 30;                               //适用税率
		$susuan = 2000;                           //速算扣除数
		$jianchu = $money*0.2;             		  //减除费用
		$yingnashui = $money*(1-0.2);             //应纳税所得额
	}elseif($money>50000){
		//超过50,000元的部分
		$rate = 40;                               //适用税率
		$susuan = 7000;                           //速算扣除数
		$jianchu = $money*0.2;             		  //减除费用
		$yingnashui = $money*(1-0.2);             //应纳税所得额
	}

	$yingjiao = $yingnashui*$rate/100-$susuan;    //应缴税款
	$income = $money-$yingjiao;  		          //税后收入

	return array('yingnashui' =>$yingnashui, 'jianchu' =>$jianchu, 'rate' => $rate, 'susuan' =>$susuan, 'yingjiao' => $yingjiao, 'income' => $income);
}


//4.特许权使用费所得
function franchise($money) { 

	if($money>4000){
		//每次收入超过4000元的
		$jianchu = $money*0.2;             		  //减除费用
		$yingnashui = $money*(1-0.2);             //应纳税所得额
		$rate = 20;                               //适用税率
		$yingjiao = $yingnashui*0.2;      		  //应缴税款
		$income = $money-$yingjiao;  		      //税后收入
	}else{
		//每次收入不超过4000元的
		$jianchu = 800;                		      //减除费用
		$yingnashui = $money-800;                 //应纳税所得额
		$rate = 20;                               //适用税率
		$yingjiao = $yingnashui*0.2;      		  //应缴税款
		$income = $money-$yingjiao;  		      //税后收入
	}
	
	return array('yingnashui' =>$yingnashui, 'jianchu' =>$jianchu, 'rate' => $rate, 'yingjiao' => $yingjiao, 'income' => $income);
}



//5.财产租赁
function property_lease($money) { 

	if($money>4000){
		//每次收入超过4000元的
		$jianchu = $money*0.2;             		  //减除费用
		$yingnashui = $money*(1-0.2);             //应纳税所得额
		$rate = 20;                               //适用税率
		$yingjiao = $yingnashui*0.2;      		  //应缴税款
		$income = $money-$yingjiao;  		      //税后收入
	}else{
		//每次收入不超过4000元的
		$jianchu = 800;                		      //减除费用
		$yingnashui = $money-800;                 //应纳税所得额
		$rate = 20;                               //适用税率
		$yingjiao = $yingnashui*0.2;      		  //应缴税款
		$income = $money-$yingjiao;  		      //税后收入
	}
	
	return array('yingnashui' =>$yingnashui, 'jianchu' =>$jianchu, 'yingjiao' => $yingjiao, 'rate' => $rate, 'income' => $income);
}


//6.财产转让所得税
function property_transfer($money) { 

	$yingnashui = $money;             //应纳税所得额
	$rate = 20;                       //适用税率
	$yingjiao = $yingnashui*0.2;      //应缴税款
	$income = $money-$yingjiao;       //税后收入

	return array('yingnashui' =>$yingnashui, 'rate' => $rate, 'yingjiao' => $yingjiao, 'income' => $income);
}


//7.利息、股息、红利所得
function interest($money) { 

	$yingnashui = $money;             //应纳税所得额
	$rate = 20;                       //适用税率
	$yingjiao = $yingnashui*0.2;      //应缴税款
	$income = $money-$yingjiao;       //税后收入

	return array('yingnashui' =>$yingnashui, 'yingjiao' => $yingjiao, 'rate' => $rate,'income' => $income);
}


//8.偶然所得税（中彩，中奖税）
function accidental($money) { 

	$yingnashui = $money;             //应纳税所得额
	$rate = 20;                       //适用税率
	$yingjiao = $yingnashui*0.2;      //应缴税款
	$income = $money-$yingjiao;       //税后收入

	return array('yingnashui' =>$yingnashui, 'yingjiao' => $yingjiao, 'rate' => $rate, 'income' => $income);
}
