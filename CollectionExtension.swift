
public extension Collection where Indices.Iterator.Element == Index {

    typealias IndexDistance = Int

    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }

    var random: Iterator.Element? {
        let n = Int(arc4random_uniform(UInt32(self.count)))
        let index = self.index(self.startIndex, offsetBy: n)
        return self.isEmpty ? nil : self[safe: index]
    }

}

public protocol OptionalType {
    associatedtype W
    var optional: W? { get }
}

extension Optional: OptionalType {
    public typealias W = Wrapped
    public var optional: W? { return self }
}

public extension Collection where Iterator.Element: OptionalType {

    func excludeOptionals() -> [Iterator.Element.W] {
        return self.map { $0.optional }.filter { $0 != nil }.map { $0! }
    }

}

