public protocol RegistryProtocol: AnyObject {
    associatedtype Command: CommandProtocol

    var registeredCommands: [String: Command] { get set }
    var registeredOptions: [String: Command.Option] { get set }

    func register(command: Command) 
    func register(option: Command.Option) 
    func getCommand(_ name: String) -> Command?
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
