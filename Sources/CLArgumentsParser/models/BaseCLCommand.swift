public struct BaseCLCommand: CommandProtocol {
    public var name: String
    public var type: CommandType
    public var arguments: [String]
    public var options: [BaseCLOption]
}