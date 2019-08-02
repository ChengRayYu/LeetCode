//
// 1. Two Sum
// https://leetcode.com/problems/two-sum/
//
// Given an array of integers, return indices of the two numbers such that they add up to a specific target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
//

import XCTest

class L001_TwoSum: XCTestCase {

    func a_twoSum(nums: [Int], target: Int) -> [Int] {
        guard nums.count > 1 else { return [-1, -1] }
        
        for i in 0 ..< nums.count {
            for j in i + 1 ..< nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return [-1, -1]
    }
    
    func b_twoSum(nums: [Int], target: Int) -> [Int] {
        guard nums.count > 1 else { return [-1, -1] }
        
        let map = nums.enumerated().reduce(into: [:]) { (dict, pair) in
            dict[pair.element] = pair.offset
        }
        
        for i in 0 ..< nums.count {
            let diff = target - nums[i]
            if let j = map[diff], i != j {
                return [i, j]
            }
        }
        return [-1, -1]
    }
    
    func c_twoSum(nums: [Int], target: Int) -> [Int] {
        guard nums.count > 1 else { return [-1, -1] }
        
        let pairs = nums
            .enumerated()
            .map({ item -> (value: Int, index: Int) in
                return (item.element, item.offset)
        
            })
            .sorted { $0.value < $1.value }
        
        var startIndex = 0
        var endIndex = nums.count - 1
        
        while startIndex < endIndex {
            let sum = pairs[startIndex].value + pairs[endIndex].value
            if sum == target {
                return [pairs[startIndex].index, pairs[endIndex].index]
            } else if sum > target {
                endIndex -= 1
            } else if sum < target {
                startIndex += 1
            }
        }
        return [-1, -1]
    }
    
    func testErrorInput() {
        let a_result = a_twoSum(nums: [], target: 4)
        XCTAssertEqual(a_result, [-1, -1])
        
        let b_result = b_twoSum(nums: [1], target: 4)
        XCTAssertEqual(b_result, [-1, -1])
    }
    
    func testA() {
        let result = a_twoSum(nums: [1, 2, 3], target: 4)
        XCTAssertEqual(result, [0, 2])
    }
    
    func testB() {
        let result = b_twoSum(nums: [1, 2, 3], target: 4)
        XCTAssertEqual(result, [0, 2])
    }
    
    func testC() {
        let result = c_twoSum(nums: [3, 2, 4], target: 6)
        XCTAssertEqual(result, [1, 2])
    }
}
