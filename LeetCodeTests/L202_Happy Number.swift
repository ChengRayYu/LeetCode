//
//  202. Happy Number
//  https://leetcode.com/problems/happy-number/
//  Easy
//
//  Write an algorithm to determine if a number is "happy".
//  A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.
//
//  Example:
//  Input: 19
//  Output: true
//  Explanation:
//  1＾2 + 9＾2 = 82
//  8＾2 + 2＾2 = 68
//  6＾2 + 8＾2 = 100
//  1＾2 + 0＾2 + 0^2 = 1
//

import XCTest

class L202_Happy_Number: XCTestCase {

    func isHappy(_ n: Int) -> Bool {
        
        guard n > 0 else { return false }
        var set: Set<Int> = Set<Int>()
        var result = n

        while !set.contains(result) {
            if result == 1 {
                return true
            }
            set.insert(result)
            var num = result
            result = 0
            while num > 0 {
                let i = num % 10
                result += i * i
                num /= 10
            }
        }
        return false
    }
    
    func test1() {
        let output = isHappy(19)
        XCTAssert(output)
    }
    
    func test2() {
        let output = isHappy(2)
        XCTAssertFalse(output)
    }

}
