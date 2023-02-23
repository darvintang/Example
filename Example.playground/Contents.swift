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
        var previous = Node(Int.min)

        var new: Node? = previous
        var head: Node? = self
        while let newHead = head {
            var newNext = newHead.next
            new = previous
            while newNext?.next != nil, new?.next?.value ?? 0 < head?.value {
            }
        }
        return previous.next ?? self
    }
}

print("start")

let node = Node([1, 3, 54, 31, 53, 68, 51, 33, 26])

if let newNode = Node([2, 6, 54, 31, 53, 68, 51, 33, 26]) {
    node?.sort(newNode).printif()
}

print("end")
