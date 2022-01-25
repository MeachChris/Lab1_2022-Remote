//
//  SettingsView.swift
//  Lab1_2022
//
//  Created by ICS 224 on 2022-01-25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var colour: Color
    var body: some View {
        ColorPicker("Background", selection: $colour).padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State static var colour = Color.yellow
    static var previews: some View {
        SettingsView(colour: $colour)
    }
}
