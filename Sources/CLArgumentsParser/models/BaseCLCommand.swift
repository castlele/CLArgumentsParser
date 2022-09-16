public struct BaseCLCommand<Option: OptionType>: CommandProtocol {
    public var name: String
    public var arguments: [String]
    public var argumentsNeeded: (min: Int, max: Int)
    public var options: [Option]
    public let availableOptions: [String: Option]

    public init(name: String, 
                arguments: [String] = [],
                argumentsNeeded: (min: Int, max: Int),
                options: [Option] = [], 
                availableOptions: [String: Option]) {

        self.name = name
        self.arguments = arguments
        self.argumentsNeeded = argumentsNeeded
        self.options = options
        self.availableOptions = availableOptions
    }
}
