public struct BaseCLCommand<Option: OptionType>: CommandProtocol {
    public var name: String
    public var type: CommandType
    public var arguments: [String]
    public var options: [Option]
}
