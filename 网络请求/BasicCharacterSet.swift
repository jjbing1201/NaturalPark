//
//  BasicCharacterSet.swift
//  NaturalPark
//
//  Created by Computer on 14/12/24.
//  Copyright (c) 2014 Computer. All rights reserved.
//

import UIKit

// MARK: - JSON处理封装
class JsonEasyControl {
    
    /* String to JSON <with normal> */
    func JsonToString(data: NSDictionary) -> NSString {
        let midict = NSJSONSerialization.dataWithJSONObject(data, options: NSJSONWritingOptions.PrettyPrinted, error: nil)
        let easyjson:NSString = NSString(data: midict!, encoding: NSUTF8StringEncoding)!
        return easyjson
    }
    /* String to JSON <with space> */
    func JsonToStringZero(data: NSDictionary) -> NSString {
        let midict = NSJSONSerialization.dataWithJSONObject(data, options: NSJSONWritingOptions.allZeros, error: nil)
        let easyjson:NSString = NSString(data: midict!, encoding: NSUTF8StringEncoding)!
        return easyjson
    }
    /* JSON to String */
    func StringToJson(data: NSString) -> NSDictionary {
        let midata:NSData = CharasetChange().NSStringToNSData(data)
        let easyjsondict = NSJSONSerialization.JSONObjectWithData(midata, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        return easyjsondict
    }
}

// MARK: - Base64处理封装
class Base64EasyControl {
    
    /* String to base64 */
    func StringToBase64(data: String) -> String {
        let _string:NSData = data.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!
        return _string.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.allZeros)
    }
    
    /* base64 to string */
    func Base64ToString(data: String) -> String {
        let _string:NSData = NSData(base64EncodedString: data, options: NSDataBase64DecodingOptions.allZeros)!
        return NSString(data: _string, encoding: NSUTF8StringEncoding)!
    }
}

class UrlEasyControl {
    
    func urlEncode(encodingString: String) -> (String) {
        return encodingString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
    }
    
    func urlDecode(decodingString: String) -> (String) {
        return decodingString.stringByRemovingPercentEncoding!
    }
}

// MARK: - 字符类型转换
class CharasetChange {
    /* 1. NSString to NSData */
    func NSStringToNSData(data: NSString) -> NSData {
        let result:NSData = data.dataUsingEncoding(NSUTF8StringEncoding)!
        return result
    }
}

// MARK: - 日期格式
class TimeFormat {
    
    /* 将 NSDate 转换成为 String, 并且格式是 yyyy-MM-dd HH:mm:ss */
    func dateFormatter(date: NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = NSLocale(localeIdentifier: "zh_cn")
        let dateStr = formatter.stringFromDate(date)
        return dateStr
    }
    
    /* 获取当前时间戳，并且以Int形式返回 */
    func getNowTimestamp() -> Int {
        let now = NSDate().timeIntervalSince1970
        return Int(now)
    }
}