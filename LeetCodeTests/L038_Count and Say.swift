//
//  038_Count and Say.swift
//  https://leetcode.com/problems/count-and-say/
//
//  The count-and-say sequence is the sequence of integers with the first five terms as following:
//  1.     1
//  2.     11
//  3.     21
//  4.     1211
//  5.     111221
//
//  1 is read off as "one 1" or 11.
//  11 is read off as "two 1s" or 21.
//  21 is read off as "one 2, then one 1" or 1211.
//
//  Given an integer n where 1 ≤ n ≤ 30, generate the nth term of the count-and-say sequence.
//  Note: Each term of the sequence of integers will be represented as a string.
//

import XCTest

class L038_Count_and_Say: XCTestCase {

    // iterative
    func a_countAndSay(_ n: Int) -> String {
        if n < 1 { return "" }
        
        var say: [String] = ["1"]
        for _ in 1..<n {
         
            var temp: [String] = []
            var compareChar = say[0]
            var charCnt = 1

            for index in 1..<say.count {
                if compareChar == say[index] {
                    charCnt += 1
                } else {
                    temp.append(String(charCnt))
                    temp.append(compareChar)
                    compareChar = say[index]
                    charCnt = 1
                }
            }
            temp.append(String(charCnt))
            temp.append(compareChar)
            say = temp
        }
        return say.joined()
    }
    
    // recursive
    func b_countAndSay(_ n: Int) -> String {
        if n < 1 { return "" }
        if n < 2 { return "1" }

        let prev = Array(b_countAndSay(n - 1)).map { String($0) }

        var temp: [String] = []
        var compareChar = prev[0]
        var charCnt = 1
        
        for index in 1..<prev.count {
            if compareChar == prev[index] {
                charCnt += 1
            } else {
                temp.append(String(charCnt))
                temp.append(compareChar)
                compareChar = prev[index]
                charCnt = 1
            }
        }
        temp.append(String(charCnt))
        temp.append(compareChar)
        
        return temp.joined()
    }
    
    func testA1() {
        let output = a_countAndSay(1)
        XCTAssertTrue(output == "1")
    }

    func testA2() {
        let output = a_countAndSay(4)
        XCTAssertTrue(output == "1211")
    }

    func testB1() {
        let output = b_countAndSay(1)
        XCTAssertTrue(output == "1")
    }
    
    func testB2() {
        let output = b_countAndSay(4)
        XCTAssertTrue(output == "1211")
    }

}
