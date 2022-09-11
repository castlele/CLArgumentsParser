public enum CLParserError: Error {
    case invalidArgument(argument: String)
    case invalidUsage(command: String)
}