//
//  Lab1_2022App.swift
//  Lab1_2022
//
//  Created by ICS 224 on 2022-01-18.
//

import SwiftUI

@main
struct Lab1_2022App: App {
    @Environment(\.scenePhase) var scenePhase
    @StateObject var inventoryItems = InventoryItems()
    var body: some Scene {
        WindowGroup {
            
            MainView().environmentObject(inventoryItems)
        }.onChange(of: scenePhase, perform: {
            phase in
            switch phase {
            case .background:
                inventoryItems.saveObjects()
            default:
        break
            }
        })
        
    }
}
