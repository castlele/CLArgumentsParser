public struct BaseCLCommand<Option: OptionType>: CommandProtocol {
    public var name: String
    public var type: CommandType
    public var arguments: [String]
    public var options: [Option]
    public let availableOptions: [String: Option]

    public init(name: String, 
                type: CommandType,
                arguments: [String] = [],
                options: [Option] = [], 
                availableOptions: [String: Option]) {

        self.name = name
        self.type = type
        self.arguments = arguments
        self.options = options
        self.availableOptions = availableOptions
    }
}
