//
//  104. Maximum Depth of Binary Tree
//  https://leetcode.com/problems/maximum-depth-of-binary-tree/
//  Easy
//
//  Given a binary tree, find its maximum depth.
//  The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
//  Note: A leaf is a node with no children.
//

import XCTest

class L104_Maximum_Depth_of_Binary_Tree: XCTestCase {

    // iterative by DFS
    func a_maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var nodeStack: [TreeNode?] = [root]
        var levelStack: [Int] = [1]
        var maxLevel = 1
        
        while !nodeStack.isEmpty {
            let node = nodeStack.removeLast()
            let level = levelStack.removeLast()
            maxLevel = max(level, maxLevel)
            
            if let right = node?.right {
                nodeStack.append(right)
                levelStack.append(level + 1)
            }
            if let left = node?.left {
                nodeStack.append(left)
                levelStack.append(level + 1)
            }
        }
        return maxLevel
    }
    
    func b_maxDepth(_ root: TreeNode?) -> Int {
    
        guard let root = root else { return 0 }
        var nodeQueue: [TreeNode?] = [root]
        var levelQueue: [Int] = [1]
        var maxLevel = 1
        
        while !nodeQueue.isEmpty {
            let node = nodeQueue.removeFirst()
            let level = levelQueue.removeFirst()
            maxLevel = max(level, maxLevel)
            
            if let left = node?.left {
                nodeQueue.append(left)
                levelQueue.append(level + 1)
            }
            if let right = node?.right {
                nodeQueue.append(right)
                levelQueue.append(level + 1)
            }
        }
        return maxLevel
    }
    
    // recursive
    func c_maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return 1 + Swift.max(c_maxDepth(root.left), c_maxDepth(root.right))
    }

    func testA1() {
        let tree = TreeNode.from([1, 2, 3, 4, 5, 6])
        let depth = a_maxDepth(tree)
        XCTAssertTrue(depth == 3)
    }
    
    func testA2() {
        let tree = TreeNode.from([3, 9, 20, nil, nil, 15, 7, 23, 3, nil, nil, 22])
        let depth = a_maxDepth(tree)
        XCTAssertTrue(depth == 5)
    }

    func testB1() {
        let tree = TreeNode.from([1, 2, 3, 4, 5, 6])
        let depth = b_maxDepth(tree)
        XCTAssertTrue(depth == 3)
    }
    
    func testB2() {
        let tree = TreeNode.from([3, 9, 20, nil, nil, 15, 7, 23, 3, nil, nil, 22])
        let depth = b_maxDepth(tree)
        XCTAssertTrue(depth == 5)
    }
    
    func testC1() {
        let tree = TreeNode.from([1, 2, 3, 4, 5, 6])
        let depth = c_maxDepth(tree)
        XCTAssertTrue(depth == 3)
    }

    func testC2() {
        let tree = TreeNode.from([3, 9, 20, nil, nil, 15, 7, 23, 3, nil, nil, 22])
        let depth = c_maxDepth(tree)
        XCTAssertTrue(depth == 5)
    }

}
