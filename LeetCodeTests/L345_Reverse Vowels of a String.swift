//
//  345. Reverse Vowels of a String
//  https://leetcode.com/problems/reverse-vowels-of-a-string/
//  Easy
//
//  Write a function that takes a string as input and reverse only the vowels of a string.
//  Example 1:
//  Input: "hello"
//  Output: "holle"
//
//  Example 2:
//  Input: "leetcode"
//  Output: "leotcede"
//  Note:
//  The vowels does not include the letter "y".
//

import XCTest

class L345_Reverse_Vowels_of_a_String: XCTestCase {

    func reverseVowels(_ s: String) -> String {
        var chars = Array(s)
        let vowelsSet: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var startIndex = 0
        var endIndex = chars.count - 1
        
        while startIndex < endIndex {
            let isStartCharVowel = vowelsSet.contains(chars[startIndex])
            let isEndCharVowel = vowelsSet.contains(chars[endIndex])
            if isStartCharVowel, isEndCharVowel {
                chars.swapAt(startIndex, endIndex)
                startIndex += 1
                endIndex -= 1
                continue
            }
            if !isStartCharVowel {
                startIndex += 1
            }
            if !isEndCharVowel {
                endIndex -= 1
            }
        }
        return String(chars)
    }

    func test1() {
        let output = reverseVowels("hello")
        XCTAssert(output == "holle")
    }

    func test2() {
        let output = reverseVowels("leetcode")
        XCTAssert(output == "leotcede")
    }

}
