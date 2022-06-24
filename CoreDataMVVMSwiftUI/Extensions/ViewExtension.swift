//
//  ViewExtension.swift
//  CoreDataMVVMSwiftUI
//
//  Created by Leandro Alves da Silva on 23/06/22.
//

import Foundation
import SwiftUI

extension View {
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}
