<?php

/**
 * Dayrui Website Management System
 * 
 * @since			version 2.0.0
 * @author			Dayrui <dayrui@gmail.com>
 * @license     	http://www.dayrui.com/license
 * @copyright		Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

if (!defined('BASEPATH')) exit('No direct script access allowed');


/**
 * 这里由开发者自定义伪静态规则,放在下面括号里面
 */
 

return array(

	"account.html"        =>  "/account/index",
	"publish.html"        =>  "/publish/index",
    "publish_job.html"        =>  "/publish/publish_job",
    "taxtool.html"        =>  "/taxtool/index",
    "taxtool-m_wages.html"        =>  "/taxtool/m_wages",

	/*-------------------站点[1] 网站单页规则 开始-----------------*/ 

	// 网站单页[关于我们](分页)
	"about-(\d+)-(\d+).html"                                    =>	"page/index/id/$1/page/$2",
	// 网站单页[关于我们]
	"about-(\d+).html"                                          =>	"page/index/id/$1",
    /*-------------------站点[1] 模块[新闻 news] 开始-----------------*/ 

    // 新闻[news]模块首页
    "news.html"                                                 =>  "news/home/index/",
    // 新闻[news]栏目列表(分页)
    "news-list-([a-z0-9]+)-(\d+).html"                          =>  "news/category/index/dir/$1/page/$2",
    // 新闻[news]栏目列表
    "news-list-([a-z0-9]+).html"                                =>  "news/category/index/dir/$1",
    // 新闻[news]模块内容页(分页)
    "news-show-(\d+)-(\d+).html"                                =>  "news/show/index/id/$1/page/$2",
    // 新闻[news]内容页
    "news-show-(\d+).html"                                      =>  "news/show/index/id/$1",
    // 新闻[news]模块扩展页(分页)
    "news-read-(\d+)-(\d+).html"                                =>  "news/extend/index/id/$1/page/$2",
    // 新闻[news]扩展页
    "news-read-(\d+).html"                                      =>  "news/extend/index/id/$1",
    // 新闻[news]搜索页(分页)
    "news\/search-(.+).html"                                    =>  "news/search/index/rewrite/$1",
    // 新闻[news]搜索页
    "news/search.html"                                          =>  "news/search/index",
    // 新闻[news]TAG页(分页)
    "news-tag-(\w+)-(\d+).html"                                 =>  "news/tag/index/name/$1/page/$2",
    // 新闻[news]TAG页
    "news-tag-(\w+).html"                                       =>  "news/tag/index/name/$1",

    /*-------------------站点[1] 模块[新闻 news] 结束-----------------*/ 


    /*-------------------站点[1] 模块[商城 shop] 开始-----------------*/ 

    // 商城[shop]模块首页
    "shop.html"                                                 =>  "shop/home/index/",
    // 商城[shop]栏目列表(分页)
    "shop-list-([a-z0-9]+)-(\d+).html"                          =>  "shop/category/index/dir/$1/page/$2",
    // 商城[shop]栏目列表
    "shop-list-([a-z0-9]+).html"                                =>  "shop/category/index/dir/$1",
    // 商城[shop]模块内容页(分页)
    "shop-show-(\d+)-(\d+).html"                                =>  "shop/show/index/id/$1/page/$2",
    // 商城[shop]内容页
    "shop-show-(\d+).html"                                      =>  "shop/show/index/id/$1",
    // 商城[shop]模块扩展页(分页)
    "shop-read-(\d+)-(\d+).html"                                =>  "shop/extend/index/id/$1/page/$2",
    // 商城[shop]扩展页
    "shop-read-(\d+).html"                                      =>  "shop/extend/index/id/$1",
    // 商城[shop]搜索页(分页)
    "shop\/search-(.+).html"                                    =>  "shop/search/index/rewrite/$1",
    // 商城[shop]搜索页
    "shop/search.html"                                          =>  "shop/search/index",
    // 商城[shop]TAG页(分页)
    "shop-tag-(\w+)-(\d+).html"                                 =>  "shop/tag/index/name/$1/page/$2",
    // 商城[shop]TAG页
    "shop-tag-(\w+).html"                                       =>  "shop/tag/index/name/$1",

    /*-------------------站点[1] 模块[商城 shop] 结束-----------------*/ 



    /*-------------------站点[1] 模块[招聘 job] 开始-----------------*/ 

    // 招聘[job]模块首页
    "job.html"                                                  =>  "job/home/index/",
    // 招聘[job]栏目列表(分页)
    "job-list-([a-z0-9]+)-(\d+).html"                           =>  "job/category/index/dir/$1/page/$2",
    // 招聘[job]栏目列表
    "job-list-([a-z0-9]+).html"                                 =>  "job/category/index/dir/$1",
    // 招聘[job]模块内容页(分页)
    "job-show-(\d+)-(\d+).html"                                 =>  "job/show/index/id/$1/page/$2",
    // 招聘[job]内容页
    "job-show-(\d+).html"                                       =>  "job/show/index/id/$1",
    // 招聘[job]模块扩展页(分页)
    "job-read-(\d+)-(\d+).html"                                 =>  "job/extend/index/id/$1/page/$2",
    // 招聘[job]扩展页
    "job-read-(\d+).html"                                       =>  "job/extend/index/id/$1",
    // 招聘[job]搜索页(分页)
    "job\/search-(.+).html"                                     =>  "job/search/index/rewrite/$1",
    // 招聘[job]搜索页
    "job/search.html"                                           =>  "job/search/index",
    // 招聘[job]TAG页(分页)
    "job-tag-(\w+)-(\d+).html"                                  =>  "job/tag/index/name/$1/page/$2",
    // 招聘[job]TAG页
    "job-tag-(\w+).html"                                        =>  "job/tag/index/name/$1",

    /*-------------------站点[1] 模块[招聘 job] 结束-----------------*/ 



    /*-------------------站点[1] 模块[求职 qiuzhi] 开始-----------------*/ 

    // 求职[qiuzhi]模块首页
    "qiuzhi.html"                                               =>  "qiuzhi/home/index/",
    // 求职[qiuzhi]栏目列表(分页)
    "qiuzhi-list-([a-z0-9]+)-(\d+).html"                        =>  "qiuzhi/category/index/dir/$1/page/$2",
    // 求职[qiuzhi]栏目列表
    "qiuzhi-list-([a-z0-9]+).html"                              =>  "qiuzhi/category/index/dir/$1",
    // 求职[qiuzhi]模块内容页(分页)
    "qiuzhi-show-(\d+)-(\d+).html"                              =>  "qiuzhi/show/index/id/$1/page/$2",
    // 求职[qiuzhi]内容页
    "qiuzhi-show-(\d+).html"                                    =>  "qiuzhi/show/index/id/$1",
    // 求职[qiuzhi]模块扩展页(分页)
    "qiuzhi-read-(\d+)-(\d+).html"                              =>  "qiuzhi/extend/index/id/$1/page/$2",
    // 求职[qiuzhi]扩展页
    "qiuzhi-read-(\d+).html"                                    =>  "qiuzhi/extend/index/id/$1",
    // 求职[qiuzhi]搜索页(分页)
    "qiuzhi\/search-(.+).html"                                  =>  "qiuzhi/search/index/rewrite/$1",
    // 求职[qiuzhi]搜索页
    "qiuzhi/search.html"                                        =>  "qiuzhi/search/index",
    // 求职[qiuzhi]TAG页(分页)
    "qiuzhi-tag-(\w+)-(\d+).html"                               =>  "qiuzhi/tag/index/name/$1/page/$2",
    // 求职[qiuzhi]TAG页
    "qiuzhi-tag-(\w+).html"                                     =>  "qiuzhi/tag/index/name/$1",

    /*-------------------站点[1] 模块[求职 qiuzhi] 结束-----------------*/ 




    /*-------------------站点[1] 模块[在线咨询 answer] 开始-----------------*/ 

    // 在线咨询[answer]模块首页
    "answer.html"                                               =>  "answer/home/index/",
    // 在线咨询[answer]栏目列表(分页)
    "answer-list-([a-z0-9]+)-(\d+).html"                        =>  "answer/category/index/dir/$1/page/$2",
    // 在线咨询[answer]栏目列表
    "answer-list-([a-z0-9]+).html"                              =>  "answer/category/index/dir/$1",
    // 在线咨询[answer]模块内容页(分页)
    "answer-show-(\d+)-(\d+).html"                              =>  "answer/show/index/id/$1/page/$2",
    // 在线咨询[answer]内容页
    "answer-show-(\d+).html"                                    =>  "answer/show/index/id/$1",
    // 在线咨询[answer]模块扩展页(分页)
    "answer-read-(\d+)-(\d+).html"                              =>  "answer/extend/index/id/$1/page/$2",
    // 在线咨询[answer]扩展页
    "answer-read-(\d+).html"                                    =>  "answer/extend/index/id/$1",
    // 在线咨询[answer]搜索页(分页)
    "answer\/search-(.+).html"                                  =>  "answer/search/index/rewrite/$1",
    // 在线咨询[answer]搜索页
    "answer/search.html"                                        =>  "answer/search/index",
    // 在线咨询[answer]TAG页(分页)
    "answer-tag-(\w+)-(\d+).html"                               =>  "answer/tag/index/name/$1/page/$2",
    // 在线咨询[answer]TAG页
    "answer-tag-(\w+).html"                                     =>  "answer/tag/index/name/$1",

    /*-------------------站点[1] 模块[在线咨询 answer] 结束-----------------*/ 



    /*-------------------站点[1] 模块[网络在线课程 video] 开始-----------------*/ 

    // 网络在线课程[video]模块首页
    "video.html"                                                =>  "video/home/index/",
    // 网络在线课程[video]栏目列表(分页)
    "video-list-([a-z0-9]+)-(\d+).html"                         =>  "video/category/index/dir/$1/page/$2",
    // 网络在线课程[video]栏目列表
    "video-list-([a-z0-9]+).html"                               =>  "video/category/index/dir/$1",
    // 网络在线课程[video]模块内容页(分页)
    "video-show-(\d+)-(\d+).html"                               =>  "video/show/index/id/$1/page/$2",
    // 网络在线课程[video]内容页
    "video-show-(\d+).html"                                     =>  "video/show/index/id/$1",
    // 网络在线课程[video]模块扩展页(分页)
    "video-read-(\d+)-(\d+).html"                               =>  "video/extend/index/id/$1/page/$2",
    // 网络在线课程[video]扩展页
    "video-read-(\d+).html"                                     =>  "video/extend/index/id/$1",
    // 网络在线课程[video]搜索页(分页)
    "video\/search-(.+).html"                                   =>  "video/search/index/rewrite/$1",
    // 网络在线课程[video]搜索页
    "video/search.html"                                         =>  "video/search/index",
    // 网络在线课程[video]TAG页(分页)
    "video-tag-(\w+)-(\d+).html"                                =>  "video/tag/index/name/$1/page/$2",
    // 网络在线课程[video]TAG页
    "video-tag-(\w+).html"                                      =>  "video/tag/index/name/$1",

    /*-------------------站点[1] 模块[网络在线课程 video] 结束-----------------*/ 



);

