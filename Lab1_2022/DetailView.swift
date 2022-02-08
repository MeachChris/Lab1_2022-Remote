//
//  ContentView.swift
//  Lab1_2022
//
//  Created by ICS 224 on 2022-01-18.
//

import SwiftUI

struct DetailView: View {
    @State private var description = ""
    @State private var favourite = false
    
    
    
    var colour : Color
    var maxCharacters : UInt
   // var inventoryItem : InventoryItem
    @Binding var inventoryItem : InventoryItem
    
    var body: some View {
        VStack {
            
            Image(systemName: inventoryItem.image)
                    .resizable()
                    .background(inventoryItem.favourite ? colour : Color.white)
                        .accessibilityIdentifier("DetailImage")
            
            Toggle(isOn: $inventoryItem.favourite) {
                Text("Favourite")
            }
            .accessibilityIdentifier("FavouriteToggle")
            
            TextEditor(text: Binding(get: {inventoryItem.description}, set: { newValue in
                if newValue.count <= maxCharacters {
                    inventoryItem.description = newValue
                }
            }))
                .accessibilityIdentifier("DetailTextEditor")
            Text("\(inventoryItem.description.count)/\(maxCharacters)")
            .accessibilityIdentifier("DetailText")        }
        .padding(/*@START_MENU_TOKEN@*/.all, 15.0/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
        }
    }
}
    

