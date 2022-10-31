import CLArgumentsParser
import XCTest

final class CLArgumentsParserTests: XCTestCase {

    var parser: BaseCLParser<BaseCLRegister<MockCommand>>?
    var registry: BaseCLRegister<MockCommand>?

    override func setUp() {
        super.setUp()

        registry = .init()
        register()

        parser = .init(register: registry!)
    }

    override func tearDown() {
        super.tearDown()

        registry = nil
        parser = nil
    }

    func testValidArgumentsParsing() throws {
        let args = ["main", "help"]
        let args1 = ["main", "1", "help"]
        let args2 = ["main", "1", "2", "help"]
        let args3 = ["main", "1", "2", "help", "main", "help"]
        
        let command = MockCommand(name: "main",
                                  type: .main,
                                  argumentsNeeded: (0, 2),
                                  options: [.help],
                                  availableOptions: ["help": .help])
        let command1 = MockCommand(name: "main",
                                   type: .main,
                                   arguments: ["1", "2"],
                                   argumentsNeeded: (0, 2),
                                   options: [.help],
                                   availableOptions: ["help": .help])

        XCTAssertNoThrow(try parser?.parse(args))
        XCTAssertNoThrow(try parser?.parse(args1))
        XCTAssertNoThrow(try parser?.parse(args2))
        XCTAssertNoThrow(try parser?.parse(args3))

        XCTAssertEqual(try parser?.parse(args), [command])
        XCTAssertEqual(try parser?.parse(args2), [command1])
        XCTAssertEqual(try parser?.parse(args3), [command1, command])
    }

    func testInvalidArgumentsParsing() throws {
    }

    private func register() {
        guard let registry = registry else { return }

        let mainCommand = MockCommand(name: "main",
                                      type: .main,
                                      argumentsNeeded: (0, 2),
                                      availableOptions: ["help": .help])

        let option = MockOption.help

        registry.register(command: mainCommand)
        registry.register(option: option)
    }
}
