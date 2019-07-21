//
//  172. Factorial Trailing Zeroes
//  https://leetcode.com/problems/factorial-trailing-zeroes
//  Easy
//
//  Given an integer n, return the number of trailing zeroes in n!.
//
//  Example 1:
//  Input: 3
//  Output: 0
//  Explanation: 3! = 6, no trailing zero.
//
//  Example 2:
//  Input: 5
//  Output: 1
//  Explanation: 5! = 120, one trailing zero.
//
//  Note: Your solution should be in logarithmic time complexity.
//

import XCTest

class L172_Factorial_Trailing_Zeroes: XCTestCase {

    func trailingZeroes(_ n: Int) -> Int {
        var n = n
        var result = 0
        
        while n > 0 {
            result += n / 5
            n /= 5
        }
        return result
    }

    func test1() {
        let output = trailingZeroes(3)
        XCTAssertTrue(output == 0)
    }

    func test2() {
        let output = trailingZeroes(5)
        XCTAssertTrue(output == 1)
    }

    func test3() {
        let output = trailingZeroes(34)
        XCTAssertTrue(output == 7)
    }
}
