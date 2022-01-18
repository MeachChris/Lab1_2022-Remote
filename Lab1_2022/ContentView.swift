//
//  ContentView.swift
//  Lab1_2022
//
//  Created by ICS 224 on 2022-01-18.
//

import SwiftUI

struct ContentView: View {
    @State var description = ""
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "ant.circle.fill")
                    .resizable()
               
            }
            TextEditor(text: $description)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
      
        }
    }
}
