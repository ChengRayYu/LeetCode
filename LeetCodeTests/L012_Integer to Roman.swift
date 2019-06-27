//
// 12. Integer to Roman
// https://leetcode.com/problems/roman-to-integer/
//
// Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
// Given an integer, convert it to a roman numeral. Input is guaranteed to be within the range from 1 to 3999.
//
// Symbol       Value
// I             1
// V             5
// X             10
// L             50
// C             100
// D             500
// M             1000
//
// I can be placed before V (5) and X (10) to make 4 and 9.
// X can be placed before L (50) and C (100) to make 40 and 90.
// C can be placed before D (500) and M (1000) to make 400 and 900.
//

import XCTest

class L012_Integer_to_Roman: XCTestCase {

    func toRomanNumeral(fromInt num: Int) -> String {
        
        let maps: [(String, Int)] = [
            ("I", 1),
            ("IV", 4),
            ("V", 5),
            ("IX", 9),
            ("X", 10),
            ("XL", 40),
            ("L", 50),
            ("XC", 90),
            ("C", 100),
            ("CD", 400),
            ("D", 500),
            ("CM", 900),
            ("M", 1000)
            ].sorted { $0.1 > $1.1 }
        
        var num = num
        var result = ""
        
        for entry in maps {
            while num >= entry.1 {
                result += entry.0
                num -= entry.1
            }
        }
        return result
    }
    
    func test1() {
        let output = toRomanNumeral(fromInt: 3)
        XCTAssertTrue(output == "III")
    }
    
    func test2() {
        let output = toRomanNumeral(fromInt: 58)
        XCTAssertTrue(output == "LVIII")
    }
    
    func test3() {
        let output = toRomanNumeral(fromInt: 1994)
        print(output)
        XCTAssertTrue(output == "MCMXCIV")
    }
}
