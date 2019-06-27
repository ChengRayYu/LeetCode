//
// 20. Valid Parentheses
// https://leetcode.com/problems/valid-parentheses/
//
// Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
// An input string is valid if:
// Open brackets must be closed by the same type of brackets.
// Open brackets must be closed in the correct order.
//
// Note that an empty string is also considered valid.
//

import XCTest

class L020_Valid_Parantheses: XCTestCase {

    let pairs: [Character: Character] = [
        "(": ")",
        "[": "]",
        "{": "}"
    ]
    
    func isValid(_ s: String) -> Bool {
        
        guard s.count % 2 == 0 else { return false }
        var stack: [Character] = []
        
        for char in s {
            if pairs.keys.contains(char), let symbol = pairs[char] {
                stack.append(symbol)
                
            } else {
                guard stack.popLast() == char else { return false }
            }
        }
        return stack.isEmpty
    }
    
    /*
    func isValid(_ s: String) -> Bool {
        var strArr = Array(s)
        while strArr.count > 1 {
            guard let target = pairs[strArr[0]] else {
                break
            }
            if String(strArr[1]) == target {
                strArr.remove(at: 1)
                strArr.remove(at: 0)
                continue
                
            } else if String(strArr[strArr.count - 1]) == target {
                strArr.remove(at: strArr.count - 1)
                strArr.remove(at: 0)
                continue
            }
            break
        }
        return strArr.count == 0
    }
    */
    
    func testEmpty() {
        let output = isValid("")
        XCTAssertTrue(output)
    }
    
    func test1() {
        let output = isValid("()")
        XCTAssertTrue(output)
    }
    
    func test2() {
        let output = isValid("()[]{}")
        XCTAssertTrue(output)
    }
    
    func test3() {
        let output = isValid("(]")
        XCTAssertFalse(output)
    }
    
    func test4() {
        let output = isValid("([)]")
        XCTAssertFalse(output)
    }
    
    func test5() {
        let output = isValid("{[]}")
        XCTAssertTrue(output)
    }
    
    func test6() {
        let output = isValid("([])")
        XCTAssertTrue(output)
    }
    
    func test7() {
        let output = isValid("[({(())}[()])]")
        XCTAssertTrue(output)
    }
}
