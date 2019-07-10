//
//  LinkedList.swift
//  LeetCodeTests
//
//  Created by Ray on 2019-07-09.
//  Copyright © 2019 Ray. All rights reserved.
//

import Foundation
import XCTest

class ListNode {
    
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    static func from(_ arr: [Int]) -> ListNode? {
        guard arr.count > 0 else { return nil }
        let head = ListNode(arr[0])
        var tail: ListNode? = head
        
        for i in 1..<arr.count {
            let node = ListNode(arr[i])
            tail?.next = node
            tail = tail?.next
        }
        return head
    }
    
    func values() -> [Int] {
        var result: [Int] = [val]
        var head: ListNode? = self
        while let next = head?.next {
            result.append(next.val)
            head = next
        }
        return result
    }
}

class ListNodeTests: XCTestCase {

    func testListNodeInit() {
        let list = [1, 2, 3]
        let node = ListNode.from(list)
        XCTAssertNotNil(node)
    }
    
    func testListNodeValues() {
        let list = [1, 2, 3]
        let node = ListNode.from(list)
        XCTAssertTrue(list == node?.values())
    }    
}
