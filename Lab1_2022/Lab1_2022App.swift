//
//  Lab1_2022App.swift
//  Lab1_2022
//
//  Created by ICS 224 on 2022-01-18.
//

import SwiftUI

@main
struct Lab1_2022App: App {
    @StateObject var inventoryItems = InventoryItems()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(inventoryItems)
        }
    }
}
