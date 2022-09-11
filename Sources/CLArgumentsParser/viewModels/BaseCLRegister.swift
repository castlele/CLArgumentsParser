open class BaseCLRegister<Command: CommandProtocol>: RegistryProtocol {
    public var registeredCommands: [String: Command] = [:]
    public var registeredOptions: [String: Command.Option] = [:]
}