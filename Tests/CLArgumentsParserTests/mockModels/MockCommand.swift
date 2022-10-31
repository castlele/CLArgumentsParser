import CLArgumentsParser

typealias MockCommand = BaseCLCommand<MockOption, MockCommandType>

enum MockCommandType: Equatable {
    case main
}
