//
//  CoreDataStack.swift
//  CompanyAPPStore
//
//  Created by 张海南 on 2018/3/13.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack: NSObject {
    
    static let sharedInstance = CoreDataStack()
    
    let context: NSManagedObjectContext
    private let psc: NSPersistentStoreCoordinator
    private let model: NSManagedObjectModel
    private let store: NSPersistentStore?
    
    private override init() {
        let modelName = "CompanyAPPStore"
        
        let bundle = Bundle.main
        let modelURL = bundle.url(forResource: modelName, withExtension: "momd")
        model = NSManagedObjectModel(contentsOf: modelURL!)!
        
        psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = psc
        
        let documentsURL = self.applicationSupportDirectory
        let storeURL = documentsURL.appendingPathComponent("\(modelName).sqlite")
        let options = [NSInferMappingModelAutomaticallyOption: true, NSMigratePersistentStoresAutomaticallyOption: true]
        do {
            store = try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: options)
        } catch {
            CPLog("Failed to add persistent store: \(error)")
            abort()
        }
    }
    
    func newContext() -> NSManagedObjectContext? {
        var someContext: NSManagedObjectContext? = nil
        
        someContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        someContext?.persistentStoreCoordinator = self.psc
        
        return someContext
    }
    
    private var applicationDocumentsDirectory: URL = {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0]
    }()
    
    private var applicationSupportDirectory: URL = {
        let fileManager = FileManager.default
        let url = try! fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return url
    }()
    
    private func saveContext() {
        do {
            if context.hasChanges {
                try context.save()
            }
        } catch let error as NSError {
            CPLog("Failed to save: \(error)")
            abort()
        }
    }
    
}

