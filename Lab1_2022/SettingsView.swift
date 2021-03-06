//
//  SettingsView.swift
//  Lab1_2022
//
//  Created by ICS 224 on 2022-01-25.
//

import SwiftUI



struct SettingsView: View {
    let incremental : UInt = 10
    let maxch  : UInt = 300
    let minch  : UInt = 10
    @Binding var colour: Color
    
    @Binding var maxCharacters: UInt
    
    var body: some View {
        VStack {
            ColorPicker("Background", selection: Binding(get: {colour}, set: { newValue in
                    colour = newValue
                     UserDefaults.standard.set(color2array(colour: colour), forKey:
                     "colour")
            })
                     
                ).padding()
                .accessibilityIdentifier("BackgroundColorPicker")
            
                Stepper(onIncrement:
                            { if (maxCharacters < maxch) {
                                maxCharacters += incremental
                                UserDefaults.standard.set(maxCharacters, forKey: "maxCharacters")                            }
                        
                }, onDecrement:
                            { if (maxCharacters > minch) {
                                
                                maxCharacters -= incremental
                                UserDefaults.standard.set(maxCharacters, forKey: "maxCharacters")                            }}
                           
                
                ){Text("\(maxCharacters)")}.accessibilityIdentifier("MaxCountStepper")
            
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


func color2array(colour: Color) -> [CGFloat] {
    let uiColor = UIColor(colour)
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var alpha: CGFloat = 0.0
    uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return [red, green, blue, alpha]
}
func array2color(array: [CGFloat]) -> Color {
    return Color(Color.RGBColorSpace.sRGB, red: array[0], green: array[1], blue: array[2], opacity: array[3])
    
}


    /*
    Button("Save", action:{
            UserDefaults.standard.set(maxCharacters, forKey: "maxCharacters")
            UserDefaults.standard.set(color2array(colour: colour), forKey:
            "colour")
    })
     */
    /*
    Button("Load", action:{
        maxCharacters = UserDefaults.standard.object(forKey: "maxCharacters") as? UInt ??
        150
        colour = array2color(array: UserDefaults.standard.object(forKey:
        "colour") as? [CGFloat] ?? color2array(colour:
        Color.yellow))
    })
     */
