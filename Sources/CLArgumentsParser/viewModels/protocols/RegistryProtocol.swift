/// Represents an object, that holds registed commands and options.
public protocol RegistryProtocol: AnyObject {
    associatedtype Command: CommandProtocol

    /// Registered commands.
    var registeredCommands: [String: Command] { get set }
    /// Registered options.
    var registeredOptions: [String: Command.Option] { get set }

    /// Registers command.
    ///
    /// - Parameter command: Command to register.
    func register(command: Command) 
    /// Registers options.
    ///
    /// - Parameter option: Option to register.
    func register(option: Command.Option) 
    /// Gets command by name.
    ///
    /// - Parameter name: Name of the command.
    /// - Returns: Command if it was previously registered.
    func getCommand(_ name: String) -> Command?
    /// Gets option by name.
    ///
    /// - Parameter name: Name of the option.
    /// - Returns: Option if it was previously registered.
    func getOption(_ name: String) -> Command.Option?
}

public extension RegistryProtocol {
    func register(command: Command) {
        registeredCommands[command.name] = command
    }

    func register(option: Command.Option) {
        registeredOptions[option.stringValue] = option
    }

    func getCommand(_ name: String) -> Command? {
        registeredCommands[name]
    }

    func getOption(_ name: String) -> Command.Option? {
        registeredOptions[name]
    }
}
