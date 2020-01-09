//
//  414. Third Maximum Number
//  https://leetcode.com/problems/third-maximum-number/
//  Easy
//
//  Given a non-empty array of integers, return the third maximum number in this array. If it does not exist, return the maximum number. The time complexity must be in O(n).
//
//  Example 1:
//  Input: [3, 2, 1]
//  Output: 1
//  Explanation: The third maximum is 1.
//
//  Example 2:
//  Input: [1, 2]
//  Output: 2
//  Explanation: The third maximum does not exist, so the maximum (2) is returned instead.
//
//  Example 3:
//  Input: [2, 2, 3, 1]
//  Output: 1
//  Explanation: Note that the third maximum here means the third maximum distinct number.
//  Both numbers with value 2 are both considered as second maximum.
//

import XCTest

class L414_Third_Maximum_Number: XCTestCase {

    func a_thirdMax(_ nums: [Int]) -> Int {
        
        var set: Set<Int> = Set<Int>()
        for n in nums {
            set.insert(n)
        }
        
        let sorted = set.sorted()
        if sorted.count < 3 {
            return sorted.last ?? 0
        
        } else {
            return sorted[sorted.count - 3]
        }
    }
    
    func b_thirdMax(_ nums: [Int]) -> Int {
        
        var maxes: [Int] = []
        for n in nums {
            if !maxes.contains(n) {
                if maxes.count < 3 {
                    maxes.append(n)
                    maxes.sort()
                    
                } else if n > maxes[0] {
                    maxes[0] = n
                    maxes.sort()
                }
            }
        }
        return (maxes.count == 3) ? maxes[0] : maxes.last ?? 0
    }


    func testA1() {
        let output = a_thirdMax([3, 2, 1])
        XCTAssertTrue(output == 1)
    }

    func testA2() {
        let output = a_thirdMax([2, 2, 3, 1])
        XCTAssertTrue(output == 1)
    }
    
    func testB1() {
        let output = b_thirdMax([3, 2, 1])
        XCTAssertTrue(output == 1)
    }
    
    func testB2() {
        let output = b_thirdMax([2, 2, 3, 1])
        XCTAssertTrue(output == 1)
    }

}
