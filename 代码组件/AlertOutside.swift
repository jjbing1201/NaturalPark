//
//  AlertOutside.swift
//  NaturalPark
//
//  Created by Computer on 14/12/12.
//  Copyright (c) 2014 Computer. All rights reserved.
//

import UIKit

class AlertOutSide {

    //MARK: - [LoginViewController] 部分 : 用户登录部分
    /* 用户名密码check全为空alert */
    
    func AllEmpty() -> (UIAlertView) {
        var alertempty = UIAlertView()
        alertempty.title = "用户名和密码两者均不可为空"
        alertempty.message = "用户名和密码两者均不可为空"
        alertempty.addButtonWithTitle("确定")

        return alertempty
    }
    
    /* 用户名为空或者密码为空 */
    func EachEmpty(check: Int) -> (UIAlertView) {
        var alerteach = UIAlertView()
        if check == 1 {
            alerteach.title = "用户名输入不合法"
            alerteach.message = "请重新输入您的用户名"
            alerteach.addButtonWithTitle("确定")
        } else {
            alerteach.title = "用户密码输入不合法"
            alerteach.message = "请重新输入您的密码"
            alerteach.addButtonWithTitle("确定")
        }
        return alerteach
    }
    
    /* 用户请求登陆失败 */
    func RequestLoginFailed() -> (UIAlertView) {
        var alertempty = UIAlertView()
        alertempty.title = "用户请求登陆失败"
        alertempty.message = "请稍候重试"
        alertempty.addButtonWithTitle("确定")

        return alertempty
    }

    /* 本地用户插入失败 */
    func RequestInsertFailed() -> (UIAlertView) {
        var alertempty = UIAlertView()
        alertempty.title = "用户本地信息记录失败"
        alertempty.message = "请稍候重试"
        alertempty.addButtonWithTitle("确定")
        
        return alertempty
    }
    
    /* 本地用户更新失败 */
    func RequestUpdateFailed() -> (UIAlertView) {
        var alertempty = UIAlertView()
        alertempty.title = "用户更新本地信息记录失败"
        alertempty.message = "请稍候重试"
        alertempty.addButtonWithTitle("确定")
        
        return alertempty
    }
}
