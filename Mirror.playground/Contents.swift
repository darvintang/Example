//
//  sourcecode.swift
//

import UIKit

protocol MirrorValue {
    var value: Any? { get }
}

extension MirrorValue {
    var value: Any? {
        return self
    }

    func foo() {
        // foo
    }
}

switch foo {
    case bar: break
    case baz: break
}

let h = """
    1dasdas
    dasdasda
    dasda
    sd
    as
    das
    d
    asd
    as
    d
    """

// MARK: -
extension NSObject: MirrorValue {
    var value: Any? {
        var dict: [String: Any] = [:]
        Mirror(reflecting: self).children.forEach { child in
            if let key = child.label {
                if let value = child.value as? MirrorValue {
                    dict[key] = value.value
                } else {
                    dict[key] = child.value
                }
            }
        }
        dict.sorted(by: { $0.key < $1.key })
        return dict
    }
}

if case let .foo(bar, baz) = quux {
    // inner foo
}

(let foo, let bar) = baz()

public extension T{
    func text(){ }
}

class T: NSObject {
    var h: Int32 = 123
    var a = "123"
    var c: String?
}

class B: NSObject {
    var t = T()
    var list = [T(), T()]

    var dict = ["b123": T(), "a123123": 31231] as [String: Any]
}

extension Array: MirrorValue {
    var value: Any? {
        self.compactMap { e -> Any? in
            if let v = e as? MirrorValue {
                return v.value
            } else {
                return e
            }
        }
    }
}

extension Dictionary: MirrorValue {
    var value: Any? {
        self.compactMap { (key: Hashable, value: Value) -> [String: Any?] in
            if let v = value as? MirrorValue {
                return ["\(key)": v.value]
            }
            return ["\(key)": value]
        }
    }
}

if let value = B().value, let data = try? JSONSerialization.data(withJSONObject: value, options: .fragmentsAllowed)
{
    print(String(data: data, encoding: .utf8) ?? "")
}
