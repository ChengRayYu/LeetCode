//
//  263. Ugly Number
//
//  LeetCodeTests
//
//  Write a program to check whether a given number is an ugly number.
//  Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.
//
//  Example 1:
//  Input: 6
//  Output: true
//  Explanation: 6 = 2 × 3
//
//  Example 2:
//  Input: 8
//  Output: true
//  Explanation: 8 = 2 × 2 × 2
//
//  Example 3:
//  Input: 14
//  Output: false
//  Explanation: 14 is not ugly since it includes another prime factor 7.
//

import XCTest

class L263_Ugly_Number: XCTestCase {

    func isUgly(_ num: Int) -> Bool {
        guard num > 0 else { return false }
        var num = num
        while num % 2 == 0 {
            num /= 2
        }
        while num % 3 == 0 {
            num /= 3
        }
        while num % 5 == 0 {
            num /= 5
        }
        return num == 1
    }

    func test1() {
        let output = isUgly(6)
        XCTAssertTrue(output)
    }
    
    func test2() {
        let output = isUgly(8)
        XCTAssertTrue(output)
    }

    func test3() {
        let output = isUgly(14)
        XCTAssertFalse(output)
    }
}
