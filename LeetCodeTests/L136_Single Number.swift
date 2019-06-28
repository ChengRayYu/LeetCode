//
//  136. Single Number
//  https://leetcode.com/problems/single-number/
//
//  Given a non-empty array of integers, every element appears twice except for one. Find that single one.

//  Note:
//  Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
//

import XCTest

class L136_Single_Number: XCTestCase {

    func a_singleNumber(_ nums: [Int]) -> Int {
        
        var nums = nums
        while nums.count > 1 {

            let target = nums[0]
            let count = nums.count
            for i in 1..<nums.count {
                if target == nums[i] {
                    nums.remove(at: i)
                    nums.remove(at: 0)
                    break
                }
            }
            if count == nums.count {
                return target
            }
        }
        return nums.first ?? Int.min
    }
    
    // stack
    func b_singleNumber(_ nums: [Int]) -> Int {
        
        var stack = Set<Int>()
        
        for i in 0..<nums.count {
            if !stack.contains(nums[i]) {
                stack.insert(nums[i])
            } else {
                stack.remove(nums[i])
            }
        }
        return stack.popFirst() ?? Int.min
    }
    
    func testA1() {
        let output = a_singleNumber([2,2,1])
        XCTAssertTrue(output == 1)
    }

    func testA2() {
        let output = a_singleNumber([4,1,2,1,2])
        XCTAssertTrue(output == 4)
    }
    
    func testB1() {
        let output = b_singleNumber([2,2,1])
        XCTAssertTrue(output == 1)
    }
    
    func testB2() {
        let output = b_singleNumber([4,1,2,1,2])
        XCTAssertTrue(output == 4)
    }
}
