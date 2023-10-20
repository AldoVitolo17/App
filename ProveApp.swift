//
//  ProveApp.swift
//  Prove
//
//  Created by Aldo Vitolo on 20/10/23.
//

import SwiftUI

class SharedData: ObservableObject {
    @Published var inProgressItems = [String]()
    @Published var completedItems = [String]()
    @Published var isAddingItem = false
    @Published var insertedItem = [String]()
}

@main
struct ProveApp: App {
    
    @StateObject var sharedData = SharedData()
    
    var body: some Scene {
        WindowGroup {
            MenuView().environmentObject(sharedData)
        }
    }
}
