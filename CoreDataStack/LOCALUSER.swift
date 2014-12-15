//
//  LOCALUSER.swift
//  NaturalPark
//
//  Created by Computer on 14/12/12.
//  Copyright (c) 2014年 Computer. All rights reserved.
//

import Foundation
import CoreData

class LOCALUSER: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var pass: String

}

/* 对于LOCALUSER的操作封装 */
class LOCALUSER_OPERATOR {
    
    var localuserstore:[LOCALUSER]!
    
    init() {
        
    }
    
    // 检查是否包含本地用户信息
    func selectLocalUser(ViewCoreContext: NSManagedObjectContext) -> (re_sure: Bool, name: String, pass: String) {
        var error:NSError?
        let fetchResult = NSFetchRequest(entityName: "LOCALUSER")
        
        let fetchedResults = ViewCoreContext.executeFetchRequest(fetchResult, error: &error) as [LOCALUSER]?
        if let result = fetchedResults {
            localuserstore = result
            
            if localuserstore.count > 0 {
                let eachuser:LOCALUSER = localuserstore[0] as LOCALUSER
                
                // 填写默认的内容
                return (true, eachuser.name, eachuser.pass)
            }
            return (false, "None", "None")
        }
        return (false, "None", "None")
    }

    // 新增本地用户信息
    func insertLocalUser(ViewCoreContext: NSManagedObjectContext, name: String, pass: String) -> Bool {
        var error:NSError?
        
        let entity_of_user = NSEntityDescription.entityForName("LOCALUSER", inManagedObjectContext: ViewCoreContext)
        let _local_user = LOCALUSER(entity: entity_of_user!, insertIntoManagedObjectContext: ViewCoreContext)
        _local_user.name = name
        _local_user.pass = pass
        
        if !ViewCoreContext.save(&error) {
            println("[无法初始化本地用户信息] \(error?.description)")
            return false
        }
        return true
    }
    
    // 修改本地用户信息
    func updateLocalUser(ViewCoreContext: NSManagedObjectContext, name: String, pass: String) -> Bool {
        var error:NSError?
        
        let fetchResult = NSFetchRequest(entityName: "LOCALUSER")
        let fetchedResults = ViewCoreContext.executeFetchRequest(fetchResult, error: &error) as [LOCALUSER]?
        
        if let result = fetchedResults {
            localuserstore = result
            
            if localuserstore.count > 0 {
                var localuser = localuserstore[0] as LOCALUSER
                localuser.name = name
                localuser.pass = pass
                
                if !ViewCoreContext.save(&error) {
                    println("[无法更新本地用户信息] \(error?.description)")
                    return false
                } else {
                    return true
                }
            }
            return false
        }
        return false
    }
}
