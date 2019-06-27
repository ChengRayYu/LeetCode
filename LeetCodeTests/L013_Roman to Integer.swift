//
// 13. Roman to Integer
// https://leetcode.com/problems/roman-to-integer/
//
// Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
// Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.
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

class L013_Roman_to_Integer: XCTestCase {

    func toInt(fromRomanString characters: String) -> Int {
        
        let symbols: [String: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        
        var result = 0
        
        for i in 0..<characters.count {
            
            let symbol = characters[characters.index(characters.startIndex, offsetBy: i)]
            let num = symbols["\(symbol)"]!
            
            if i + 1 < characters.count,
                let nextNum = symbols["\(characters[characters.index(characters.startIndex, offsetBy: i + 1)])"],
                num < nextNum {
                result -= num
            } else {
                result += num
            }
        }
        return result
    }

    func test1() {
        let output = toInt(fromRomanString: "III")
        XCTAssertTrue(output == 3)
    }
    
    func test2() {
        let output = toInt(fromRomanString: "LVIII")
        XCTAssertTrue(output == 58)
    }
    
    func test3() {
        let output = toInt(fromRomanString: "MCMXCIV")
        XCTAssertTrue(output == 1994)
    }
}
