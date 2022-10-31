/// Represents an option of the argument.
/// Usually command line tools uses such options with prefix "-" of "--".
public protocol OptionType: ArgumentsHolder, StringRepresentable, Hashable {
}

/// Represents an object, that stores options.
public protocol OptionsHolder {
    associatedtype Option: OptionType

    /// Options that are stored in the holder right now. The array is emtpy if there are no options.
    var options: [Option] { get set }
    /// All available options for the holder object.
    var availableOptions: [String: Option] { get }

    /// Stores option in the holder object. 
    ///
    /// - Parameter option: An option to store.
    /// - Returns: If option is available (can be gotten from the `availableOptions` dictionary) returns true, otherwise false.
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
