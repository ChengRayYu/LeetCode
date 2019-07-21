//
//  169. Majority Element
//  https://leetcode.com/problems/majority-element/
//  Easy
//
//  Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
//  You may assume that the array is non-empty and the majority element always exist in the array.
//
//  Example 1:
//  Input: [3,2,3]
//  Output: 3
//
//  Example 2:
//  Input: [2,2,1,1,1,2,2]
//  Output: 2
//

import XCTest

class L169_Majority_Element: XCTestCase {

    // hashmap
    func a_majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return -1 }
        var map: [Int: Int] = [:]
        for num in nums {
            if let count = map[num] {
                map[num] = count + 1
            } else {
                map[num] = 1
            }
            if let val = map[num], val > nums.count / 2 {
                return num
            }
        }
        return -1
    }

    // sorted
    func b_majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return -1 }
        var nums = nums.sorted()
        return nums[nums.count / 2]
    }
    
    // Boyer-Moore Voting Algorithm
    func c_majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return -1 }
        var count: Int = 0
        var candidate: Int? = nil
        
        for num in nums {
            if count == 0 {
                candidate = num
            }
            count += (candidate == num) ? 1 : -1
        }
        guard let cand = candidate else {
            return -1
        }
        return cand
    }

    func testA1() {
        let output = a_majorityElement([2, 2, 1, 1, 1, 2, 2])
        XCTAssert(output == 2)
    }

    func testA2() {
        let output = a_majorityElement([1])
        XCTAssert(output == 1)
    }

    func testB1() {
        let output = b_majorityElement([2, 2, 1, 1, 1, 2, 2])
        XCTAssert(output == 2)
    }
    
    func testB2() {
        let output = b_majorityElement([1])
        XCTAssert(output == 1)
    }

    func testC1() {
        let output = c_majorityElement([2, 2, 1, 1, 1, 2, 2])
        XCTAssert(output == 2)
    }
    
    func testC2() {
        let output = c_majorityElement([1])
        XCTAssert(output == 1)
    }

}
