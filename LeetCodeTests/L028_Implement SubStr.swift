//
//  028. Implement strStr()
//  https://leetcode.com/problems/implement-strstr/
//  Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
//
//  Example 1:
//  Input: haystack = "hello", needle = "ll"
//  Output: 2
//
//  Example 2:
//  Input: haystack = "aaaaa", needle = "bba"
//  Output: -1
//
//  For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().


import XCTest

class L028_Implement_SubStr: XCTestCase {

    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty { return 0 }
        if haystack.isEmpty { return -1 }
        if haystack.count < needle.count { return -1 }
        if haystack.count == needle.count, haystack == needle { return 0}
        
        let haystackArr = Array(haystack)
        let needleArr = Array(needle)
        let target = needleArr[0]
        
        for i in 0...haystack.count - needle.count {
            
            if haystackArr[i] == target {
                
                // for-loop to compare character
                var match = true
                for j in 1..<needle.count {
                    if haystackArr[i + j] != needleArr[j] {
                        match = false
                        break
                    }
                }
                if match {
                    return i
                }

                /* compare substring */
                /*
                let startIndex = haystack.index(haystack.startIndex, offsetBy: i)
                let endIndex = haystack.index(haystack.startIndex, offsetBy: i + needle.count)
                let sub = haystack[startIndex..<endIndex]
                if sub == needle {
                    return i
                }
                */
            }
            
        }
        return -1
    }
    
    func test1() {
        let output = strStr("hello", "ll")
        XCTAssert(output == 2)
    }

    func test2() {
        let output = strStr("aaaaa", "bba")
        XCTAssert(output == -1)
    }
    
    func test3() {
        let output = strStr("aaaaa", "aa")
        XCTAssert(output == 0)
    }
    
    func test4() {
        let output = strStr("aaa", "aaa")
        XCTAssert(output == 0)
    }
    
    func test5() {
        let output = strStr("mississippi", "pi")
        XCTAssert(output == 9)
    }
}
