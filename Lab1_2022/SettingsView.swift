//
//  SettingsView.swift
//  Lab1_2022
//
//  Created by ICS 224 on 2022-01-25.
//

import SwiftUI



struct SettingsView: View {
    @Binding var colour: Color
    
    @Binding var maxCharacters: UInt
    
    var body: some View {
        VStack {
            VStack {
                
                ColorPicker("Background", selection: $colour).padding()
               
                
                Stepper(onIncrement:
                            { if (maxCharacters < 300) {
                                maxCharacters += 10 }
                    
                }, onDecrement:
                            { if (maxCharacters > 10) {
                                maxCharacters -= 10}}) {
                    Text("\(maxCharacters)")
               
            }
            
            
            }
         
        }
        
    }
       
}
    


struct SettingsView_Previews: PreviewProvider {
    @State static var colour = Color.yellow
    @State static var maxCharacters : UInt = 150
    static var previews: some View {
        SettingsView(colour: $colour, maxCharacters: $maxCharacters)
        
        
    }
}
