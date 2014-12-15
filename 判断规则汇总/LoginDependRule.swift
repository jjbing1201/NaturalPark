//
//  LoginDependRule.swift
//  NaturalPark
//
//  Created by Computer on 14/12/12.
//  Copyright (c) 2014 Computer. All rights reserved.
//

import UIKit

class LoginDependRule {
    
    // 用户名判断规则 -> 总长度判断
    func RuleCheckUsername(username: String) -> Bool {
        if countElements(username) <= Global().USERNAME_MAX_SIZE && countElements(username) != 0 {
            
            return true
        } else {
            return false
        }
    }
    
    // 用户密码判断 -> 总长度判断
    func RuleCheckPassword(password: String) -> Bool {
        if countElements(password) <= Global().PASSWORD_MAX_SIZE && countElements(password) != 0 {
            return true
        } else {
            return false
        }
    }
    
}
