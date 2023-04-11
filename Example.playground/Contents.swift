import Foundation

public class Test {
    // MARK: Lifecycle
    private init() { }

    // MARK: Public
    public static let default1 = Test()

    public static var `default`: Test {
        _default
    }

    // MARK: Private
    private static let _default = Test()
}

Test.default
