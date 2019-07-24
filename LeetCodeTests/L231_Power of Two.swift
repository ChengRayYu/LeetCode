//
//  231. Power of Two
//  Given an integer, write a function to determine if it is a power of two.
//
//  Example 1:
//  Input: 1
//  Output: true
//  Explanation: 2^0 = 1
//
//  Example 2:
//  Input: 16
//  Output: true
//  Explanation: 2^4 = 16
//
//  Example 3:
//  Input: 218
//  Output: false
//

import XCTest

class L231_Power_of_Two: XCTestCase {

    // iterative
    func a_isPowerOfTwo(_ n: Int) -> Bool {
     
        guard n > 0 else { return false }
        var n = n
        while (n % 2) == 0 {
            n /= 2
        }
        return n == 1
    }
    
    // recursive
    func b_isPowerOfTwo(_ n: Int) -> Bool {
        
        guard n > 0 else { return false }
        guard n != 1 else { return true }        
        return (n % 2) == 0 && b_isPowerOfTwo(n / 2)
    }
    
    func testA1() {
        let output = a_isPowerOfTwo(1)
        XCTAssertTrue(output)
    }

    func testA2() {
        let output = a_isPowerOfTwo(16)
        XCTAssertTrue(output)
    }

    func testA3() {
        let output = a_isPowerOfTwo(218)
        XCTAssertFalse(output)
    }
    
    func testA4() {
        let output = a_isPowerOfTwo(16777217)
        XCTAssertFalse(output)
    }

    func testB1() {
        let output = b_isPowerOfTwo(1)
        XCTAssertTrue(output)
    }
    
    func testB2() {
        let output = b_isPowerOfTwo(16)
        XCTAssertTrue(output)
    }
    
    func testB3() {
        let output = b_isPowerOfTwo(218)
        XCTAssertFalse(output)
    }
    
    func testB4() {
        let output = b_isPowerOfTwo(16777217)
        XCTAssertFalse(output)
    }
}
