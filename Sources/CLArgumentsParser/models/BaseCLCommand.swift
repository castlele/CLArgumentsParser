/// Base implementation of Command Line Command.
public struct BaseCLCommand<Option: OptionType, CommandType>: CommandProtocol {
    public var name: String
    public var type: CommandType
    public var arguments: [String]
    public var argumentsNeeded: (min: Int, max: Int)
    public var options: [Option]
    public let availableOptions: [String: Option]

    public init(name: String, 
                type: CommandType,
                arguments: [String] = [],
                argumentsNeeded: (min: Int, max: Int) = (0, 0),
                options: [Option] = [], 
                availableOptions: [String: Option] = [:]) {

        self.name = name
        self.type = type
        self.arguments = arguments
        self.argumentsNeeded = argumentsNeeded
        self.options = options
        self.availableOptions = availableOptions
    }
}

extension BaseCLCommand: Equatable where CommandType: Equatable {

    public static func ==(lhs: BaseCLCommand, rhs: BaseCLCommand) -> Bool {
        lhs.name == rhs.name
        && lhs.type == rhs.type
        && lhs.arguments == rhs.arguments
        && lhs.options.count == rhs.options.count // TODO: make OptionType conform to Equatable
        && lhs.availableOptions.keys == rhs.availableOptions.keys
    }
}
