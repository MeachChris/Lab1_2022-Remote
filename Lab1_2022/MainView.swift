//
//  MainView.swift
//  Lab1_2022
//
//  Created by ICS 224 on 2022-01-25.
//

import SwiftUI


struct MainView: View {
    @State private var showSettings = false
    @State var colour = array2color(array: UserDefaults.standard.object(forKey: "colour") as? [CGFloat] ?? color2array(colour: Color.yellow))
    @State var maxCharacters: UInt = UserDefaults.standard.object(forKey: "maxCharacters") as? UInt ??
    150
    @Environment(\.horizontalSizeClass) var sizeClass
    
    
    var body: some View {
        NavigationView() {
            VStack {
                if showSettings {
                    SettingsView(colour: $colour, maxCharacters: $maxCharacters)
                }
                else {
                    //DetailView(maxCharacters: maxCharacters, colour: colour)
                    if sizeClass == .regular {
                        DetailView(maxCharacters: maxCharacters, colour: colour)
                        .frame(width: 320, height: 457, alignment: .center) }
                        else if sizeClass == .compact {
                            DetailView(maxCharacters: maxCharacters, colour: colour)
                        
                    }
                }
            }
            .navigationBarItems(trailing: Button(action: { showSettings.toggle()},
                label: { Image( systemName: showSettings ? "house" : "gear")
                
            }
            
            )
                                    .accessibilityIdentifier("NavigationButton")
                                )
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
    
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPad (9th generation)", "iPod touch (7th generation)"], id: \.self) { deviceName in
            MainView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
}
