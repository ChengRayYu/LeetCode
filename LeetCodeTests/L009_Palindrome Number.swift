//
// 9. Palindrome Number
// https://leetcode.com/problems/palindrome-number/
//
// Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
//
// Example 1:
//  Input: 121
//  Output: true
//
// Example 2:
//  Input: -121
//  Output: false
//

import XCTest

class L009_Palindrome_Number: XCTestCase {

    // convert to string
    func isPalindromeA(_ x: Int) -> Bool {
        
        if x < 0 {
            return false
        }
        let str = Array(String(x))
        var startIndex: Int = 0
        var endIndex = str.count - 1
        
        while startIndex < endIndex {
            if str[startIndex] != str[endIndex] {
                return false
            }
            startIndex += 1
            endIndex -= 1
        }
        return true
    }
    
    
    // Revert half of the number
    // O(logN)
    
    func isPalindromeB(_ x: Int) -> Bool {
        
        if x < 0 {
            return false
        }
        var copy = x
        var revert = 0
        
        while (copy > revert) {
            revert = revert * 10 + copy % 10
            copy /= 10
        }
        return copy == revert || copy == revert / 10
    }


    func testPalindrome_A_False() {
        let output = isPalindromeA(54321)
        XCTAssertFalse(output)
    }
    
    func testPalindrome_A_True() {
        let output = isPalindromeA(6543456)
        XCTAssertTrue(output)
    }
    
    func testPalindrome_B_False() {
        let output = isPalindromeB(54321)
        XCTAssertFalse(output)
    }
    
    func testPalindrome_B_True() {
        let output = isPalindromeB(6543456)
        XCTAssertTrue(output)
    }

}
