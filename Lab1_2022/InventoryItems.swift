import SwiftUI


class InventoryItems: ObservableObject  {
    @Published var entries: [InventoryItem]
     
    init() {
        entries = [InventoryItem]()
        entries.append(InventoryItem(image: "hare", description: "Hare"))
        entries.append(InventoryItem(image: "tortoise", description: "Tortoise"))
    }
}
