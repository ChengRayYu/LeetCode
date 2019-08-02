//
//  367. Valid Perfect Square
//  https://leetcode.com/problems/valid-perfect-square/
//  Easy
//
//  Given a positive integer num, write a function which returns True if num is a perfect square else False.
//  Note: Do not use any built-in library function such as sqrt.
//

import XCTest

class L367_Valid_Perfect_Square: XCTestCase {

    // Linear Search
    func a_isPerfectSquare(_ num: Int) -> Bool {
        var root = 1
        while root * root <= num {
            if root * root == num {
                return true
            }
            root += 1
        }
        return false
    }
    
    // Binary Search
    func b_isPerfectSquare(_ num: Int) -> Bool {
        var start = 1
        var end = num
        
        while start <= end {
            let mid = (start + end) / 2
            let square = mid * mid
            
            if square == num {
                return true
            } else if square > num {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        return false
    }

    func testA1() {
        let r = a_isPerfectSquare(16)
        XCTAssertTrue(r)
    }

    func testA2() {
        let r = a_isPerfectSquare(777)
        XCTAssertFalse(r)
    }

    func testB1() {
        let r = b_isPerfectSquare(16)
        XCTAssertTrue(r)
    }
    
    func testB2() {
        let r = b_isPerfectSquare(777)
        XCTAssertFalse(r)
    }
}
