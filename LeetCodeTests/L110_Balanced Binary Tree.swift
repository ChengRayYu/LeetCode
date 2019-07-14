//
//  110. Balanced Binary Tree
//  https://leetcode.com/problems/balanced-binary-tree/
//  Easy
//
//  For this problem, a height-balanced binary tree is defined as:
//      a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
//
//  Example 1:
//  Given the following tree [3,9,20,null,null,15,7]:
//
//     3
//    / \
//   9  20
//     /  \
//    15   7
//  Return true.
//
//  Example 2:
//  Given the following tree [1,2,2,3,3,null,null,4,4]:

//        1
//       / \
//      2   2
//     / \
//    3   3
//   / \
//  4   4
//  Return false.
//

import XCTest

class L110_Balanced_Binary_Tree: XCTestCase {
    
    // recursive in recursive
    func a_isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        let leftSubTreeHeight = a_findHeight(ofTree: root.left)
        let rightSubTreeHeight = a_findHeight(ofTree: root.right)
        return abs(leftSubTreeHeight - rightSubTreeHeight) < 2 && a_isBalanced(root.left) && a_isBalanced(root.right)
    }

    // recursive
    func a_findHeight(ofTree tree: TreeNode?) -> Int {
        guard let tree = tree else { return 0 }
        return 1 + max(a_findHeight(ofTree: tree.left), a_findHeight(ofTree: tree.right))
    }
    
    func b_isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return b_findHeight(ofTree: root) != -1
    }
    
    // advanced recursive, return -1 if height diff larger than 1
    // -1 is considered as false flag for the balance of the tree
    func b_findHeight(ofTree tree: TreeNode?) -> Int {
        
        guard let tree = tree else { return 0 }
        
        let leftHeight = b_findHeight(ofTree: tree.left)
        let rightHeight = b_findHeight(ofTree: tree.right)
        
        if leftHeight == -1 || rightHeight == -1 {
            return -1
        }
        if abs(leftHeight - rightHeight) > 1 {
            return -1
        }
        return 1 + max(leftHeight, rightHeight)
        
    }
    
    func testA1() {
        let tree = TreeNode.from([1, 2, 2, 3, 3, nil, nil, 4, 4])
        let output = a_isBalanced(tree)
        XCTAssertFalse(output)
    }
    
    func testA2() {
        let tree = TreeNode.from([3, 9, 20, nil, nil, 15, 7])
        let output = a_isBalanced(tree)
        XCTAssertTrue(output)
    }

    func testA3() {
        let tree = TreeNode.from([1, 2, 2, 3, nil, nil, 3, 4, nil, nil, 4])
        let output = a_isBalanced(tree)
        XCTAssertFalse(output)
    }

    func testB1() {
        let tree = TreeNode.from([1, 2, 2, 3, 3, nil, nil, 4, 4])
        let output = b_isBalanced(tree)
        XCTAssertFalse(output)
    }
    
    func testB2() {
        let tree = TreeNode.from([3, 9, 20, nil, nil, 15, 7])
        let output = b_isBalanced(tree)
        XCTAssertTrue(output)
    }
    
    func testB3() {
        let tree = TreeNode.from([1, 2, 2, 3, nil, nil, 3, 4, nil, nil, 4])
        let output = b_isBalanced(tree)
        XCTAssertFalse(output)
    }

}
