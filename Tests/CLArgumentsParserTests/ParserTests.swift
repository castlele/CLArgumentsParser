import XCTest
import CLArgumentsParser

final class CLArgumentsParserTests: XCTestCase {

    private typealias CLCommand = BaseCLCommand<CLOption, CLCommandType>
    private typealias CLRegister = BaseCLRegister<CLCommand>

    private struct CLOption: OptionType {
        public static let optName = CLOption(type: .optName)

        public enum CLOptionType {
            case optName
        }

        public var type: CLOptionType
        public var arguments: [String] = []
        public var argumentsNeeded: (min: Int, max: Int) { (0, 1) }

        public var stringValue: String {
            "opt_name"
        }
    }

    private enum CLCommandType {
        case appName, cmdName
    }

    private let registry = CLRegister()
    private lazy var parser = BaseCLParser<CLRegister>(register: registry)

    override func setUp() {
        super.setUp()

        let appCommand = CLCommand(name: "app_name",       
                                   type: .appName,         
                                   arguments: [],
                                   argumentsNeeded: (0, 1),         
                                   options: [],                     
                                   availableOptions: [:])             

        let cmd = CLCommand(name: "cmd_name",       
                            type: .cmdName,         
                            arguments: [],
                            argumentsNeeded: (0, 1),         
                            options: [],                     
                            availableOptions: [CLOption.optName.stringValue: .optName])             

        let option = CLOption.optName

        registry.register(command: appCommand)
        registry.register(command: cmd)
        registry.register(option: option)
    }

    func testParsing() throws {
        let args = [
            "app_name",
            "cmd_name",
            "arg_1",
            "opt_name",
            "arg_2",
        ]

        let cmds = try? parser.parse(args)

        XCTAssert(cmds != nil)
    }
}
