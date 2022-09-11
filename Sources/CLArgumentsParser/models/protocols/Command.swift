public protocol CommandType {
    var argumentsNeeded: (min: Int, max: Int) { get }
}

public typealias OptionType = StringRepresentable & Hashable

public protocol CommandProtocol {
    associatedtype Option: OptionType

    var name: String { get set }
    var type: CommandType { get set }
    var arguments: [String] { get set }
    var options: [Option] { get set }
    var availableOptions: [String: Option] { get }

    @discardableResult mutating func add(option: Option) -> Bool

    @discardableResult mutating func add(argument: String) -> Bool
}

public extension CommandProtocol {
    @discardableResult
    mutating func add(option: Option) -> Bool {
        if let _ = availableOptions[option.stringValue] {
            options.append(option)
            return true
        }
        return false
    }

    @discardableResult
    mutating func add(argument: String) -> Bool {
        arguments.append(argument)
        return true
    }
}
