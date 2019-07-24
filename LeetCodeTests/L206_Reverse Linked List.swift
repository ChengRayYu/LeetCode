//
//  206. Reverse Linked List
//  https://leetcode.com/problems/reverse-linked-list/
//  Easy
//
//  Reverse a singly linked list.
//  Example:
//  Input: 1->2->3->4->5->NULL
//  Output: 5->4->3->2->1->NULL
//

import XCTest

class L206_Reverse_Linked_List: XCTestCase {

    // iterative reverse
    func a_reversed(_ node: ListNode?) -> ListNode? {
        var current: ListNode? = node
        var prev: ListNode?
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        return prev
    }
    
    // recursive reverse
    func b_reversed(_ node: ListNode?) -> ListNode? {
        return reverseList(node, to: nil)
    }
    
    func reverseList(_ node: ListNode?, to newHead: ListNode?) -> ListNode? {
        if node == nil {
            return newHead
        }
        let next = node?.next
        node?.next = newHead
        return reverseList(next, to: node)
    }
    
    func testListNodeReverse_i() {
        let list = [1, 2, 3]
        let node = ListNode.from(list)
        let reversed = a_reversed(node)
        XCTAssertTrue(reversed?.values() == [3, 2, 1])
    }
    
    func testListNodeReverse_r() {
        let list = [1, 2, 3]
        let node = ListNode.from(list)
        let reversed = b_reversed(node)
        XCTAssertTrue(reversed?.values() == [3, 2, 1])
    }

}
