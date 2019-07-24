//
//  219. Contains Duplicate II
//  https://leetcode.com/problems/contains-duplicate-ii/
//  Easy
//
//  Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the absolute difference between i and j is at most k.
//
//  Example 1:
//  Input: nums = [1,2,3,1], k = 3
//  Output: true
//
//  Example 2:
//  Input: nums = [1,0,1,1], k = 1
//  Output: true
//
//  Example 3:
//  Input: nums = [1,2,3,1,2,3], k = 2
//  Output: false
//

import XCTest

class L219_Contains_Duplicate_II: XCTestCase {

    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        
        var map: [Int: Int] = .init()
        
        for i in 0..<nums.count {
            if let lastIndex = map[nums[i]], i - lastIndex <= k  {
                return true
            }
            map[nums[i]] = i
        }
        return false
    }
    
    func test1() {
        let output = containsNearbyDuplicate([1, 2, 3, 1], 3)
        XCTAssertTrue(output)
    }

    func test2() {
        let output = containsNearbyDuplicate([1, 0, 1, 1], 1)
        XCTAssertTrue(output)
    }

    func test3() {
        let output = containsNearbyDuplicate([1, 2, 3, 1, 2, 3], 2)
        XCTAssertFalse(output)
    }

}
