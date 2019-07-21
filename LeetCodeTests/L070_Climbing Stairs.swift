//
//  70. Climbing Stairs
//  https://leetcode.com/problems/climbing-stairs/
//  Easy
//
//  You are climbing a stair case. It takes n steps to reach to the top.
//  Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
//  Note: Given n will be a positive integer.
//

import XCTest

class L070_Climbing_Stairs: XCTestCase {
    
    // own solution by combination
    typealias Combo = (countOfTwo: Int, length: Int)
    func a_climbStairs(_ n: Int) -> Int {
        
        let maxCntOfTwo = n / 2
        
        var combos: [Combo] = []
        for i in 0...maxCntOfTwo {
            combos.append((i, n - i))
        }
    
        return combos.reduce(0) { (result, combo) -> Int in
            var r = 1
            for i in 0..<combo.countOfTwo {
                r *= (combo.length - i)
                r /= (i + 1)
            }
            return r + result
        }
    }
    
    // fibonacci
    func b_climbStairs(_ n: Int) -> Int {
        
        guard n > 1 else { return n }
        
        var allWays = 0
        var waysTwoStairBefore = 1
        var waysOneStairBefore = 2

        for _ in 3...n {
            allWays = waysOneStairBefore + waysTwoStairBefore
            waysTwoStairBefore = waysOneStairBefore
            waysOneStairBefore = allWays
        }
        return allWays
    }
    
    // dynamic
    func c_climbStairs(_ n: Int) -> Int {
        
        guard n > 1 else { return n }
        var wayOfStairs: [Int] =  [Int](repeating: 0, count: n + 1)
        wayOfStairs[0] = 0
        wayOfStairs[1] = 1
        wayOfStairs[2] = 2
        
        for i in 3...n {
            wayOfStairs[i] = wayOfStairs[i - 1] + wayOfStairs[i - 2]
        }
        return wayOfStairs[n]
    }
    
    func testA1() {
        let output = a_climbStairs(3)
        XCTAssertTrue(output == 3)
    }
    
    func testA2() {
        let output = a_climbStairs(10)
        XCTAssertTrue(output == 89)
    }

    func testB1() {
        let output = b_climbStairs(3)
        XCTAssertTrue(output == 3)
    }
    
    func testB2() {
        let output = b_climbStairs(10)
        XCTAssertTrue(output == 89)
    }
    
    func testB3() {
        let output = b_climbStairs(5)
        XCTAssertTrue(output == 8)
    }

    func testC1() {
        let output = c_climbStairs(3)
        XCTAssertTrue(output == 3)
    }
    
    func testC2() {
        let output = c_climbStairs(10)
        XCTAssertTrue(output == 89)
    }
}
