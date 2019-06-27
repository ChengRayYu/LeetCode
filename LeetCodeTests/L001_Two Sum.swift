//
// 1. Two Sum
// https://leetcode.com/problems/two-sum/
//
// Given an array of integers, return indices of the two numbers such that they add up to a specific target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
//

import XCTest

class L001_TwoSum: XCTestCase {

    func a_twoSum(input: [Int], target: Int) -> [Int] {
        guard input.count > 1 else { return [-1, -1] }
        
        for i in 0 ..< input.count {
            for j in i + 1 ..< input.count {
                if input[i] + input[j] == target {
                    return [i, j]
                }
            }
        }
        return [-1, -1]
    }
    
    func b_twoSum(input: [Int], target: Int) -> [Int] {
        guard input.count > 1 else { return [-1, -1] }
        
        let map = input.enumerated().reduce(into: [:]) { (dict, pair) in
            dict[pair.element] = pair.offset
        }
        
        for i in 0 ..< input.count {
            let diff = target - input[i]
            if let j = map[diff], i != j {
                return [i, j]
            }
        }
        return [-1, -1]
    }

    
    func testErrorInput() {
        let a_result = a_twoSum(input: [], target: 4)
        XCTAssertEqual(a_result, [-1, -1])
        
        let b_result = b_twoSum(input: [1], target: 4)
        XCTAssertEqual(b_result, [-1, -1])
    }
    
    func testA() {
        let result = a_twoSum(input: [1, 2, 3], target: 4)
        XCTAssertEqual(result, [0, 2])
    }
    
    func testB() {
        let result = b_twoSum(input: [1, 2, 3], target: 4)
        XCTAssertEqual(result, [0, 2])
    }
}
