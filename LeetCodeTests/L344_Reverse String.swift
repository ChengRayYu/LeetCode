//
//  344. Reverse String
//  https://leetcode.com/problems/reverse-string/
//  Easy
//
//  Write a function that reverses a string. The input string is given as an array of characters char[].
//  Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//  You may assume all the characters consist of printable ascii characters.
//
//  Example 1:
//  Input: ["h","e","l","l","o"]
//  Output: ["o","l","l","e","h"]
//
//  Example 2:
//  Input: ["H","a","n","n","a","h"]
//  Output: ["h","a","n","n","a","H"]
//

import XCTest

class L344_Reverse_String: XCTestCase {
    
    // iterative
    func a_reverseString(_ s: inout [Character]) {
        guard s.count > 0 else { return }
        let length = s.count / 2
        for i in 0..<length {
            s.swapAt(i, s.count - 1 - i)
        }
    }
    
    
    // recursive, divide and conquer
    func b_reverseString(_ s: String) -> String {
        guard s.count > 1 else { return s }
        let length = s.count / 2
        let firstHalf = s[s.startIndex..<s.index(s.startIndex, offsetBy: length)]
        let secondHalf = s[s.index(s.startIndex, offsetBy: length)..<s.endIndex]
        return b_reverseString(String(secondHalf)).appending(b_reverseString(String(firstHalf)))
    }
    
    func testA() {
        var arr: [Character] = ["h", "e", "l", "l", "o"]
        a_reverseString(&arr)
        XCTAssertTrue(arr == ["o", "l", "l", "e", "h"])
    }

    func testB() {
        let output = b_reverseString("hello")
        XCTAssertTrue(output == "olleh")
    }

}
