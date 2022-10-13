import UIKit

var greeting = "Hello, playground"

final class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?

    public init(nodeData: Int) {
        self.data = nodeData
    }
}

final class SinglyLinkedList {
    var head: SinglyLinkedListNode?
    var tail: SinglyLinkedListNode?

    public init() {}

    public func insertNode(nodeData: Int) {
        self.insertNode(node: SinglyLinkedListNode(nodeData: nodeData))
    }

    private func insertNode(node: SinglyLinkedListNode) {
        if let tail = tail {
            tail.next = node
        } else {
            head = node
        }

        tail = node
    }
}

extension SinglyLinkedListNode {
    
    func dataPrint() {
        var currentNode = self
        
        while true {
            print(currentNode.data)
            
            if let next = currentNode.next {
                currentNode = next
            } else {
                break
            }
        }
    }
}

func reverse(llist: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    // Write your code here
    var tail: SinglyLinkedListNode? = nil
    var head = llist?.next
    
    tail = llist
    tail?.next = nil
    
    while true {
        if let next = head?.next {
            head?.next = tail
            tail = head
            head = next
        } else {
            head?.next = tail
            break
        }
    }
    
    head?.dataPrint()
    return head
}

func getHeadForReverse() -> SinglyLinkedListNode {
    let head = SinglyLinkedListNode(nodeData: 1)
    let node1 = SinglyLinkedListNode(nodeData: 2)
    let node2 = SinglyLinkedListNode(nodeData: 3)
    let node3 = SinglyLinkedListNode(nodeData: 4)
    let node4 = SinglyLinkedListNode(nodeData: 5)
    let node5 = SinglyLinkedListNode(nodeData: 6)
    head.next = node1
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    return head
}

reverse(llist: getHeadForReverse())

func deleteNode(llist: SinglyLinkedListNode?, position: Int) -> SinglyLinkedListNode? {
    // Write your code here
    if position == 0 {
        return llist?.next
    }
    
    var index = 0
    var currentNode = llist
    
    while position != index + 1 {
        if let next = currentNode?.next {
            currentNode = next
            index += 1
        } else {
            break
        }
    }
    
    if position == index + 1 {
        let deleteNode = currentNode?.next
        let linkedNode = deleteNode?.next
        currentNode?.next = linkedNode
        llist?.dataPrint()
        return llist
    } else {
        return nil
    }
}

func getHeadForDeleteNode() -> SinglyLinkedListNode {
    let head = SinglyLinkedListNode(nodeData: 8)
    let node1 = SinglyLinkedListNode(nodeData: 20)
    let node2 = SinglyLinkedListNode(nodeData: 6)
    let node3 = SinglyLinkedListNode(nodeData: 2)
    let node4 = SinglyLinkedListNode(nodeData: 19)
    let node5 = SinglyLinkedListNode(nodeData: 7)
    head.next = node1
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    return head
}

deleteNode(llist: getHeadForDeleteNode(), position: 3)

func insertNodeAtPosition(llist: SinglyLinkedListNode?, data: Int, position: Int) -> SinglyLinkedListNode? {
    // Write your code here
    
    var index = 0
    var currentNode = llist
    while position != index + 1 {
        currentNode = currentNode?.next
        index += 1
    }
    
    let nextNode = currentNode?.next
    let newNode = SinglyLinkedListNode(nodeData: data)
    newNode.next = nextNode
    currentNode?.next = newNode
    
    llist?.dataPrint()
    return llist
}

func getHeadForInsertNodeAtPosition() -> SinglyLinkedListNode {
    let head = SinglyLinkedListNode(nodeData: 3)
    let node1 = SinglyLinkedListNode(nodeData: 16)
    let node2 = SinglyLinkedListNode(nodeData: 13)
    let node3 = SinglyLinkedListNode(nodeData: 7)
    let node4 = SinglyLinkedListNode(nodeData: 1)
    let node5 = SinglyLinkedListNode(nodeData: 2)
    head.next = node1
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    return head
}

insertNodeAtPosition(llist: getHeadForInsertNodeAtPosition(), data: 1, position: 2)

func printLinkedList(head: SinglyLinkedListNode?) -> Void {
    if let next = head?.next {
        print(next.data)
        printLinkedList(head: next)
    }
}

func getHeadForPrintLinkedList() -> SinglyLinkedListNode {
    let head = SinglyLinkedListNode(nodeData: 2)
    let node1 = SinglyLinkedListNode(nodeData: 16)
    let node2 = SinglyLinkedListNode(nodeData: 13)
    head.next = node1
    node1.next = node2
    return head
}

printLinkedList(head: getHeadForPrintLinkedList())
