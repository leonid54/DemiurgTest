import UIKit

private enum Constants {
    static let mainTitle = "Клеточное наполнение"
    static let createButtonTitle = "сотворить"
}

final class MainViewController: UIViewController {

    @IBOutlet private weak var customContentView: UIView!
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var createButton: UIButton!
    @IBOutlet private weak var mainCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupCollectionView()
    }
}

// MARK: - Private Functions

extension MainViewController {
    private func setupUI() {
        self.customContentView.setGradient(colors: [UIColor.firstMain, UIColor.secondMain])

        self.mainLabel.text = Constants.mainTitle
        self.mainLabel.textColor = .white
        self.mainLabel.font 

        self.createButton.setTitle(Constants.createButtonTitle, for: .normal)
        self.createButton.setTitleColor(.white, for: .normal)
        self.createButton.layer.cornerRadius = 4
        self.createButton.backgroundColor = UIColor.mainButton
    }

    private func setupCollectionView() {

    }
}

// MARK: - Actions

extension MainViewController {
    @IBAction private func createButtonAction(_ sender: Any) {
    }

}
