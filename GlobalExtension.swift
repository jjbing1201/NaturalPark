//
//  GlobalExtension.swift
//  NaturalPark
//
//  Created by Computer on 14/12/12.
//  Copyright (c) 2014 Computer. All rights reserved.
//

import UIKit

struct Global {
    let USERNAME_MAX_SIZE = 32  // 最长用户名长度限制
    let PASSWORD_MAX_SIZE = 20  // 最长用户密码限制
    
    /* 基础调用url */
    let FORGET_URL          = "http://www.naturalpark.cn"        // 忘记密码页面跳转web链接
    let ADVERTISMENT_URL    = "http://www.baidu.com"             // 广告推送页面
    let SHOP_URL            = "http://www.baidu.com"             // 商品/商店页面
    
    /* 服务端地址和内容 */
    let SERVER_IP           = "118.194.49.4"
    let SERVER_PORT         = 52997
    
    /* 服务端接口 */
    let INTERFACE_TODOUSER       = "TODOUser"                    // 接口：检测用户是否已经注册，并且将注册用户的信息完整返回
    let INTERFACE_TODOUSERSEARCH = "TODOUserSearch"
}
