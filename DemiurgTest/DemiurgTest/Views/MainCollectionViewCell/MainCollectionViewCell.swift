import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    private var viewModel: MainCollectionViewModel?

    @IBOutlet private weak var customContentView: UIView!
    @IBOutlet private weak var mainImage: UIImageView!
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var subLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.mainImage.image = nil
        self.mainLabel.text = nil
        self.subLabel.text = nil
    }
}

// MARK: - Internal Functions

extension MainCollectionViewCell {
    func configure(viewModel: MainCollectionViewModel) {
        self.viewModel = viewModel
        guard let type = self.viewModel?.type else { return }
        self.mainImage.image = type.image
        self.mainLabel.text = type.title
        self.subLabel.text = type.subTitle
    }
}

// MARK: - Private Functions

extension MainCollectionViewCell {
    private func setupUI() {
        self.backgroundColor = .clear
        self.customContentView.backgroundColor = .white
        self.customContentView.layer.cornerRadius = 8
        self.mainLabel.textColor = .black
        self.subLabel.textColor = .black
    }
}
