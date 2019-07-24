//
//  L226_Invert Binary Tree.swift
//  Invert a binary tree.

//  Example:
//
//  Input:
//
//       4
//     /   \
//    2     7
//   / \   / \
//  1   3 6   9
//
//  Output:
//       4
//     /   \
//    7     2
//   / \   / \
//  9   6 3   1
//

import XCTest

class L226_Invert_Binary_Tree: XCTestCase {
    
    // iterative, BFS
    func a_invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        var nodeQueue: [TreeNode?] = [root]
        while nodeQueue.count > 0 {
         
            let current = nodeQueue.removeFirst()
            let left = current?.left
            let right = current?.right
            
            current?.left = right
            current?.right = left
            
            if left != nil {
                nodeQueue.append(left)
            }
            if right != nil {
                nodeQueue.append(right)
            }
        }
        return root
    }

    // iterative, DFS
    func b_invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        var nodeStack: [TreeNode?] = [root]
        
        while nodeStack.count > 0 {
            let current = nodeStack.removeLast()
            let left = current?.left
            let right = current?.right
            
            current?.left = right
            current?.right = left

            if right != nil {
                nodeStack.append(right)
            }
            if left != nil {
                nodeStack.append(left)
            }
        }
        return root
    }
    
    // recursive
    func c_invertTree(_ root: TreeNode?) -> TreeNode? {
        
        let left = root?.left
        let right = root?.right
        root?.left = c_invertTree(right)
        root?.right = c_invertTree(left)
        return root
    }
    
    func testA1() {
        let tree = TreeNode.from([4, 2, 7, 1, 3, 6, 9])
        let output = a_invertTree(tree)
        var result = true
        result = (output?.left?.val == 7) && result
        result = (output?.left?.left?.val == 9) && result
        result = (output?.left?.right?.val == 6) && result
        result = (output?.right?.val == 2) && result
        result = (output?.right?.left?.val == 3) && result
        result = (output?.right?.right?.val == 1) && result
        XCTAssertTrue(result)
    }
    
    func testB1() {
        let tree = TreeNode.from([4, 2, 7, 1, 3, 6, 9])
        let output = b_invertTree(tree)
        var result = true
        result = (output?.left?.val == 7) && result
        result = (output?.left?.left?.val == 9) && result
        result = (output?.left?.right?.val == 6) && result
        result = (output?.right?.val == 2) && result
        result = (output?.right?.left?.val == 3) && result
        result = (output?.right?.right?.val == 1) && result
        XCTAssertTrue(result)
    }
    
    func testC1() {
        let tree = TreeNode.from([4, 2, 7, 1, 3, 6, 9])
        let output = c_invertTree(tree)
        var result = true
        result = (output?.left?.val == 7) && result
        result = (output?.left?.left?.val == 9) && result
        result = (output?.left?.right?.val == 6) && result
        result = (output?.right?.val == 2) && result
        result = (output?.right?.left?.val == 3) && result
        result = (output?.right?.right?.val == 1) && result
        XCTAssertTrue(result)
    }

}
