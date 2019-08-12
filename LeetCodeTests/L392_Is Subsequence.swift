//
//  392. Is Subsequence
//  https://leetcode.com/problems/is-subsequence/
//  Easy
//
//  Given a string s and a string t, check if s is subsequence of t.
//  You may assume that there is only lower case English letters in both s and t. t is potentially a very long (length ~= 500,000) string, and s is a short string (<=100).
//  A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ace" is a subsequence of "abcde" while "aec" is not).
//
//  Example 1:
//  s = "abc", t = "ahbgdc"
//  Return true.
//
//  Example 2:
//  s = "axc", t = "ahbgdc"
//  Return false.
//
//  Follow up:
//  If there are lots of incoming S, say S1, S2, ... , Sk where k >= 1B, and you want to check one by one to see if T has its subsequence. In this scenario, how would you change your code?
//

import XCTest

class L392_Is_Subsequence: XCTestCase {

    // basic solution
    func isSubsequence(_ s: String, _ t: String) -> Bool {

        guard s.count > 0 else { return true }
        
        let t = Array(t)
        let s = Array(s)
        
        var indexT = 0
        var indexS = 0
        
        while indexT < t.count, indexS < s.count {
            if t[indexT] == s[indexS] {
                indexS += 1
            }
            indexT += 1
        }
        return indexS == s.count
    }

    func test1() {
        let output = isSubsequence("abc", "ahbgdc")
        XCTAssertTrue(output)

    }

    func test2() {
        let output = isSubsequence("axc", "ahbgdc")
        XCTAssertFalse(output)
    }

}
