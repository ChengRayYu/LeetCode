//
//  204. Count Primes
//  https://leetcode.com/problems/count-primes/
//  Easy
//
//  Count the number of prime numbers less than a non-negative number, n.
//
//  Example:
//  Input: 10
//  Output: 4
//  Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
//

import XCTest

class L204_Count_Primes: XCTestCase {

    func countPrimes(_ n: Int) -> Int {
        
        guard n > 1 else { return 0 }
        var dividableArr: [Bool] = [Bool](repeating: false, count: n)
        var primeCount = 0
        
        for i in 2..<n {
            
            if !dividableArr[i] {
                primeCount += 1
                var j = i * 2
                while j < n {
                    dividableArr[j] = true
                    j += i
                }
            }
        }
        return primeCount
    }
    
    func test1() {
        let output = countPrimes(10)
        XCTAssertTrue(output == 4)
    }
    
    func test2() {
        let output = countPrimes(4)
        XCTAssertTrue(output == 2)
    }

}
