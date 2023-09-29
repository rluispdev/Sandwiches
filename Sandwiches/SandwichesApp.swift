//
//  SandwichesApp.swift
//  Sandwiches
//
//  Created by Rafael Gonzaga on 28/09/23.
//

import SwiftUI

@main
struct SandwichesApp: App {
    ///32 - Chamos a Classe SandwichStore aqui com um @StateObject
    @StateObject private var store = SandwinchStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
