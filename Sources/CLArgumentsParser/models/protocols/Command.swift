public protocol CommandType {
    var argumentsNeeded: Int { get }
}

public typealias OptionType = StringRepresentable & Hashable

public protocol CommandProtocol {
    associatedtype Option: OptionType

    var name: String { get set }
    var type: CommandType { get set }
    var arguments: [String] { get set }
    var options: [Option] { get set }

    mutating func add(option: Option)
    mutating func add(argument: String)
}

public extension CommandProtocol {
    mutating func add(option: Option) {
        options.append(option)
    }

    mutating func add(argument: String) {
        arguments.append(argument)
    }
}