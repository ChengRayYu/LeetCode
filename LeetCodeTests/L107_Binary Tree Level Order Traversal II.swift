//
//  107. Binary Tree Level Order Traversal II
//  https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
//  Easy
//
//  Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

//  For example:
//  Given binary tree [3,9,20,null,null,15,7],
//       3
//      / \
//     9  20
//       /  \
//      15   7
//
//  return its bottom-up level order traversal as:
//  [
//   [15,7],
//   [9,20],
//   [3]
//  ]
//

import XCTest

class L107_Binary_Tree_Level_Order_Traversal_II: XCTestCase {

    // iterative by BFS, own solution
    func a_levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var nodeQueue: [TreeNode?] = [root]
        var levelQueue: [Int] = [1]
        var result: [[Int]] = [[root.val]]
        
        while !nodeQueue.isEmpty {
            let node = nodeQueue.removeFirst()
            let level = levelQueue.removeFirst()
            
            if let left = node?.left {
                nodeQueue.append(left)
                levelQueue.append(level + 1)
                
                if level + 1 > result.count {
                    result.insert([left.val], at: 0)
                } else {
                    let index = result.count - (level + 1)
                    var items = result[index]
                    items.append(left.val)
                    result[index] = items
                }
            }
            if let right = node?.right {
                nodeQueue.append(right)
                levelQueue.append(level + 1)

                if level + 1 > result.count {
                    result.insert([right.val], at: 0)
                } else {
                    let index = result.count - (level + 1)
                    var items = result[index]
                    items.append(right.val)
                    result[index] = items
                }
            }
        }
        return result
    }
    
    // iterative
    func b_levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var nodeQueue: [TreeNode?] = [root]
        var result: [[Int]] = []
        
        while !nodeQueue.isEmpty {
            var nodeOfLevel: [Int] = []
            for _ in 0..<nodeQueue.count {
                let node = nodeQueue.removeFirst()
                nodeOfLevel.append(node!.val)

                if let left = node?.left {
                    nodeQueue.append(left)
                }
                if let right = node?.right {
                    nodeQueue.append(right)
                }
            }
            result.insert(nodeOfLevel, at: 0)
        }
        return result
    }

    // recursive
    func c_levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var result: [[Int]] = []
        traverseTree(root, level: 0, result: &result)
        return result
    }
    
    func traverseTree(_ node: TreeNode?, level: Int, result: inout [[Int]]) {
        guard let node = node else { return }
        if level >= result.count {
            result.insert([], at: 0)
        }
        result[result.count - (level + 1)].append(node.val)
        traverseTree(node.left, level: level + 1, result: &result)
        traverseTree(node.right, level: level + 1, result: &result)
    }
    
    func testA() {
        let tree = TreeNode.from([3, 9, 20, nil, nil, 15, 7])
        let output = a_levelOrderBottom(tree)
        XCTAssertTrue(output == [[15, 7], [9, 20], [3]])
    }
    
    func testB() {
        let tree = TreeNode.from([3, 9, 20, nil, nil, 15, 7])
        let output = b_levelOrderBottom(tree)
        XCTAssertTrue(output == [[15, 7], [9, 20], [3]])
    }

    func testC() {
        let tree = TreeNode.from([3, 9, 20, nil, nil, 15, 7])
        let output = c_levelOrderBottom(tree)
        XCTAssertTrue(output == [[15, 7], [9, 20], [3]])
    }

}
