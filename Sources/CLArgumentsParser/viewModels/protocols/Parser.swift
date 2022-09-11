public protocol ParserProtocol {
    associatedtype RegistryType: RegistryProtocol

    var register: RegistryType { get set }

    func parse(_ args: [String]) throws -> [RegistryType.Command]
}

public extension ParserProtocol {
    func parse(_ args: [String]) throws -> [RegistryType.Command] {
        var commands: [RegistryType.Command] = []
        var index = 0

        while index < args.count {
            if let command = register.getCommand(args[index]) {
                index += 1
                try commands.append(parse(command, fromIndex: &index, args: args))
                
            } else {
                throw CLParserError.invalidArgument(argument: args[index])
            }
        }

        return commands
    }

    private func parse(_ command: RegistryType.Command, fromIndex index: inout Int, args: [String]) throws -> RegistryType.Command {
        var command = command

        while index < args.count, register.getCommand(args[index]) == nil {
            if let option = register.getOption(args[index]) {
                guard command.add(option: option) else {
                    throw CLParserError.optionUseOfOption(option: option.stringValue, command: command.name)
                }
            } else {
                command.add(argument: args[index])
            }

            index += 1
        }

        guard command.type.argumentsNeeded.min >= command.arguments.count,
              command.type.argumentsNeeded.max <= command.arguments.count else {
            throw CLParserError.invalidUsage(command: command.name)
        }

        return command
    }
}
