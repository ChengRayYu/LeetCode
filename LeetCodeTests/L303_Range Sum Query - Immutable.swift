//
//  303. Range Sum Query - Immutable
//  https://leetcode.com/problems/range-sum-query-immutable/
//  Easy
//
//  Given an integer array nums, find the sum of the elements between indices i and j (i ≤ j), inclusive.
//  Example:
//  Given nums = [-2, 0, 3, -5, 2, -1]
//  sumRange(0, 2) -> 1
//  sumRange(2, 5) -> -1
//  sumRange(0, 5) -> -3
//

import XCTest

class L303_Range_Sum_Query___Immutable: XCTestCase {

    class A_NumArray {
        
        private var nums: [Int]
        init(_ nums: [Int]) {
            self.nums = nums
        }
        
        func sumRange(_ i: Int, _ j: Int) -> Int {
            var sum = 0
            for idx in i...j {
                sum += nums[idx]
            }
            return sum
        }
    }
    
    class B_NumArray {
        
        private var sumArr: [Int]
        init(_ nums: [Int]) {
            sumArr = [Int](repeating: 0, count: nums.count + 1)
            
            for i in 0..<nums.count {
                sumArr[i + 1] = sumArr[i] + nums[i]
            }
        }
        
        func sumRange(_ i: Int, _ j: Int) -> Int {
            return sumArr[j + 1] - sumArr[i]
        }
    }

    func testA1() {
        let numArr = A_NumArray([-2, 0, 3, -5, 2, -1])
        let output = numArr.sumRange(0, 2)
        XCTAssertTrue(output == 1)
    }
    
    func testA2() {
        let numArr = A_NumArray([-2, 0, 3, -5, 2, -1])
        let output = numArr.sumRange(2, 5)
        XCTAssertTrue(output == -1)
    }
    
    func testB1() {
        let numArr = B_NumArray([-2, 0, 3, -5, 2, -1])
        let output = numArr.sumRange(0, 2)
        XCTAssertTrue(output == 1)
    }
    
    func testB2() {
        let numArr = B_NumArray([-2, 0, 3, -5, 2, -1])
        let output = numArr.sumRange(2, 5)
        XCTAssertTrue(output == -1)
    }

}
