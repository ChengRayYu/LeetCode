//
// 7. Reverse Integer
// https://leetcode.com/problems/reverse-integer/
//
// Given a 32-bit signed integer, reverse digits of an integer.
// Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1].
// For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
//

import XCTest

class L007_Reverse_Integer: XCTestCase {

    // covert to string, reverse, and assemble
    func a_reverse(_ input: Int) -> Int {
        guard checkInRange(input) else { return 0 }
        
        let sign = input > 0 ? 1 : -1
        let str = String(String(input * sign).reversed())
        let output = Int(str) ?? 0
        
        return output * sign
    }
    
    // pop & push
    func b_reverse(_ input: Int) -> Int {
        guard checkInRange(input) else { return 0 }
        
        var inputCopy = input
        var result = 0
        
        while inputCopy != 0 {
            let remain = inputCopy % 10
            inputCopy /= 10
            result = result * 10 + remain
        }
        return result
    }
    
    func checkInRange(_ input: Int) -> Bool {
        return input > Int32.min && input < Int32.max
    }
    
    func testA_1() {
        let output = a_reverse(123)
        XCTAssertEqual(output, 321)
    }
    
    func testA_3() {
        let output = a_reverse(-90300)
        XCTAssertEqual(output, -309)
    }
    
    func testB_1() {
        let output = b_reverse(1534236469)
        XCTAssertEqual(output, 0)
    }
    
    func testB_3() {
        let output = b_reverse(-90300)
        XCTAssertEqual(output, -309)
    }
    
    func testOutOfRange() {
        let output = b_reverse(123123123123123123)
        XCTAssertEqual(output, 0)
    }
}
