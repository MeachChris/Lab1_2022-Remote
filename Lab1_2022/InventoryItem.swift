
import SwiftUI

struct InventoryItem: Identifiable, Codable {
    var id = UUID()
    var image: UIImage {
        get {
               UIImage(data: self.imageAsData) ?? UIImage(systemName: "questionmark")!
           }
           set {
               self.imageAsData = newValue.pngData() ?? UIImage(systemName: "questionmark")!.pngData()!
           }
    }
    var imageAsData: Data
    var description: String
    var favourite : Bool
     
    init(image: String, description: String, favourite: Bool) {
        self.imageAsData = (UIImage(systemName: image) ?? UIImage(systemName: "questionmark")!).pngData()!
        self.description = description
        self.favourite = false
    }
    
    init(image: UIImage, favourite: Bool, description: String) {
        self.imageAsData = image.pngData() ?? UIImage(systemName: "questionmark")!.pngData()!
        self.favourite = false
        self.description = description
    }
    
    
    
}
