//
//  ContentView.swift
//  CoreDataMVVMSwiftUI
//
//  Created by Leandro Alves da Silva on 22/06/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    
    //Variaval de ambiente do Core Data
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var budgetListMV: BudgetListViewModel
    
    init(vm: BudgetListViewModel) {
        self.budgetListMV = vm
    }
    
    private func deleteBudget(at offsets: IndexSet) {
        offsets.forEach { index in
            let budget = budgetListMV.budgets[index]
            budgetListMV.deleteBudget(budgetId: budget.id)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(budgetListMV.budgets) { budget in
                        Text(budget.title + ", R$ " +  String(budget.total))
                    }.onDelete(perform: deleteBudget)
                }
            }
            .sheet(isPresented: $isPresented, onDismiss: {
            } , content: {
                AddBudgetView(vm: AddBudgetViewModel(context: viewContext))
            })
            
            .navigationTitle("Orçamentos")
            .toolbar {
                Button("Orçamentos") {
                    isPresented = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        ContentView(vm: BudgetListViewModel(context: viewContext))
    }
}
