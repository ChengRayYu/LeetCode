//
// 14. Longest Common Prefix
// https://leetcode.com/problems/longest-common-prefix/
//
// Write a function to find the longest common prefix string amongst an array of strings.
// If there is no common prefix, return an empty string "".
//
// Example 1:
// Input: ["flower","flow","flight"]
// Output: "fl"

// Example 2:
// Input: ["dog","racecar","car"]
// Output: ""
// Explanation: There is no common prefix among the input strings.
//

import XCTest

class L014_Longest_Common_Prefix: XCTestCase {
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        var strs = strs.map { Array($0) }
        let minLength = strs.map { $0.count }.min() ?? 0
        var result = ""
        
        var charIndex = 0
        while charIndex < minLength {
            let target = strs[0][charIndex]
            
            for i in 1..<strs.count {
                if target != strs[i][charIndex] {
                    return result
                }
            }
            result.append(target)
            charIndex += 1
        }
        return result
    }

    func test1() {
        let output = longestCommonPrefix(["flower","flow","flight"])
        XCTAssertTrue(output == "fl")
    }
    
    func test2() {
        let output = longestCommonPrefix(["dog","racecar","car"])
        XCTAssertTrue(output == "")
    }

}
