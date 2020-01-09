//
//  404. Sum of Left Leaves
//  https://leetcode.com/problems/sum-of-left-leaves/
//  Easy
//
//  Find the sum of all left leaves in a given binary tree.
//  Example:
//     3
//    / \
//   9  20
//     /  \
//    15   7
//  There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.
//

import XCTest

class L404_Sum_of_Left_Leaves: XCTestCase {

    // iterative, DFS
    func a_sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        
        guard root != nil else { return 0 }
        var nodeStack: [TreeNode?] = [root]
        var sum: Int = 0
        
        while !nodeStack.isEmpty {

            let node = nodeStack.removeLast()
            
            if let right = node?.right {
                nodeStack.append(right)
            }
            if let left = node?.left {
                if left.left == nil, left.right == nil {
                    sum += left.val
                } else {
                    nodeStack.append(left)
                }
            }
        }
        return sum
    }
    
    // recursive
    func b_sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }

        var result: Int = 0
        if let left = root?.left {
            if left.left == nil, left.right == nil {
                result += left.val
            }
        }
        return result + b_sumOfLeftLeaves(root?.left) + b_sumOfLeftLeaves(root?.right)
    }
    
    func testA1() {
        let tree = TreeNode.from([3, 9, 20, nil, nil, 15, 7])
        let output = a_sumOfLeftLeaves(tree)
        XCTAssertTrue(output == 24)
    }

    func testA2() {
        let tree = TreeNode.from([1, 2, 2, 3, 3, nil, nil, 4, 4])
        let output = a_sumOfLeftLeaves(tree)
        XCTAssertTrue(output == 4)
    }

    func testB1() {
        let tree = TreeNode.from([3, 9, 20, nil, nil, 15, 7])
        let output = b_sumOfLeftLeaves(tree)
        XCTAssertTrue(output == 24)
    }
    
    func testB2() {
        let tree = TreeNode.from([1, 2, 2, 3, 3, nil, nil, 4, 4])
        let output = b_sumOfLeftLeaves(tree)
        XCTAssertTrue(output == 4)
    }

}
