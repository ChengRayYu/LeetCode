//
//  203. Remove Linked List Elements
//  https://leetcode.com/problems/remove-linked-list-elements/
//  Easy
//
//  Remove all elements from a linked list of integers that have value val.
//
//  Example:
//  Input:  1->2->6->3->4->5->6, val = 6
//  Output: 1->2->3->4->5
//

import XCTest

class L203_Remove_Linked_List_Elements: XCTestCase {

    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        guard head != nil else { return nil }
        let list = ListNode(Int.min)
        list.next = head
        var tail: ListNode? = list
        while let next = tail?.next {            
            if next.val == val {
                tail?.next = next.next
            } else {
                tail = tail?.next
            }
        }
        return list.next
    }

    func test1() {
        let tree = ListNode.from([1, 2, 6, 3, 4, 5, 6])
        let output = removeElements(tree, 6)
        XCTAssertTrue(output?.values() == [1, 2, 3, 4, 5])
    }

    func test2() {
        let tree = ListNode.from([1])
        let output = removeElements(tree, 1)
        XCTAssertTrue(output?.values() ?? [] == [])
    }

}
