//
//  58. Length of Last Word
//  https://leetcode.com/problems/length-of-last-word/
//  Easy
//
//  Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
//  If the last word does not exist, return 0.
//

import XCTest

class L058_Length_of_Last_Word: XCTestCase {

    func a_lengthOfLastWord(_ s: String) -> Int {
     
        let comps = s.split(separator: " ")
        guard comps.count > 0 else {
            return 0
        }
        return comps.last!.count
    }
    
    func b_lengthOfLastWord(_ s: String) -> Int {
        
        guard s.count > 0 else {
            return 0
        }
        var s = Array(s)
        for i in (0..<s.count).reversed() {
            if s[i] == " " {
                return s.count - 1 - i
            }
        }
        return s.count
    }

    func testA1() {
        let output = a_lengthOfLastWord("Hello World")
        XCTAssertTrue(output == 5)
    }
    
    func testA2() {
        let output = a_lengthOfLastWord("a")
        XCTAssertTrue(output == 1)
    }

    func testB1() {
        let output = b_lengthOfLastWord("Hello World")
        XCTAssertTrue(output == 5)
    }
    
    func testB2() {
        let output = b_lengthOfLastWord("a")
        XCTAssertTrue(output == 1)
    }
}
