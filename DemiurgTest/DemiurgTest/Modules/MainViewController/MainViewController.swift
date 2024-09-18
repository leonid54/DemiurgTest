import UIKit

private enum Constants {
    static let mainTitle = "Клеточное наполнение"
    static let createButtonTitle = "СОТВОРИТЬ"
}

final class MainViewController: UIViewController {
    var viewModel: MainViewModel

    @IBOutlet private weak var customContentView: UIView!
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var createButton: UIButton!
    @IBOutlet private weak var mainCollectionView: UICollectionView!

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupCollectionView()
    }
}

// MARK: - Private Functions

extension MainViewController {
    private func bind() {
        self.viewModel.onReloadCollectionHandler = { [weak self] in
            guard let self = self else { return }
            if self.viewModel.cellModels.count == 1 {
                self.mainCollectionView.reloadData()
            } else {
                let indexes = self.viewModel.cellModels
                    .dropFirst(self.viewModel.cellModels.count - 1)
                    .indices
                    .map { IndexPath(row: $0, section: 0) }
                self.mainCollectionView.insertItems(at: indexes)
            }
        }
    }

    private func setupUI() {
        self.customContentView.setGradient(colors: [UIColor.firstMain, UIColor.secondMain])

        self.mainLabel.text = Constants.mainTitle
        self.mainLabel.textColor = .white

        self.createButton.setTitle(Constants.createButtonTitle, for: .normal)
        self.createButton.setTitleColor(.white, for: .normal)
        self.createButton.layer.cornerRadius = 4
        self.createButton.backgroundColor = UIColor.mainButton
    }

    private func setupCollectionView() {
        self.mainCollectionView.dataSource = self
        self.mainCollectionView.backgroundColor = .clear
        self.mainCollectionView.register(
            MainCollectionViewCell.uiNib,
            forCellWithReuseIdentifier: MainCollectionViewCell.cellIdentifierForReg
        )
        self.mainCollectionView.setContentCompressionResistancePriority(.required, for: .vertical)
        self.mainCollectionView.setContentHuggingPriority(.required, for: .vertical)
    }
}

// MARK: - Actions

extension MainViewController {
    @IBAction private func createButtonAction(_ sender: Any) {
        self.viewModel.createCell()
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.cellModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainCollectionViewCell.cellIdentifierForReg,
            for: indexPath
        ) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(viewModel: self.viewModel.cellModels[indexPath.item])
        return cell
    }
}
