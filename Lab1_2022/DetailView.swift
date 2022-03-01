//
//  ContentView.swift
//  Lab1_2022
//
//  Created by ICS 224 on 2022-01-18.
//

import SwiftUI
import Photos


struct DetailView: View {
    @State private var description = ""
    @State private var favourite = false
    @State var pickerVisible = false
    @State var showCameraAlert = false
    @State var showLibraryAlert = false
    @State var imageSource = UIImagePickerController.SourceType.camera
    
    var colour : Color
    var maxCharacters : UInt
   // var inventoryItem : InventoryItem
    @Binding var inventoryItem : InventoryItem
    
    var body: some View {
        ZStack {
        VStack {
            
            Image(uiImage: inventoryItem.image)
                    .resizable()
                    .background(inventoryItem.favourite ? colour : Color.white)
                        .accessibilityIdentifier("DetailImage").scaledToFit()
                        
                                .gesture(TapGesture(count: 1).onEnded({ value in
                                    PHPhotoLibrary.requestAuthorization({ status in
                                        if status == .authorized {
                                            self.showLibraryAlert = false
                                            self.imageSource = UIImagePickerController.SourceType.photoLibrary
                                            self.pickerVisible.toggle()
                                        } else {
                                            self.showLibraryAlert = true
                                        }
                                    })
                        })).alert(isPresented: $showLibraryAlert) {
                            Alert(title: Text("Alert"), message: Text("Access Library denied"), dismissButton: .default(Text("OK")))
                          }
            
            
            
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
            
        .navigationBarItems(trailing:
                            Button(action: {
                                  AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
                                    if response && UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                                        self.showCameraAlert = false
                                               self.imageSource = UIImagePickerController.SourceType.camera
                                               self.pickerVisible.toggle()
                                             } else {
                                               self.showCameraAlert = true
                                             }
                                           }
                                         }) {
                                           Image(systemName: "camera")
                                         }
                                        .alert(isPresented: $showCameraAlert) {
                                           Alert(title: Text("Error"), message: Text("Camera not available"), dismissButton: .default(Text("OK")))
                                         }
                                       ).padding(/*@START_MENU_TOKEN@*/.all, 15.0/*@END_MENU_TOKEN@*/)
            if pickerVisible {
                ImageView(pickerVisible: $pickerVisible, sourceType: $imageSource, action: { (value) in
                    if let image = value {
                        self.inventoryItem.image = image
                    }
                })
            }
            
            
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
        }
    }
}
    

