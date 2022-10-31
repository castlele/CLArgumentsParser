import CLArgumentsParser

struct MockOption: OptionType {

    static let help = MockOption(type: .help)

    enum MockOptionType: String {
        case help

        var argumentsNeeded: (min: Int, max: Int) {
            switch self {
                default:
                    return (min: 0, max: 0)
            }
        }
    }
    
    var type: MockOptionType
    var arguments: [String] = []
    var argumentsNeeded: (min: Int, max: Int) { 
        type.argumentsNeeded
    }
    var stringValue: String {
        type.rawValue
    }
}
