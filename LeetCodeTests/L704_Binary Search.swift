//
//  704. Binary Search
//  https://leetcode.com/problems/binary-search/
//
//  Given a sorted (in ascending order) integer array nums of n elements and a target value, write a function to search target in nums.
//  If target exists, then return its index, otherwise return -1.
//

import XCTest

class L704_Binary_Search: XCTestCase {

    func search(_ nums: [Int], _ target: Int) -> Int {
        
        var startIndex = 0
        var endIndex = nums.count - 1
        
        while startIndex <= endIndex {
         
            let midIndex = startIndex + (endIndex - startIndex) / 2
            let mid = nums[midIndex]
            
            if mid == target {
                return midIndex

            } else {
                if target > mid {
                    startIndex = midIndex + 1
                } else {
                    endIndex = midIndex - 1
                }
            }
        }
        return -1
    }

    func test1() {
        let output = search([-1,0,3,5,9,12], 9)
        XCTAssertTrue(output == 4)
    }
    
    func test2() {
        
        let output = search([-1,0,3,5,9,12], 2)
        XCTAssertTrue(output == -1)
    }
    
    func test3() {
        let output = search([5], 5)
        XCTAssertTrue(output == 0)
    }
}
