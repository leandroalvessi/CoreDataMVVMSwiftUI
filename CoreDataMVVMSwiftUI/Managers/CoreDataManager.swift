//
//  CoreDataManager.swift
//  CoreDataMVVMSwiftUI
//
//  Created by Leandro Alves da Silva on 22/06/22.
//

import Foundation
import CoreData

//Gerenciador Core Data
class CoreDataManager {
    let persistentStoreContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        persistentStoreContainer = NSPersistentContainer(name: "CoreDataMVVMSwiftUIModel")
        persistentStoreContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Ouve um erro no Core Data \(error)")
            }
        }
    }
}
