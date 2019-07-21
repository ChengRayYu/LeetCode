//
//  171. Excel Sheet Column Number
//  https://leetcode.com/problems/excel-sheet-column-number/
//  Easy
//
//  Given a column title as appear in an Excel sheet, return its corresponding column number.
//  For example:
//
//  A -> 1
//  B -> 2
//  C -> 3
//  ...
//  Z -> 26
//  AA -> 27
//  AB -> 28
//  ...
//
//  Example 1:
//  Input: "A"
//  Output: 1

//  Example 2:
//  Input: "AB"
//  Output: 28

//  Example 3:
//  Input: "ZY"
//  Output: 701
//

import XCTest

class L171_Excel_Sheet_Column_Number: XCTestCase {

    func titleToNumber(_ s: String) -> Int {
        
        let map: [Character: Int] = [
            "A": 1, "B": 2, "C": 3, "D": 4, "E": 5,
            "F": 6, "G": 7, "H": 8, "I": 9, "J": 10,
            "K": 11, "L": 12, "M": 13, "N": 14, "O": 15,
            "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20,
            "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26,
        ]
        var result = 0
        var s: [Character] = Array(s).reversed()
        var index = 0
        
        while index < s.count {
            let num = map[s[index]]!
            let pow = Int(Darwin.pow(Double(map.count), Double(index)))
            result += num * pow
            index += 1
        }
        return result
    }
    
    func b_titleToNumber(_ s: String) -> Int {
        
        let map: [Character: Int] = [
            "A": 1, "B": 2, "C": 3, "D": 4, "E": 5,
            "F": 6, "G": 7, "H": 8, "I": 9, "J": 10,
            "K": 11, "L": 12, "M": 13, "N": 14, "O": 15,
            "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20,
            "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26,
        ]
        var result = 0
        var s: [Character] = Array(s)

        for i in 0..<s.count {
            let num = map[s[i]]!
            result = result * map.count + num
        }
        return result
    }

    func test1() {
        let output = titleToNumber("A")
        XCTAssertTrue(output == 1)
    }

    func test2() {
        let output = titleToNumber("AB")
        XCTAssertTrue(output == 28)
    }

    func test3() {
        let output = titleToNumber("ZY")
        XCTAssertTrue(output == 701)
    }
    
    func testB1() {
        let output = b_titleToNumber("A")
        XCTAssertTrue(output == 1)
    }
    
    func testB2() {
        let output = b_titleToNumber("AB")
        XCTAssertTrue(output == 28)
    }
    
    func testB3() {
        let output = b_titleToNumber("ZY")
        XCTAssertTrue(output == 701)
    }


}
