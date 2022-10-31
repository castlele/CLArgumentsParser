/// Represents an object, that holds arguments of the command.
public protocol ArgumentsHolder {
    /// Arguments that are stored in the holder right now. The array is empty if there are no arguments.
    var arguments: [String] { get set }
    /// Represents an amount of needed arguments.
    var argumentsNeeded: (min: Int, max: Int) { get }

    /// Stores argument in the holder object. 
    ///
    /// - Parameter argument: An argument to store.
    /// - Returns: If argument can be added returns true, other wise false. In default implementation it always returns true.
    @discardableResult mutating func add(argument: String) -> Bool

    /// Checks if arguments amount is valid. 
    ///
    /// - Returns: true if `arguments.count` + 1 greater than or equal to `argumentsNeeded.min` and less than or equal to `argumentsNeeded.max`, otherwise false
    func isValid() -> Bool
}

public extension ArgumentsHolder {
    @discardableResult
    mutating func add(argument: String) -> Bool {
        arguments.append(argument)
        return true
    }

    func isValid() -> Bool {
        argumentsNeeded.min <= arguments.count && argumentsNeeded.max >= arguments.count
    }
}
