//
//  SandwinchStore.swift
//  Sandwiches
//
//  Created by Rafael Gonzaga on 29/09/23.
//

import Foundation

///31 - Criamos uma Classe  e chamos ela na ContentView com um @StateObject, mas mudamos para a @main.
class SandwinchStore: ObservableObject {
    @Published var  sandwiches: [Sandwich]
    
    init(sandwiches: [Sandwich] = []) {
        self.sandwiches = sandwiches
    }
}

let testStore = SandwinchStore(sandwiches: testData)
