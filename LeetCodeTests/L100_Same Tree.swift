//
//  100. Same Tree
//  https://leetcode.com/problems/same-tree/
//  Easy
//
//  Given two binary trees, write a function to check if they are the same or not.
//  Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
//

import XCTest

class L100_Same_Tree: XCTestCase {
    
    // recursive
    func a_isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        if p == nil, q == nil {
            return true
        }
        guard let p = p, let q = q, p.val == q.val else { return false }
        return a_isSameTree(p.left, q.left) && a_isSameTree(p.right, q.right)
    }

    // iterative
    func b_isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil, q == nil {
            return true
        }
        guard let p = p, let q = q, p.val == q.val else {
            return false
        }
    
        var stackP: [TreeNode?] = [p]
        var stackQ: [TreeNode?] = [q]
        
        while !stackP.isEmpty, !stackQ.isEmpty {
            let nodeP = stackP.removeLast()
            let nodeQ = stackQ.removeLast()
            
            guard nodeP?.val == nodeQ?.val else { return false }
            
            if nodeP?.left != nil, nodeQ?.left != nil {
                stackP.append(nodeP?.left)
                stackQ.append(nodeQ?.left)
            } else if nodeP?.left != nil || nodeQ?.left != nil {
                return false
            }
            
            if nodeP?.right != nil, nodeQ?.right != nil {
                stackP.append(nodeP?.right)
                stackQ.append(nodeQ?.right)
            } else if nodeP?.right != nil || nodeQ?.right != nil {
                return false
            }
        }
        return true
    }
    
    func testA1() {
        let one = TreeNode.from([1, 2, 3, 4, 5, 6])
        let two = TreeNode.from([1, 2, 3, 4, 5, 6])
        let output = a_isSameTree(one, two)
        XCTAssertTrue(output)
    }

    func testA2() {
        let one = TreeNode.from([1, 2, 3, 4, 5, 6])
        let two = TreeNode.from([1, 2, nil, 4, 5, 6])
        let output = a_isSameTree(one, two)
        XCTAssertFalse(output)
    }
    
    func testB1() {
        let one = TreeNode.from([1, 2, 3, 4, 5, 6])
        let two = TreeNode.from([1, 2, 3, 4, 5, 6])
        let output = b_isSameTree(one, two)
        XCTAssertTrue(output)
    }
    
    func testB2() {
        let one = TreeNode.from([1, 2, 3, 4, 5, 6])
        let two = TreeNode.from([1, 2, nil, 4, 5, 6])
        let output = b_isSameTree(one, two)
        XCTAssertFalse(output)
    }

}
