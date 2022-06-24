//
//  AddBudgetView.swift
//  CoreDataMVVMSwiftUI
//
//  Created by Leandro Alves da Silva on 22/06/22.
//

import SwiftUI

struct AddBudgetView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm: AddBudgetViewModel
    
    init(vm: AddBudgetViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        Form {
            TextField("Nome", text: $vm.title)
            TextField("Total", text: $vm.total)
            
            Button("Salvar") {
                vm.save()
                presentationMode.wrappedValue.dismiss()
            }
            .centerHorizontally()
        }
    }
}

struct AddBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        NavigationView {
            AddBudgetView(vm: AddBudgetViewModel(context: viewContext))
        }
    }
}
