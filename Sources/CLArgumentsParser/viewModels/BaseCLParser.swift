open class BaseCLParser<RegistryType: RegistryProtocol>: ParserProtocol {

    public var register: RegistryType

    public init(register: RegistryType) {
        self.register = register
    }
}