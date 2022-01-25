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
    var body: some View {
        VStack {
            
                Image(systemName: "ant.circle.fill")
                    .resizable()
                    .background(favourite ? Color.yellow : Color.white)
       
               
            
            Toggle(isOn: $favourite) {
                Text("Favourite")
            }
            TextEditor(text: $description)
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
