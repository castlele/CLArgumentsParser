// TODO: move enum from protocols
public enum CLParserError: Error {
    case invalidArgument(argument: String)
    case invalidUsage(command: String)
    case invalidUsage(option: String)
    case invalidUseOfOption(option: String, command: String)
}
