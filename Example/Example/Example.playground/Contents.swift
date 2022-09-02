import DVTFoundation
import DVTUIKit
import PlaygroundSupport
import UIKit

print("start")
//
// let view = UIView()
// view.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 1000))
//
// let btn = DVTUIButton(type: .custom)
// btn.setTitle("测试", for: .normal)
// btn.setTitleColor(.red, for: .normal)
// view.addSubview(btn)
// btn.center = view.center
// btn.bounds = CGRect(origin: .zero, size: CGSize(width: 50, height: 20))
//
// PlaygroundPage.current.liveView = view

class Test {
    var name: String {
        get {
            print("get: \(self._name)")
            return self._name
        }
        set {
            self._name = newValue
            print("set: \(self._name)")
        }
    }

    var _name: String = "0"
}

let t = Test()
func test(_ name: inout String) {
    name = "1"
    name = "2"
    name = "3"
    name = "4"
    name = "5"
}

test(&t.name)

print("end")
var list = [123, 123]
list.move(fromOffsets: <#T##IndexSet#>, toOffset: <#T##Int#>)
