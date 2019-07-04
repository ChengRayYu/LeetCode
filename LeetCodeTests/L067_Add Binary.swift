//
//  67. Add Binary
//  https://leetcode.com/problems/add-binary/
//  Easy
//
//  Given two binary strings, return their sum (also a binary string).
//  The input strings are both non-empty and contains only characters 1 or 0.
//
//  Example 1:
//  Input: a = "11", b = "1"
//  Output: "100"
//

import XCTest

class L067_Add_Binary: XCTestCase {

    func addBinary(_ a: String, _ b: String) -> String {

        guard !a.isEmpty, !b.isEmpty else { return "" }
        
        var a = Array(a)
        var b = Array(b)
        var indexA = a.count - 1
        var indexB = b.count - 1

        var result = ""
        var carry = 0
        while indexA >= 0 || indexB >= 0 {
            
            // find characters at index of each string arrary
            let figA = (indexA >= 0) ? Int(String(a[indexA])) ?? 0 : 0
            let figB = (indexB >= 0) ? Int(String(b[indexB])) ?? 0 : 0
            
            // find sum of figures at index with overflow if any
            let sum = figA + figB + carry
            
            // check if sum overflowss
            carry = (sum > 1) ? 1 : 0
            
            let fig = String(sum % 2)
            result.append(fig)
            indexA -= 1
            indexB -= 1
        }
        if carry > 0 {
            result.append("1")
        }
        return String(result.reversed())
    }

    func test1() {
        let output = addBinary("11", "1")
        XCTAssertTrue(output == "100")
    }
    
    func test2() {
        let output = addBinary("1010", "1011")
        XCTAssertTrue(output == "10101")
    }
}
