//
//  409. Longest Palindrome
//  https://leetcode.com/problems/longest-palindrome/
//  Easy
//
//  Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that can be built with those letters.
//  This is case sensitive, for example "Aa" is not considered a palindrome here.
//  Note:
//  Assume the length of given string will not exceed 1,010.
//
//  Example:
//  Input: "abccccdd"
//  Output: 7
//
//  Explanation:
//  One longest palindrome that can be built is "dccaccd", whose length is 7.
//

import XCTest

class L409_Longest_Palindrome: XCTestCase {

    func longestPalindrome(_ s: String) -> Int {
        var map: [Character: Int] = [:]
        for char in Array(s) {
            map[char, default: 0] += 1
        }
        
        var hasMidChar: Bool = false
        var pairs: Int = 0
        for entry in map {
            if entry.value % 2 != 0 {
                hasMidChar = true
            }
            pairs += entry.value / 2
        }
        return pairs * 2 + ((hasMidChar) ? 1 : 0)
    }
    
    func testA1() {
        let output = longestPalindrome("abccccdd")
        XCTAssertTrue(output == 7)
    }

}
