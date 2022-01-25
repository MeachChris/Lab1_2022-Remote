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
    var maxCharacters : UInt
    
    var colour : Color
    var body: some View {
        VStack {
            
                Image(systemName: "ant.circle.fill")
                    .resizable()
                    .background(favourite ? colour : Color.white)
            
            Toggle(isOn: $favourite) {
                Text("Favourite")
            }
            TextEditor(text: Binding(get: {description}, set: { newValue in
                if newValue.count <= maxCharacters {
                    description = newValue
                }
            }))
            Text("\(description.count)/\(maxCharacters)")
        }
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
