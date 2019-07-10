//
//  BinaryTree.swift
//  LeetCodeTests
//
//  Created by Ray on 2019-07-10.
//  Copyright © 2019 Ray. All rights reserved.
//

import Foundation
import XCTest

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    static func from(_ nums: [Int?]) -> TreeNode? {
        guard nums.count > 1, let first = nums[0] else { return nil }
        let root = TreeNode(first)
        
        var index: Int = 0
        var nodeQueue: [TreeNode?] = [root]
        
        while index < nums.count {
            let current = nodeQueue.removeFirst()
            if index + 1 < nums.count, let val = nums[index + 1] {
                let left = TreeNode(val)
                current?.left = left
                nodeQueue.append(left)
            }
            if index + 2 < nums.count, let val = nums[index + 2] {
                let right = TreeNode(val)
                current?.right = right
                nodeQueue.append(right)
            }
            index += 2
        }
        return root
    }
    
    // recursive creation, not working properly
    /*
    static func from(_ arr: [Int?], root: TreeNode? = nil, index: Int = 0) -> TreeNode? {
        if index < arr.count, let val = arr[index] {
            let node = TreeNode(val)
            node.left = from(arr, root: node.left, index: index * 2 + 1)
            node.right = from(arr, root: node.right, index: index * 2 + 2)
            return node
        }
        return nil
    }
    */
}

class TreeNodeTests: XCTestCase {
    
    func testTreeCreation() {
        let one = TreeNode.from([1, 2, 3, 4, 5, 6])
        XCTAssertTrue(one?.left?.left?.val == 4)
        XCTAssertTrue(one?.right?.right?.val == nil)
    }
}

