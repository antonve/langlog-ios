import UIKit

extension UIColor {
    public convenience init(hex rgb: UInt64, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((rgb & 0xff0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00ff00) >> 8) / 255.0,
            blue: CGFloat((rgb & 0x0000ff)) / 255.0,
            alpha: alpha
        )
    }
}

