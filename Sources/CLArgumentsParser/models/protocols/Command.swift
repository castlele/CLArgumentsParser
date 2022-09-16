public protocol CommandProtocol: ArgumentsHolder, OptionsHolder {
    var name: String { get set }
}

public extension CommandProtocol {
}

public protocol OptionType: ArgumentsHolder, StringRepresentable, Hashable {
}

public protocol OptionsHolder {
    associatedtype Option: OptionType

    var options: [Option] { get set }
    var availableOptions: [String: Option] { get }

    @discardableResult mutating func add(option: Option) -> Bool
}

public extension OptionsHolder {
    @discardableResult
    mutating func add(option: Option) -> Bool {
        if let _ = availableOptions[option.stringValue] {
            options.append(option)
            return true
        }
        return false
    }
}

public protocol ArgumentsHolder {
    var arguments: [String] { get set }
    var argumentsNeeded: (min: Int, max: Int) { get }

    @discardableResult mutating func add(argument: String) -> Bool
    func isValid() -> Bool
}

public extension ArgumentsHolder {
    @discardableResult
    mutating func add(argument: String) -> Bool {
        arguments.append(argument)
        return true
    }

    func isValid() -> Bool {
        return argumentsNeeded.min <= arguments.count && argumentsNeeded.max >= arguments.count
    }
}
