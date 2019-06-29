//
//  21. Merge Two Sorted Lists
//  https://leetcode.com/problems/merge-two-sorted-lists/
//
//  Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
//
//  Example:
//  Input: 1->2->4, 1->3->4
//  Output: 1->1->2->3->4->4
//

import XCTest

class ListNode {
    
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    init?(from list: [Int]?) {
        guard var l = list, !l.isEmpty else {
            return nil
        }
        self.val = l.removeFirst()
        var current: ListNode? = nil
        
        while l.count > 0 {
            let value = l.removeFirst()
            let node = ListNode(value)

            if self.next == nil {
                current = node
                self.next = current
            } else {
                current?.next = node
            }
        }
    }
    
    func obtainListValues() -> [Int] {
        var result: [Int] = []
        var current: ListNode? = self
        
        while let valule = current?.val {
            result.append(valule)
            current = current?.next
        }
        return result
    }
}

class L021_Merge_Two_Sorted_Lists: XCTestCase {

    // iterative
    func a_mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var l1 = l1
        var l2 = l2
        let head: ListNode? = ListNode(0)
        var temp: ListNode? = head
        while l1 != nil || l2 != nil {
            
            if l1?.val ?? Int.max > l2?.val ?? Int.max {
                temp?.next = l2
                temp = l2
                l2 = l2?.next
            }
            else {
                temp?.next = l1
                temp = l1
                l1 = l1?.next
            }
        }
        return head?.next
    }
    
    // recursive
    func b_mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        
        if l1.val < l2.val {
            l1.next = b_mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = b_mergeTwoLists(l1, l2.next)
            return l2
        }
    }

    func testListNodeInit() {
        let list = [1, 2, 3]
        let node = ListNode(from: list)
        XCTAssertNotNil(node)
    }

    func testListNodeValues() {
        let list = [1, 2, 3]
        let node = ListNode(from: list)
        XCTAssertTrue(list == node!.obtainListValues())
    }
    
    func testA1() {
        let one = ListNode(from: [1, 2, 4])
        let two = ListNode(from: [1, 3, 4])
        let output = a_mergeTwoLists(one, two)
        XCTAssertTrue(output!.obtainListValues() == [1, 1, 2, 3, 4, 4])
    }
    
    func testA2() {
        let one = ListNode(from: [2, 4, 6])
        let two = ListNode(from: [3, 4, 5])
        let output = a_mergeTwoLists(one, two)
        XCTAssertTrue(output!.obtainListValues() == [2, 3, 4, 4, 5, 6])
    }
    
    func testB1() {
        let one = ListNode(from: [1, 2, 4])
        let two = ListNode(from: [1, 3, 4])
        let output = b_mergeTwoLists(one, two)
        XCTAssertTrue(output!.obtainListValues() == [1, 1, 2, 3, 4, 4])
    }
    
    func testB2() {
        let one = ListNode(from: [2, 4, 6])
        let two = ListNode(from: [3, 4, 5])
        let output = b_mergeTwoLists(one, two)
        XCTAssertTrue(output!.obtainListValues() == [2, 3, 4, 4, 5, 6])
    }
}
