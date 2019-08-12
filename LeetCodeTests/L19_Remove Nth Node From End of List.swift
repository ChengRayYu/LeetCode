//
//  19. Remove Nth Node From End of List
//  https://leetcode.com/problems/remove-nth-node-from-end-of-list/
//  Medium
//
//  Given a linked list, remove the n-th node from the end of list and return its head.
//  Example:
//  Given linked list: 1->2->3->4->5, and n = 2.//
//  After removing the second node from the end, the linked list becomes 1->2->3->5.
//
//  Note:
//  Given n will always be valid.
//
//  Follow up:
//  Could you do this in one pass?
//

import XCTest

class L19_Remove_Nth_Node_From_End_of_List: XCTestCase {

    // 2 passes, find length first, then remove
    func a_removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else { return head }
        var temp = head
        var length: Int = 0
        while temp != nil {
            length += 1
            temp = temp?.next
        }

        let dummy: ListNode? = ListNode(0)
        dummy?.next = head
        temp = dummy
        var index = 0
        while temp != nil {
            if index != length - n {
                temp = temp?.next
            } else {
                temp?.next = temp?.next?.next
            }
            index += 1
        }
        return dummy?.next
    }
    
    // 1 pass, two pointer and
    func b_removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        let dummy: ListNode? = ListNode(0)
        dummy?.next = head
        var fast: ListNode? = dummy
        var slow: ListNode? = dummy
        
        for _ in 0...n {
            fast = fast?.next
        }
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        slow?.next = slow?.next?.next
        return dummy?.next
    }

    func testA1() {
        let list = ListNode.from([1, 2, 3, 4, 5])
        let output = a_removeNthFromEnd(list, 2)?.values()
        XCTAssertTrue(output == [1, 2, 3, 5])
    }
    
    func testA2() {
        let list = ListNode.from([1, 2, 3, 4, 5, 6])
        let output = a_removeNthFromEnd(list, 4)?.values()
        XCTAssertTrue(output == [1, 2, 4, 5, 6])
    }

    func testB1() {
        let list = ListNode.from([1, 2, 3, 4, 5])
        let output = b_removeNthFromEnd(list, 2)?.values()
        XCTAssertTrue(output == [1, 2, 3, 5])
    }
    
    func testB2() {
        let list = ListNode.from([1, 2, 3, 4, 5, 6])
        let output = b_removeNthFromEnd(list, 4)?.values()
        XCTAssertTrue(output == [1, 2, 4, 5, 6])
    }

}
