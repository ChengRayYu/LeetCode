//
//  69. Sqrt(x)
//  https://leetcode.com/problems/sqrtx/
//  Easy
//
//  Compute and return the square root of x, where x is guaranteed to be a non-negative integer.
//  Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.
//
//  Example:
//  Input: 8
//  Output: 2
//  Explanation: The square root of 8 is 2.82842..., and since the decimal part is truncated, 2 is returned.
//

import XCTest

class L069_Square_Root: XCTestCase {

    // binary search
    func mySqrt(_ x: Int) -> Int {

        guard x > 1 else { return x }
        
        var lowerBound = 1
        var upperBound = x
        
        while lowerBound < upperBound {
            
            let mid = (upperBound + lowerBound) / 2
            
            if mid <= x / mid && (mid + 1) > x / (mid + 1){
                return mid
            } else {
                if mid < x / mid {
                    lowerBound = mid
                } else {
                    upperBound = mid
                }
            }
        }
        return 0
    }

    func test1() {
        let output = mySqrt(8)
        XCTAssertTrue(output == 2)
    }
    
    func test2() {
        let output = mySqrt(3)
        XCTAssertTrue(output == 1)
    }

}
