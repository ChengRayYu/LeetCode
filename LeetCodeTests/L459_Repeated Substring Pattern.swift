//
//  459. Repeated Substring Pattern
//  https://leetcode.com/problems/repeated-substring-pattern/
//
//  Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only and its length will not exceed 10000.
//
//  Example 1:
//  Input: "abab"
//  Output: True
//
//  Example 2:
//  Input: "aba"
//  Output: False
//

import XCTest

class L459_Repeated_Substring_Pattern: XCTestCase {

    func a_repeatedSubstringPattern(_ s: String) -> Bool {
        
        guard s.count > 1 else {
            return false
        }
        
        for i in 1...(s.count / 2) {
            guard s.count % i == 0 else {
                continue
            }
            let endIdx = s.index(s.startIndex, offsetBy: i)
            let pattern = s[s.startIndex..<endIdx]
            
            var repeatingAnchor = 0
            var result = true
            while repeatingAnchor < s.count {
                
                let start = s.index(s.startIndex, offsetBy: repeatingAnchor)
                let end = s.index(s.startIndex, offsetBy: repeatingAnchor + i)
                let target = s[start..<end]
                if pattern != target {
                    result = false
                    break
                } else {
                    repeatingAnchor += i
                }
            }
            if result {
                return true
            }
        }
        return false
    }
    
    func b_repeatedSubstringPattern(_ s: String) -> Bool {
        let duplicate = "\(s)\(s)"
        let start = duplicate.index(duplicate.startIndex, offsetBy: 1)
        let end = duplicate.index(duplicate.endIndex, offsetBy: -1)
        let temp = duplicate[start..<end]
        return temp.contains(s)
    }
    
    func testA1() {
        let output = a_repeatedSubstringPattern("abab")
        XCTAssert(output == true)
    }
    
    func testA2() {
        let output = a_repeatedSubstringPattern("aba")
        XCTAssert(output == false)
    }
    
    func testA3() {
        let output = a_repeatedSubstringPattern("abcabcabcabc")
        XCTAssert(output == true)
    }
    
    func testA4() {
        let output = a_repeatedSubstringPattern("a")
        XCTAssert(output == false)
    }
    
    func testA5() {
        let output = a_repeatedSubstringPattern("abaababaab")
        XCTAssert(output == true)
    }
    
    
    func testB1() {
        let output = b_repeatedSubstringPattern("abab")
        XCTAssert(output == true)
    }
    
    func testB2() {
        let output = b_repeatedSubstringPattern("aba")
        XCTAssert(output == false)
    }
    
    func testB3() {
        let output = b_repeatedSubstringPattern("abcabcabcabc")
        XCTAssert(output == true)
    }

    func testB4() {
        let output = b_repeatedSubstringPattern("a")
        XCTAssert(output == false)
    }

    func testB5() {
        let output = b_repeatedSubstringPattern("wctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwlwctgtwmxnupycfgcuqunublmoiitncklefszbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofws")
        XCTAssert(output == false)
    }

}
