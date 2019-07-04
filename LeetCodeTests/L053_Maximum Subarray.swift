//
//  53. Maximum Subarray
//  https://leetcode.com/problems/maximum-subarray/
//
//  Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

//  Example:
//  Input: [-2,1,-3,4,-1,2,1,-5,4],
//  Output: 6
//  Explanation: [4,-1,2,1] has the largest sum = 6.
//

import XCTest

class L053_Maximum_Subarray: XCTestCase {

    func maxSubArray(_ nums: [Int]) -> Int {
     
        var nums = nums
        var sectionSum: Int = nums[0]
        var max: Int = nums[0]

        for i in 1..<nums.count {
            
            // if nums[i] is bigger than the sum if num[i] and previous sum, reset section and set sectionSum equals nums[i]
            sectionSum = Swift.max(sectionSum + nums[i], nums[i])

            // assign sectionSum to max if bigger
            if sectionSum > max {
                max = sectionSum
            }
        }
        return max
    }
    
    func test1() {
        let output = maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4])
        XCTAssertTrue(output == 6)
    }

}
