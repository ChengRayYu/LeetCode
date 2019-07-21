//
//  168. Excel Sheet Column Title
//  https://leetcode.com/problems/excel-sheet-column-title/
//  Easy
//
//  Given a positive integer, return its corresponding column title as appear in an Excel sheet.
//  For example:
//
//  1 -> A
//  2 -> B
//  3 -> C
//  ...
//  26 -> Z
//  27 -> AA
//  28 -> AB
//  ...
//

import XCTest

class L168_Excel_Sheet_Column_Title: XCTestCase {
    
    func convertToTitle(_ n: Int) -> String {
    
        let map: [Int: String] = [
            0: "A", 1: "B", 2: "C", 3: "D", 4: "D",
            5: "F", 6: "G", 7: "H", 8: "I", 9: "J",
            10: "K", 11: "L", 12: "M", 13: "N", 14: "O",
            15: "P", 16: "Q", 17: "R", 18: "S", 19: "T",
            20: "U", 21: "V", 22: "W", 23: "X", 24: "Y",
            25: "Z"
        ]
        var num = n
        var result = ""
        while num > 0 {
            num -= 1
            let char = map[num % 26]!
            result.append(char)
            num /= 26
        }
        return String(result.reversed())
    }
    
    func testA1() {
        let output = convertToTitle(1)
        XCTAssertTrue(output == "A")
    }

    func testA2() {
        let output = convertToTitle(28)
        XCTAssertTrue(output == "AB")
    }

    func testA3() {
        let output = convertToTitle(701)
        XCTAssertTrue(output == "ZY")
    }

    func testA4() {
        let output = convertToTitle(2001)
        XCTAssertTrue(output == "BXY")
    }

}
