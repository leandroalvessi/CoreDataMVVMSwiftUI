//
//  CoreDataMVVMSwiftUIApp.swift
//  CoreDataMVVMSwiftUI
//
//  Created by Leandro Alves da Silva on 22/06/22.
//

import SwiftUI

@main
struct CoreDataMVVMSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {            
            //Injetando o contexto para que esteja disponivel para todas as View
            let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
            ContentView(vm: BudgetListViewModel(context: viewContext))
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
