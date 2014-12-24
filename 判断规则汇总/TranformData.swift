//
//  TranformData.swift
//  NaturalPark
//
//  Created by Computer on 14/12/24.
//  Copyright (c) 2014 Computer. All rights reserved.
//
import UIKit
import Foundation

class TranformData {
    
    /* 三个部分组合 */
    func getThreePart(timePass: Int, dataPass: String, interfacePass: String) -> String {
        let ret:String = "\(timePass)+\(dataPass)+\(interfacePass)"
        return ret
    }
    
    /* 获取三个部分的验证字段 */
    func getThreeAuth(Part: String) -> String {
        return (Part.md5 as NSString).substringWithRange(NSMakeRange(0, 32))
    }
    
    /* 组合新的内容体 */
    func getNewThreePart(timePass: Int, dataPass: String, AuthPass: String) -> String {
        let ret:String = "timestamp=\(timePass)&data=\(dataPass)&auth=\(AuthPass)"
        return ret
    }
    
    /* 给内容增加安全编码 */
    func giveSecurity(Context: String) -> String {
        return Base64EasyControl().StringToBase64(Context)
    }
}