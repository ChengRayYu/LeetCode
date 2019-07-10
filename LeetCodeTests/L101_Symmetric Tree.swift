//
//  101. Symmetric Tree
//  https://leetcode.com/problems/symmetric-tree/
//  Easy
//
//  Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
//
//  For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
//      1
//     / \
//    2   2
//   / \ / \
//  3  4 4  3
//
//  But the following [1,2,2,null,3,null,3] is not:
//      1
//     / \
//    2   2
//     \   \
//     3    3
//

import XCTest

class L101_Symmetric_Tree: XCTestCase {
    
    // recursive
    func a_isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(treeOne: root, treeTwo: root)
    }
    
    func isMirror(treeOne: TreeNode?, treeTwo: TreeNode?) -> Bool {
        if treeOne == nil, treeTwo == nil { return true }
        guard let t1 = treeOne, let t2 = treeTwo else { return false }
        
        return t1.val == t2.val
            && isMirror(treeOne: t1.left, treeTwo: t2.right)
            && isMirror(treeOne: t1.right, treeTwo: t2.left)
    }

    // iterative
    func b_isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        var queue: [TreeNode?] = [root, root]
        
        while !queue.isEmpty {
            let treeOne = queue.removeFirst()
            let treeTwo = queue.removeFirst()
            
            if treeOne == nil, treeTwo == nil {
                continue
            }
            guard let t1 = treeOne, let t2 = treeTwo, t1.val == t2.val else {
                return false
            }
            queue.append(t1.left)
            queue.append(t2.right)
            queue.append(t1.right)
            queue.append(t2.left)
        }
        return true
    }
    
    func testA1() {
        let tree = TreeNode.from([1, 2, 3, 4, 5, 6])
        let output = a_isSymmetric(tree)
        XCTAssertFalse(output)
    }
    
    func testA2() {
        let tree = TreeNode.from([1, 2, 2, 3, 4, 4, 3])
        let output = a_isSymmetric(tree)
        XCTAssertTrue(output)
    }
    
    func testB1() {
        let tree = TreeNode.from([1, 2, 3, 4, 5, 6])
        let output = b_isSymmetric(tree)
        XCTAssertFalse(output)
    }
    
    func testB2() {
        let tree = TreeNode.from([1, 2, 2, 3, 4, 4, 3])
        let output = b_isSymmetric(tree)
        XCTAssertTrue(output)
    }

}
