// Kevin Li - 7:44 PM - 7/13/20

import UIKit

fileprivate class BundleId {}

extension UIImage {

    internal convenience init?(named: String) {
        self.init(named: named, in: .module, compatibleWith: nil)
    }

}
