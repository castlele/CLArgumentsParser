/// Base register object.
open class BaseCLRegister<Command: CommandProtocol>: RegistryProtocol {

    public var registeredCommands: [String: Command] = [:]
    public var registeredOptions: [String: Command.Option] = [:]

    public var commandsCount: Int {
        registeredCommands.keys.count
    }

    public var optionsCount: Int {
        registeredOptions.keys.count
    }

    public init() { }
}
