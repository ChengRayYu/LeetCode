//
//  437. Path Sum III
//  https://leetcode.com/problems/path-sum-iii/
//  Easy
//
//  You are given a binary tree in which each node contains an integer value.
//  Find the number of paths that sum to a given value.
//  The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).
//  The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.

//  Example:
//  root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8
//
//           10
//          /  \
//         5   -3
//        / \    \
//       3   2   11
//      / \   \
//     3  -2   1
//
//  Return 3. The paths that sum to 8 are:
//  1.  5 -> 3
//  2.  5 -> 2 -> 1
//  3. -3 -> 11
//

import XCTest

class L437_Path_Sum_III: XCTestCase {

    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        return findSum(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum)
    }
    
    func findSum(_ node: TreeNode?, _ sum: Int) -> Int {
        guard let node = node else { return 0 }
        var result = 0
        if sum - node.val == 0 {
            result += 1
        }
        result += findSum(node.left, sum - node.val)
        result += findSum(node.right, sum - node.val)
        return result
    }

    func test1() {
        let tree = TreeNode.from([10, 5, -3, 3, 2, nil, 11, 3, -2, nil, 1])
        let output = pathSum(tree, 8)
        XCTAssertTrue(output == 3)
    }
    
    func test2() {
        let tree = TreeNode.from([1, nil, 2, nil, 3, nil, 4, nil, 5])
        let output = pathSum(tree, 3)
        XCTAssertTrue(output == 2)
    }

}
