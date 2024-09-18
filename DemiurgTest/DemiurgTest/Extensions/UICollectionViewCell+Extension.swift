import UIKit

extension UICollectionViewCell {
    static var uiNib: UINib{
        get {
            return UINib(nibName: cellIdentifierForReg, bundle:  nil)
        }
    }

    static var cellIdentifierForReg: String{
         get {
             return String(describing: self)
         }
     }
}
