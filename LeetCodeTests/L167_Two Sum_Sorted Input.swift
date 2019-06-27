//
//  L167_Two Sum (Sorted Input).swift
//  LeetCodeTests
//
//  Created by Ray on 2019-06-26.
//  Copyright © 2019 Ray. All rights reserved.
//

import XCTest

class L167_Two_Sum_SortedInput: XCTestCase {

    func twoSum(input: [Int], target: Int) -> [Int] {
        
        let sorted = input.sorted()
        var startIndex = 0
        var endIndex = sorted.count - 1
        
        while startIndex < endIndex {
            
            let sum = sorted[startIndex] + sorted[endIndex]
            
            if sum  == target {
                return [startIndex, endIndex]
            } else if sum < target {
                startIndex += 1
            } else {
                endIndex -= 1
            }
        }
        return [-1, -1]
    }
    
    func testA() {
        let result = twoSum(input: [1, 2, 3], target: 3)
        XCTAssertEqual(result, [0, 1])
    }
    
    func testB() {
        let result = twoSum(input: [1, 2, 3, 8, 9, 13, 17, 32, 66], target: 22)
        XCTAssertEqual(result, [4, 5])
    }
}
