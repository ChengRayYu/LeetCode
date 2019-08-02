//
//  242. Valid Anagram
//  https://leetcode.com/problems/valid-anagram/
//  Easy
//
//  Given two strings s and t , write a function to determine if t is an anagram of s.
//  Example 1:
//  Input: s = "anagram", t = "nagaram"
//  Output: true

//  Example 2:
//  Input: s = "rat", t = "car"
//  Output: false
//

import XCTest

class L242_Valid_Anagram: XCTestCase {

    func a_isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        let s = s.sorted()
        let t = t.sorted()
        return s == t
    }

    func b_isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        let s = Array(s)
        let t = Array(t)
        var map: [Character: Int] = [:]
        
        for i in 0..<s.count {
            if let count = map[s[i]] {
                map[s[i]] = count + 1
            } else {
                map[s[i]] = 1
            }
        }
        
        for i in 0..<t.count {
            if let count = map[t[i]] {
                map[t[i]] = count - 1
            } else {
                map[t[i]] = 1
            }
        }
        
        for num in map.values {
            if num != 0 {
                return false
            }
        }
        return true
    }

    func testA1() {
        let output = a_isAnagram("anagram", "nagaram")
        XCTAssertTrue(output)
    }
    
    func testA2() {
        let output = a_isAnagram("rat", "car")
        XCTAssertFalse(output)
    }
    
    func testB1() {
        let output = b_isAnagram("anagram", "nagaram")
        XCTAssertTrue(output)
    }
    
    func testB2() {
        let output = b_isAnagram("rat", "car")
        XCTAssertFalse(output)
    }

}
