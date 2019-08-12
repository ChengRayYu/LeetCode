//
//  387. First Unique Character in a String
//  https://leetcode.com/problems/first-unique-character-in-a-string/
//  Easy
//
//  Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
//  Note: You may assume the string contain only lowercase letters.
//
//  Examples:
//  s = "leetcode"
//  return 0.
//
//  s = "loveleetcode",
//  return 2.
//

import XCTest

class L387_First_Unique_Character_in_a_String: XCTestCase {

    func firstUniqChar(_ s: String) -> Int {
        
        let chars = Array(s)
        var indexMap: [Character: Int] = [:]

        for i in 0..<chars.count {
            if indexMap[chars[i]] == nil {
                indexMap[chars[i]] = i
            } else {
                indexMap[chars[i]] = -1
            }
        }
        var firstIndex = Int.max
        for entry in indexMap {
            if entry.value != -1 {
                firstIndex = min(firstIndex, entry.value)
            }
        }
        
        return (firstIndex == Int.max) ? -1 : firstIndex
    }

    func test1() {
        let output = firstUniqChar("leetcode")
        XCTAssert(output == 0)
    }

    func test2() {
        let output = firstUniqChar("loveleetcode")
        XCTAssert(output == 2)
    }
}
