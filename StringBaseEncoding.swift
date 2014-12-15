//
//  StringBaseEncoding.swift
//  NaturalPark
//
//  Created by Computer on 14/12/12.
//  Copyright (c) 2014 Computer. All rights reserved.
//

import UIKit

class BaseEncoding {
    // MARK: - Base64
    func base64Encode(encodingString: String) -> (String) {
        let _mid = encodingString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        let stringResult = _mid?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        return stringResult!
    }
    
    func base64Decode(decodingString: String) -> (String) {
        let _mid = NSData(base64EncodedString: decodingString, options: NSDataBase64DecodingOptions.allZeros)
        let stringResult = NSString(data: _mid!, encoding: NSUTF8StringEncoding)
        return stringResult!
    }
    
    // MARK: - Urlcode
    func urlEncode(encodingString: String) -> (String) {
        return encodingString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
    }
    
    func urlDecode(decodingString: String) -> (String) {
        return decodingString.stringByRemovingPercentEncoding!
    }
}

