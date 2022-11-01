import DVTFoundation
import DVTUIKit
import PlaygroundSupport
import UIKit

print("start: ", Date().dvt.string(of: "yyyy-MM-dd HH:mm:ss SSS"))

func test() {
    DispatchQueue.main.asyncAfter(deadline: .now()) {
        print("A")
    }
    DispatchQueue.main.async {
        print("B")
    }
    DispatchQueue.global().async {
        print("C")
    }
    print("D")
}

test()

print("end: ", Date().dvt.string(of: "yyyy-MM-dd HH:mm:ss SSS"))
//RunLoop.main.run()
