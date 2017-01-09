
import UIKit

public extension NSMutableAttributedString {

    func add(font: UIFont) -> NSMutableAttributedString {
        self.addAttribute(NSFontAttributeName, value: font, range: fullRange)
        return self
    }

    func add(color: UIColor) -> NSMutableAttributedString {
        self.addAttribute(NSForegroundColorAttributeName, value: color, range: fullRange)
        return self
    }

    func add(letterSpacing: CGFloat) -> NSMutableAttributedString {
        self.addAttribute(NSKernAttributeName, value: letterSpacing, range: fullRange)
        return self
    }

    func addParagraph(alignment: NSTextAlignment = .center,
                      lineSpacing: CGFloat = 5.0) -> NSMutableAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = lineSpacing
        paragraph.alignment = alignment
        self.addAttribute(NSParagraphStyleAttributeName, value: paragraph, range: fullRange)

        return self
    }

    // MARK: Helper

    private var fullRange: NSRange {
        return NSRange(location: 0, length: self.string.length)
    }

}
