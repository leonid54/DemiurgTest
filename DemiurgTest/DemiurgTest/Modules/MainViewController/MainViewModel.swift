import UIKit

typealias Closure = (() -> Void)

final class MainViewModel {

    // MARK: - Private Properties
    private var cells: [Bool] = []
    private var aliveCount = 0
    private var deadCount = 0
    private var cellType: CellType?

    // MARK: - Internal Properties
    var cellModels: [MainCollectionViewModel] = []

    var onReloadCollectionHandler: Closure?

    func createCell() {
        let newCellIsAlive: Bool

        if aliveCount >= 3 {
            cellType = .life
            newCellIsAlive = true
            aliveCount = 0
            deadCount = 0
        } else if deadCount >= 3 {
            cellType = .death
            newCellIsAlive = false
            aliveCount = 0
            deadCount = 0
        } else {
            newCellIsAlive = Bool.random()
            cellType = newCellIsAlive ? .live : .dead
            if newCellIsAlive {
                aliveCount += 1
                deadCount = 0
            } else {
                deadCount += 1
                aliveCount = 0
            }
        }

        self.cellModels.append(MainCollectionViewModel(type: cellType, alive: newCellIsAlive))

        self.onReloadCollectionHandler?()
    }
}

private enum Constants {
    static let deadImage = UIImage(named: "deadImage")
    static let deathImage = UIImage(named: "deadImage")
    static let liveImage = UIImage(named: "liveImage")
    static let lifeImage = UIImage(named: "lifeImage")

    static let deadTitle = "Мертвая"
    static let deathTitle = "Жизнь умерла"
    static let liveTitle = "Живая"
    static let lifeTitle = "Жизнь"

    static let deadSubtitle = "или прикидывается"
    static let deathSubtitle = "Кх кх..."
    static let liveSubtitle = "и шевелится!"
    static let lifeSubtitle = "Ку-ку!"
}

enum CellType {
    case dead
    case death
    case live
    case life
}

extension CellType {
    var image: UIImage? {
        switch self {
        case .dead:
            return Constants.deadImage
        case .death:
            return Constants.deathImage
        case .live:
            return Constants.liveImage
        case .life:
            return Constants.lifeImage
        }
    }

    var title: String {
        switch self {
        case .dead:
            return Constants.deadTitle
        case .death:
            return Constants.deathTitle
        case .live:
            return Constants.liveTitle
        case .life:
            return Constants.lifeTitle
        }
    }

    var subTitle: String {
        switch self {
        case .dead:
            return Constants.deadSubtitle
        case .death:
            return Constants.deathSubtitle
        case .live:
            return Constants.liveSubtitle
        case .life:
            return Constants.lifeSubtitle
        }
    }
}
