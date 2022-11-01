//
//  main.swift
//  Test
//
//  Created by darvin on 2022/9/29.
//  Copyright © 2022 cn.tcoding.dvt. All rights reserved.
//

import DVTFoundation
import Foundation

print("start: ")

class Body: NSObject {
    var height: Decimal = 160.1
    var weight = 47.0
    var isMan = true
}

class T: NSObject {
    var name: String? = "张三"
    var age: Int = 19
    var body = Body()
    var text: Bool?
}

let i: Int? = 123
let j: String? = "321"
let t = T()

let dict = ["k1": 123, "k2": "123", "k4": j, "k3": i, "k5": t] as [String: Any]
print(1, dict)

let td = dict.dvt.childs.sorted(by: { $0.key < $1.key }).map({ [$0.key: $0.value] })
print(2, td.dvtJson.string ?? "")

if let value = T().dvtJson.string {
    print("key=\(value)")
}

print(dict.dvtJson.string ?? "")
