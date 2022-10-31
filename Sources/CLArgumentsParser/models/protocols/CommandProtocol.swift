/// Represents Command Line Command.
public protocol CommandProtocol: ArgumentsHolder, OptionsHolder {
    associatedtype CommandType

    /// A name of the command used in the terminal.
    var name: String { get set }
    /// A type of the command .
    var type: CommandType { get set }
}
