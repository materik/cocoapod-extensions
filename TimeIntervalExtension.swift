
import UIKit

public extension TimeInterval {

    func animate(animations: @escaping () -> ()) {
        self.animate(animations: animations, completion: nil)
    }

    func animate(animations: @escaping () -> (), completion: (() -> ())?) {
        UIView.animate(withDuration: self, animations: animations) { _ in
            completion?()
        }
    }

    func asyncAfter(execute: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + self, execute: execute)
    }

}
