import Foundation

final class MainCollectionViewModel {
    var type: CellType?
    var alive: Bool

    init(type: CellType?, alive: Bool) {
        self.type = type
        self.alive = alive
    }
}
