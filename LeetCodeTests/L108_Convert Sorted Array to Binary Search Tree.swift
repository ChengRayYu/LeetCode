//
//  L108_Convert Sorted Array to Binary Search Tree.swift
//  LeetCodeTests
//
//  Created by Ray on 2019-08-04.
//  Copyright © 2019 Ray. All rights reserved.
//

import XCTest

class L108_Convert_Sorted_Array_to_Binary_Search_Tree: XCTestCase {

    // recursive
    func a_sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else { return nil }
        return arrayToBST(nums: nums, start: 0, end: nums.count - 1)
    }
    
    func arrayToBST(nums: [Int], start: Int, end: Int) -> TreeNode? {
        if start > end { return nil }
        let midIndex = (start + end) / 2
        let mid = TreeNode(nums[midIndex])
        mid.left = arrayToBST(nums: nums, start: start, end: midIndex - 1)
        mid.right = arrayToBST(nums: nums, start: midIndex + 1, end: end)
        return mid
    }
        
    // iterative
    func b_sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return nil
    }

}
