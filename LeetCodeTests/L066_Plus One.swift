//
//  66. Plus One
//  https://leetcode.com/problems/plus-one/
//  Easy
//
//  Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
//  The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
//  You may assume the integer does not contain any leading zero, except the number 0 itself.
//

import XCTest

class L066_Plus_One: XCTestCase {

    func plusOne(_ digits: [Int]) -> [Int] {
        
        guard digits.count > 0 else {
            return digits
        }
        
        var digits = digits
        digits[digits.count - 1] = digits.last! + 1
        
        for i in (0..<digits.count).reversed() {
            if digits[i] > 9 {
                digits[i] = 0
                if i != 0 {
                    digits[i - 1] = digits[i - 1] + 1
                } else {
                    digits.insert(1, at: 0)
                }
            }
        }
        return digits
    }
    
    func b_plusOne(_ digits: [Int]) -> [Int] {
        
        guard digits.count > 0 else {
            return digits
        }
        var digits = digits

        for i in (0..<digits.count - 1).reversed() {
            
            if digits[i] == 9 {
                digits[i] = 0
            } else {
                digits[i] = digits[i] + 1
                return digits
            }
        }
        digits.insert(1, at: 0)
        return digits
    }
    
    func test1() {
        let output = plusOne([1, 2, 3])
        XCTAssertTrue(output == [1, 2, 4])
    }
    
    func test2() {
        let output = plusOne([9])
        XCTAssertTrue(output == [1, 0])
    }

    func testB1() {
        let output = plusOne([1, 2, 3])
        XCTAssertTrue(output == [1, 2, 4])
    }
    
    func testB2() {
        let output = plusOne([9])
        XCTAssertTrue(output == [1, 0])
    }

}
