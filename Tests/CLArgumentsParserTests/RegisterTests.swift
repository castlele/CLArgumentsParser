import CLArgumentsParser
import XCTest

final class CLRegisterTests: XCTestCase {

    var registry: BaseCLRegister<MockCommand>?

    override func setUp() {
        super.setUp()

        registry = .init()
    }

    override func tearDown() {
        super.tearDown()

        registry = nil
    }

    func testRegiteringCommand() throws {
        let mainCommand = MockCommand(name: "main", type: .main)
        
        registry?.register(command: mainCommand)

        XCTAssertTrue(registry?.commandsCount == 1)
        XCTAssertEqual(registry?.registeredCommands["main"], mainCommand)
    }

    func testRegisteringOption() throws {
        let helpOption = MockOption.help
        
        registry?.register(option: helpOption)

        XCTAssertTrue(registry?.optionsCount == 1)
        XCTAssertEqual(registry?.registeredOptions["help"], helpOption)
    }

    func testGettingCommands() throws {
        let mainCommand = MockCommand(name: "main", type: .main)
        
        registry?.register(command: mainCommand)

        XCTAssertEqual(registry?.getCommand("main"), mainCommand)
    }

    func testGettingOptions() throws {
        let helpOption = MockOption.help
        
        registry?.register(option: helpOption)

        XCTAssertEqual(registry?.getOption("help"), helpOption)
    }
}
