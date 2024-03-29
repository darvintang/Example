//
//  main.swift
//  Test
//
//  Created by darvin on 2022/9/29.
//  Copyright © 2022 cn.tcoding.dvt. All rights reserved.
//

import Foundation

class Node {
    var value: Int = 0
    var next: Node?
    init(_ value: Int) {
        self.value = value
    }

    init?(_ list: [Int]) {
        if list.isEmpty {
            return nil
        }
        self.value = list.first ?? 0
        var next = self
        for i in 1 ..< list.count {
            let new = Node(list[i])
            next.next = new
            next = new
        }
    }

    func printif() {
        var next: Node? = self
        var link = ""
        repeat {
            link += "\(next?.value ?? 0)"
            next = next?.next
            if next != nil {
                link += "->"
            }
        } while next != nil
        print(link)
    }

    func sort(_ node: Node? = nil) -> Node {
        let previous = Node(Int.min)
        var new: Node? = previous
        var head: Node? = self

        while let newHead = head {
            new = previous
            while new?.next != nil, new?.next?.value ?? 0 < newHead.value {
                new = new?.next
            }
            head = head?.next
            newHead.next = new?.next
            new?.next = newHead
        }

        head = node
        while let newHead = head {
            new = previous
            while new?.next != nil, new?.next?.value ?? 0 < newHead.value {
                new = new?.next
            }
            head = head?.next
            newHead.next = new?.next
            new?.next = newHead
        }
        return previous.next ?? self
    }
}

print("start")
let node1 = Node([1, 3, 54, 31, 53, 68, 51, 33, 26])
let node2 = Node([13, 34, 24, 31, 63, 68, 21, 42, 26])
print("链表1: ")
node1?.printif()
print("链表2: ")
node2?.printif()
print("合并排序后: ")
let node3 = node1?.sort(node2)
node3?.printif()
print("end")
