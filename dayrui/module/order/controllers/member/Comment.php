<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/11/2
 * Time: 13:29
 */


require FCPATH.'dayrui/core/D_Comment.php';
class Comment extends  D_Comment{

    public function __construct(){
        parent::__construct();
        $this->module('mall');
    }


}