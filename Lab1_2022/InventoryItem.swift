
import SwiftUI

struct InventoryItem: Identifiable {
    let id = UUID()
    var image: String
    var description: String
    var favourite : Bool
     
    init(image: String, description: String, favourite: Bool) {
        self.image = image
        self.description = description
        self.favourite = false
    }
}
