//
//  112. Path Sum
//  https://leetcode.com/problems/path-sum/
//  Easy
//
//  Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.
//  Note: A leaf is a node with no children.
//
//  Example:
//  Given the below binary tree and sum = 22,
//        5
//       / \
//      4   8
//     /   / \
//    11  13  4
//   /  \      \
//  7    2      1
//

import XCTest

class L112_Path_Sum: XCTestCase {

    // iterative, BFS
    func a_hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        var nodeQueue: [TreeNode?] = [root]
        var remainQueue: [Int] = [sum - root.val]
        while !nodeQueue.isEmpty {
            for _ in 0..<nodeQueue.count {
                let node = nodeQueue.removeFirst()
                let remain = remainQueue.removeFirst()
                
                if node?.left == nil, node?.right == nil, remain == 0 {
                    return true
                }
                if let left = node?.left {
                    nodeQueue.append(left)
                    remainQueue.append(remain - left.val)
                }
                if let right = node?.right {
                    nodeQueue.append(right)
                    remainQueue.append(remain - right.val)
                }
            }
        }
        return false
    }
    
    func b_hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        if root.left == nil, root.right == nil {
            return sum - root.val == 0
        }
        return b_hasPathSum(root.left, sum - root.val) || b_hasPathSum(root.right, sum - root.val)
    }
    
    func testA1() {
        let tree = TreeNode.from([5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, 1])
        let output = a_hasPathSum(tree, 22)
        XCTAssertTrue(output)
    }
    
    func testA2() {
        let tree = TreeNode.from([1, 2])
        let output = a_hasPathSum(tree, 1)
        XCTAssertFalse(output)
    }

    func testB1() {
        let tree = TreeNode.from([5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, 1])
        let output = b_hasPathSum(tree, 22)
        XCTAssertTrue(output)
    }
    
    func testB2() {
        let tree = TreeNode.from([1, 2])
        let output = b_hasPathSum(tree, 1)
        XCTAssertFalse(output)
    }

}
