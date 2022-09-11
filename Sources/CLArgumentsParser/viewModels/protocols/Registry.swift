public protocol RegistryProtocol {
    associatedtype Command: CommandProtocol

    var registeredCommands: [String: Command] { get set }
    var registeredOptions: [String: Command.Option] { get set }

    mutating func register(command: Command) 
    mutating func register(option: Command.Option) 
    func getCommand(_ name: String) -> Command?
    func getOption(_ name: String) -> Command.Option?
}

public extension RegistryProtocol {
    mutating func register(command: Command) {
        registeredCommands[command.name] = command
    }

    mutating func register(option: Command.Option) {
        registeredOptions[option.stringValue] = option
    }

    func getCommand(_ name: String) -> Command? {
        registeredCommands[name]
    }

    func getOption(_ name: String) -> Command.Option? {
        registeredOptions[name]
    }
}
