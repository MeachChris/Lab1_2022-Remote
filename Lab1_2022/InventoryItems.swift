import SwiftUI


class InventoryItems: ObservableObject  {
    @Published var entries: [InventoryItem]
     
    init() {
        entries = [InventoryItem]()
        entries.append(InventoryItem(image: "hare", description: "Hare", favourite: true))
        entries.append(InventoryItem(image: "tortoise", description: "Tortoise", favourite: true))
    }
}
