//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Nelson Gonzalez on 2/11/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
//   var entries: [Entry] {
//      return  loadFromPersistentStore()
//    }
    
    
    func saveToPersistentStore(){
        //Save changes to disk
        let moc = CoreDataStack.shared.mainContext
        do {
            try moc.save()//Save the task to the persistent store
        } catch {
            print("Error saving MOC (managed object context): \(error)")
        }
    }
    
//    func loadFromPersistentStore() -> [Entry] {
//        //fetch request. What do we want to fetch from the persitent store?
//        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
//
//        //as MOC. We COULD say what kind of task we want to fetch
//        let moc = CoreDataStack.shared.mainContext
//
//        do {
//            return try moc.fetch(fetchRequest)
//
//        } catch {
//            print("Error fetching the tasks: \(error)")
//            return []
//        }
//    }
    
    func create(title: String, body: String, mood: Mood) {
        
        _ = Entry(title: title, bodyText: body, mood: mood)
      
//        let newEntry = Entry(context: CoreDataStack.shared.mainContext)
//        newEntry.title = title
//        newEntry.bodyText = body
//        newEntry.timestamp = Date()
//        newEntry.identifier = UUID().uuidString
//        newEntry.mood = mood.rawValue
        
        
        saveToPersistentStore()
    }
    
    func update(title: String, body: String, entry: Entry, mood: String){

        entry.title = title
        entry.bodyText = body
        entry.timestamp = Date()
        entry.mood = mood
        
       saveToPersistentStore()
    }
    
    func delete(entry: Entry){
        let moc = CoreDataStack.shared.mainContext
        
            moc.delete(entry)//Remore from moc but not persistent store.
            saveToPersistentStore()

    }
    
   
}
