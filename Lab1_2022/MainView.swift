//
//  MainView.swift
//  Lab1_2022
//
//  Created by ICS 224 on 2022-01-25.
//

import SwiftUI


struct MainView: View {
    @State private var showSettings = false
    @State var colour = Color.yellow
    var body: some View {
        NavigationView() {
            VStack {
                if showSettings {
                    SettingsView(colour: $colour)
                }
                else {
                    DetailView(colour: colour)
                }
            }
            .navigationBarItems(trailing: Button(action: { showSettings.toggle()},
                label: { Image( systemName: showSettings ? "house" : "gear")
                
            }
            
            )
                                )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
}
