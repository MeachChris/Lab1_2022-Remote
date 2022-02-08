
import SwiftUI

struct InventoryItem: Identifiable {
    let id = UUID()
    var image: String
    var description: String
     
    init(image: String, description: String) {
        self.image = image
        self.description = description
    }
}
