//
//  234. Palindrome Linked List
//  https://leetcode.com/problems/palindrome-linked-list/
//  Easy
//
//  Given a singly linked list, determine if it is a palindrome.
//
//  Example 1:
//  Input: 1->2
//  Output: false
//
//  Example 2:
//  Input: 1->2->2->1
//  Output: true
//

import XCTest

class L234_Palindrome_Linked_List: XCTestCase {

    // stack, space complexity: O(n)
    func a_isPalindrome(_ head: ListNode?) -> Bool {
        
        guard head != nil else { return true }
        var tail: ListNode? = head
        var nodeStack: [ListNode?] = []
        
        while tail != nil {
            nodeStack.append(tail)
            tail = tail?.next
        }
        
        tail = head // reset tail to the beginning of the list
        let length = nodeStack.count / 2
        while nodeStack.count > length, tail != nil {
            let pop = nodeStack.removeLast()
            if pop?.val != tail?.val {
                return false
            }
            tail = tail?.next
        }
        return true
    }
    
    
    // reverse the second half of the original list
    func b_isPalindrome(_ head: ListNode?) -> Bool {
        
        guard head != nil else { return true }
        var head = head
        var fast: ListNode? = head
        var slow: ListNode? = head
        
        while fast != nil, slow != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        var reversed: ListNode? = nil
        while slow != nil {
            let next = slow?.next
            slow?.next = reversed
            reversed = slow
            slow = next
        }
        
        while reversed != nil {
            if head?.val != reversed?.val {
                return false
            }
            head = head?.next
            reversed = reversed?.next
        }
        return true
    }

    func testA1() {
        let list = ListNode.from([1, 2, 2, 1])
        let output = a_isPalindrome(list)
        XCTAssertTrue(output)
    }

    func testA2() {
        let list = ListNode.from([1, 2])
        let output = a_isPalindrome(list)
        XCTAssertFalse(output)
    }
    
    func testB1() {
        let list = ListNode.from([1, 2, 2, 1])
        let output = b_isPalindrome(list)
        XCTAssertTrue(output)
    }
    
    func testB2() {
        let list = ListNode.from([1, 2])
        let output = b_isPalindrome(list)
        XCTAssertFalse(output)
    }


}
