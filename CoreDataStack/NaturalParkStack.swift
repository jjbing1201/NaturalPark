//
//  NaturalParkStack.swift
//  NaturalPark
//
//  Created by Junjie Zhao.
//  Copyright (c) 2014 Computer. All rights reserved.
//

import CoreData

class NaturalParkStack {
    var context: NSManagedObjectContext
    let psc: NSPersistentStoreCoordinator
    let model: NSManagedObjectModel
    let store: NSPersistentStore?
    
    func applicationDocumentsDirectory() -> NSURL {
        let fileManager = NSFileManager.defaultManager()
        
        let urls = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask) as [NSURL]
        
        return urls[0]
    }
    
    init() {
        let bundle = NSBundle.mainBundle()
        let modelURL = bundle.URLForResource("NaturalPark", withExtension:"momd")
        
        model = NSManagedObjectModel(contentsOfURL: modelURL!)!
        
        psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        context = NSManagedObjectContext()
        context.persistentStoreCoordinator = psc
        
        let documentsURL = applicationDocumentsDirectory()
        let storeURL = documentsURL.URLByAppendingPathComponent("NaturalPark")
        
        let options = [NSMigratePersistentStoresAutomaticallyOption: true]
        
        var error: NSError? = nil
        store = psc.addPersistentStoreWithType(NSSQLiteStoreType,
            configuration: nil,
            URL: storeURL,
            options: options,
            error: &error)
        
        if (store == nil) {
            println("error adding persistent store: \(error)")
            abort()
        }
    }
    
    func saveContext(){
        var error: NSError? = nil
        if context.hasChanges && !context.save(&error) {
            println("could not save \(error), \(error?.userInfo)")
        }
    }
    
}
