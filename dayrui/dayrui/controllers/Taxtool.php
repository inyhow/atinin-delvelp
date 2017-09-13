<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.7.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 * @filesource	svn://www.dayrui.net/v2/news/controllers/home.php
 */

require FCPATH.'dayrui/core/D_Comment.php';
 
class Taxtool extends D_Comment {
	
    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->module(APP_DIR);
	}

	public function index(){

        $this->template->assign(array(
                'meta_title' => '财税工具_联标',
                ));

		$this->template->display('taxtool.html');
	}

    //1.工资、薪金所得（月薪）
    public function m_wages(){

        $this->template->assign(array(
                'meta_title' => '个人所得税计算_联标',
                ));
        $this->template->display('tax_wages.html');
    }

    public function ajax_wages(){

        $money=$_POST['money'];
        $insurance=$_POST['insurance'];
        $threshold=$_POST['threshold'];

        $arr = $this->wages($money,$insurance,$threshold);
        echo json_encode($arr);
    }


    //2.年终奖个人所得税
    public function m_bonus(){
        $this->template->assign(array(
                'meta_title' => '个人所得税计算_联标',
                ));
        $this->template->display('tax_bonus.html');
    }

    public function ajax_bonus(){

        $money=$_POST['money'];
        $arr = $this->bonus($money);
        echo json_encode($arr);
    }


    //3.劳务报酬所得
    public function m_labor_remuneration(){
        $this->template->assign(array(
                'meta_title' => '个人所得税计算_联标',
                ));
        $this->template->display('tax_labor_remuneration.html');
    }

    public function ajax_labor_remuneration(){

        $money=$_POST['money'];
        $arr = $this->labor_remuneration($money);
        echo json_encode($arr);
    }


    //4.特许权使用费所得
    public function m_franchise(){
        $this->template->assign(array(
                'meta_title' => '个人所得税计算_联标',
                ));
        $this->template->display('tax_franchise.html');
    }

    public function ajax_franchise(){

        $money=$_POST['money'];
        $arr = $this->franchise($money);
        echo json_encode($arr);
    }


    //5.财产租赁
    public function m_property_lease(){
        $this->template->assign(array(
                'meta_title' => '个人所得税计算_联标',
                ));
        $this->template->display('tax_property_lease.html');
    }

    public function ajax_property_lease(){

        $money=$_POST['money'];
        $arr = $this->property_lease($money);
        echo json_encode($arr);
    }
    

    //6.财产转让所得税
    public function m_property_transfer(){
        $this->template->assign(array(
                'meta_title' => '个人所得税计算_联标',
                ));
        $this->template->display('tax_property_transfer.html');
    }

    public function ajax_property_transfer(){

        $money=$_POST['money'];
        $arr = $this->property_transfer($money);
        echo json_encode($arr);
    }


    //7.利息、股息、红利所得
    public function m_interest(){
        $this->template->assign(array(
                'meta_title' => '个人所得税计算_联标',
                ));
        $this->template->display('tax_interest.html');
    }

    public function ajax_interest(){

        $money=$_POST['money'];
        $arr = $this->interest($money);
        echo json_encode($arr);
    }


    //8.偶然所得税（中彩，中奖税）
    public function m_accidental(){
        $this->template->assign(array(
                'meta_title' => '个人所得税计算_联标',
                ));
        $this->template->display('tax_accidental.html');
    }

    public function ajax_accidental(){

        $money=$_POST['money'];
        $arr = $this->accidental($money);
        echo json_encode($arr);
    }



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
            $income = $money-$yingjiao-$insurance;           //实发工资
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
        $income = $money-$yingjiao;                   //税后收入

        return array('average' =>$average, 'rate' => $rate, 'susuan' =>$susuan,  'yingjiao' => $yingjiao, 'income' => $income);
    }



    //3.劳务报酬所得
    function labor_remuneration($money) { 

        //劳务报酬所得在800元以下的，不用缴纳个人所得税;
        if($money<800){
            return array('msg'=>'收入低于800元，无需纳税。');
        }elseif($money>=800 && $money<=4000){
            //劳务报酬所得大于800元且没有超过4000元，可减除800元的扣除费用;
            $jianchu = 800;                           //减除费用
            $yingnashui = $money-800;                 //应纳税所得额
            $rate = 20;                               //适用税率
            $susuan = 0;                              //速算扣除数
        }elseif($money>4000 && $money<=20000){
            //不超过20,000元的
            $rate = 20;                               //适用税率
            $susuan = 0;                              //速算扣除数
            $jianchu = $money*0.2;                    //减除费用
            $yingnashui = $money*(1-0.2);             //应纳税所得额
        }elseif($money>20000 && $money<=50000){
            //超过20,000元到50,000元的部分
            $rate = 30;                               //适用税率
            $susuan = 2000;                           //速算扣除数
            $jianchu = $money*0.2;                    //减除费用
            $yingnashui = $money*(1-0.2);             //应纳税所得额
        }elseif($money>50000){
            //超过50,000元的部分
            $rate = 40;                               //适用税率
            $susuan = 7000;                           //速算扣除数
            $jianchu = $money*0.2;                    //减除费用
            $yingnashui = $money*(1-0.2);             //应纳税所得额
        }

        $yingjiao = $yingnashui*$rate/100-$susuan;    //应缴税款
        $income = $money-$yingjiao;                   //税后收入

        return array('yingnashui' =>$yingnashui, 'jianchu' =>$jianchu, 'rate' => $rate, 'susuan' =>$susuan, 'yingjiao' => $yingjiao, 'income' => $income);
    }


    //4.特许权使用费所得
    function franchise($money) { 

        if($money>4000){
            //每次收入超过4000元的
            $jianchu = $money*0.2;                    //减除费用
            $yingnashui = $money*(1-0.2);             //应纳税所得额
            $rate = 20;                               //适用税率
            $yingjiao = $yingnashui*0.2;              //应缴税款
            $income = $money-$yingjiao;               //税后收入
        }else{
            //每次收入不超过4000元的
            $jianchu = 800;                           //减除费用
            $yingnashui = $money-800;                 //应纳税所得额
            $rate = 20;                               //适用税率
            $yingjiao = $yingnashui*0.2;              //应缴税款
            $income = $money-$yingjiao;               //税后收入
        }
        
        return array('yingnashui' =>$yingnashui, 'jianchu' =>$jianchu, 'rate' => $rate, 'yingjiao' => $yingjiao, 'income' => $income);
    }



    //5.财产租赁
    function property_lease($money) { 

        if($money>4000){
            //每次收入超过4000元的
            $jianchu = $money*0.2;                    //减除费用
            $yingnashui = $money*(1-0.2);             //应纳税所得额
            $rate = 20;                               //适用税率
            $yingjiao = $yingnashui*0.2;              //应缴税款
            $income = $money-$yingjiao;               //税后收入
        }else{
            //每次收入不超过4000元的
            $jianchu = 800;                           //减除费用
            $yingnashui = $money-800;                 //应纳税所得额
            $rate = 20;                               //适用税率
            $yingjiao = $yingnashui*0.2;              //应缴税款
            $income = $money-$yingjiao;               //税后收入
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


}