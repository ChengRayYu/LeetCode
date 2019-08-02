//
//  283. Move Zeroes
//  https://leetcode.com/problems/move-zeroes/
//  Easy
//
//  Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

//  Example:
//  Input: [0,1,0,3,12]
//  Output: [1,3,12,0,0]
//
//  Note:
//  You must do this in-place without making a copy of the array.
//  Minimize the total number of operations.
//

import XCTest

class L283_Move_Zeroes: XCTestCase {

    func a_moveZeroes(_ nums: inout [Int]) {

        var queue: [Int] = []
        var nonZeroCount = 0
        for num in nums {
            if num != 0 {
                queue.append(num)
                nonZeroCount += 1
            }
        }
        
        for i in 0..<nums.count {
            if i < nonZeroCount {
                nums[i] = queue[i]
            } else {
                nums[i] = 0
            }
        }
    }

    func b_moveZeroes(_ nums: inout [Int]) {
        var lastNonZeroIndex = 0
        
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums[lastNonZeroIndex] = nums[i]
                lastNonZeroIndex += 1
            }
        }
        
        for i in lastNonZeroIndex..<nums.count {
            nums[i] = 0
        }
    }
    
    func testA1() {
        var arr = [0, 1, 0, 3, 12]
        a_moveZeroes(&arr)
        XCTAssertTrue(arr == [1, 3, 12, 0, 0])
    }

    func testB1() {
        var arr = [0, 1, 0, 3, 12]
        b_moveZeroes(&arr)
        XCTAssertTrue(arr == [1, 3, 12, 0, 0])
    }

}
