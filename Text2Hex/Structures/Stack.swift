import Foundation



protocol Stackable {
    associatedtype Element
    func peek() -> Element?
    mutating func push(_ element: Element)
    @discardableResult mutating func pop() -> Element?
}

extension Stackable {
    var isEmpty: Bool { peek() == nil }
}


struct Stack<Element>: Stackable where Element: Equatable {
    private var storage = [Element]()
    func peek() -> Element?  {storage.last }
    var count: Int {storage.count}
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        storage.popLast()
    }
    
    
}

extension Stack: Equatable {
    
    static func == (lhs: Stack<Element>, rhs: Stack<Element>) -> Bool {
        lhs.storage == rhs.storage
    }
}

extension Stack: CustomStringConvertible {
        var description: String { "\(storage)" }
}
    
extension Stack: ExpressibleByArrayLiteral {
        init(arrayLiteral elements: Self.Element...) {storage = elements}
}

