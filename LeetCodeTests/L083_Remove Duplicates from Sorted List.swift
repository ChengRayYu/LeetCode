//
//  83. Remove Duplicates from Sorted List
//  https://leetcode.com/problems/remove-duplicates-from-sorted-list/
//  Easy
//
//  Given a sorted linked list, delete all duplicates such that each element appear only once.
//
//  Example 1:
//  Input: 1->1->2
//  Output: 1->2
//
//  Example 2:
//  Input: 1->1->2->3->3
//  Output: 1->2->3
//

import XCTest

class L083_Remove_Duplicates_from_Sorted_List: XCTestCase {
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var node = head
        while let next = node?.next {
            if node?.val == next.val {
                node?.next = next.next
            } else {
                node = next
            }
        }
        return head
    }

    func test1() {
        let list = ListNode.from([1, 1, 2])
        let output = deleteDuplicates(list)?.values()
        XCTAssertTrue(output == [1, 2])
    }
    
    func test2() {
        let list = ListNode.from([1, 1, 1])
        let output = deleteDuplicates(list)?.values()
        XCTAssertTrue(output == [1])
    }

}
