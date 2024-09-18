import UIKit

private enum Constants {
    static let gradient = "gradient"
    static let gradientBorder = "gradientBorder"
}

extension UIView {
    func setGradient(colors: [UIColor?]) {
        removeGradient()
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        gradient.colors = colors.compactMap { $0?.cgColor }
        gradient.name = Constants.gradient
        self.layer.insertSublayer(gradient, at: 0)
    }

    func removeGradient() {
        self.removeLayer(with: Constants.gradient)
    }

    func removeLayer(with name: String) {
        guard let sublayers = layer.sublayers,
              let layer = sublayers.first(where: { $0.name == name }) else {
            return
        }

        layer.removeFromSuperlayer()
    }
}
