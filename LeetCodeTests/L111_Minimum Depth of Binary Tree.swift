//
//  111. Minimum Depth of Binary Tree
//  https://leetcode.com/problems/minimum-depth-of-binary-tree/
//  Easy
//
//  Given a binary tree, find its minimum depth.
//  The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
//
//  Example:
//  Given binary tree [3,9,20,null,null,15,7],
//
//      3
//     / \
//    9  20
//      /  \
//     15   7

//  return its minimum depth = 2.
//

import XCTest

class L111_Minimum_Depth_of_Binary_Tree: XCTestCase {

    // recursive
    func a_minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        if root.left == nil {
            return a_minDepth(root.right) + 1
        }
        if root.right == nil {
            return a_minDepth(root.left) + 1
        }
        return 1 + min(a_minDepth(root.left), a_minDepth(root.right))
    }
    
    // iterative, BFS
    func b_minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var nodeQueue: [TreeNode?] = [root]
        var min = 1
        while !nodeQueue.isEmpty {
            for _ in 0..<nodeQueue.count {
                let node = nodeQueue.removeFirst()
                if node?.left == nil, node?.right == nil {
                    return min
                }
                if let left = node?.left {
                    nodeQueue.append(left)
                }
                
                if let right = node?.right {
                    nodeQueue.append(right)
                }
            }
            min += 1
        }
        return min
    }
    
    func testA1() {
        let tree = TreeNode.from([3, 9, 20, nil, nil, 15, 7])
        let output = a_minDepth(tree)
        XCTAssertTrue(output == 2)
    }

    func testA2() {
        let tree = TreeNode.from([1, 2])
        let output = a_minDepth(tree)
        XCTAssertTrue(output == 2)
    }
    
    func testA3() {
        let tree = TreeNode.from([-9, -3, 2, nil, 4, 4, 0, -6, nil, -5])
        let output = a_minDepth(tree)
        XCTAssertTrue(output == 3)
    }

    func testB1() {
        let tree = TreeNode.from([3, 9, 20, nil, nil, 15, 7])
        let output = b_minDepth(tree)
        XCTAssertTrue(output == 2)
    }
    
    func testB2() {
        let tree = TreeNode.from([1, 2])
        let output = b_minDepth(tree)
        XCTAssertTrue(output == 2)
    }
    
    func testB3() {
        let tree = TreeNode.from([-9, -3, 2, nil, 4, 4, 0, -6, nil, -5])
        let output = b_minDepth(tree)
        XCTAssertTrue(output == 3)
    }
}
