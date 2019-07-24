//
//  198. House Robber
//  https://leetcode.com/problems/house-robber/
//  Easy
//
//  You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

//  Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

//  Example 1:
//  Input: [1,2,3,1]
//  Output: 4
//  Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
//  Total amount you can rob = 1 + 3 = 4.
//
//  Example 2:
//  Input: [2,7,9,3,1]
//  Output: 12
//  Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
//  Total amount you can rob = 2 + 9 + 1 = 12.
//

import XCTest

class L198_House_Robber: XCTestCase {

    // recursive
    func a_rob(_ nums: [Int]) -> Int {
        return money(ofHouse: nums, atIndex: 0)
    }
    
    func money(ofHouse nums: [Int], atIndex idx: Int) -> Int {
        if idx >= nums.count {
            return 0
        
        } else {
            let robThis = nums[idx] + money(ofHouse: nums, atIndex: idx + 2)
            let robNext = money(ofHouse: nums, atIndex: idx + 1)
            return max(robThis, robNext)
        }
    }
    
    // dynamic
    func b_rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var money: [Int] = [Int](repeating: Int.min, count: nums.count)
        money[0] = nums[0]
        money[1] = max(nums[0], nums[1])
        for i in 2..<nums.count {
            let rob = money[i - 2] + nums[i]
            let noRob = money[i - 1]
            money[i] = max(rob, noRob)
        }
        return money[nums.count - 1]
    }
    
    // iterative
    func c_rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var didNotRobPrev = 0//max(nums[0], nums[1])
        var robPrev = 0//Int = nums[0]

        for num in nums {
            let robCurrent = didNotRobPrev + num
            let notRobCurrent = max(didNotRobPrev, robPrev)
            didNotRobPrev = notRobCurrent
            robPrev = robCurrent
        }
        return max(didNotRobPrev, robPrev)
    }

    func testA1() {
        let output = a_rob([1, 2, 3, 1])
        XCTAssertTrue(output == 4)
    }

    func testA2() {
        let output = a_rob([2, 7, 9, 3, 1])
        XCTAssertTrue(output == 12)
    }

    func testA3() {
        let output = a_rob([2, 1, 1, 2])
        XCTAssertTrue(output == 4)
    }

    func testB1() {
        let output = b_rob([1, 2, 3, 1])
        XCTAssertTrue(output == 4)
    }
    
    func testB2() {
        let output = b_rob([2, 7, 9, 3, 1])
        XCTAssertTrue(output == 12)
    }
    
    func testB3() {
        let output = b_rob([2, 1, 1, 2])
        XCTAssertTrue(output == 4)
    }
    
    func testC1() {
        let output = c_rob([1, 2, 3, 1])
        XCTAssertTrue(output == 4)
    }
    
    func testC2() {
        let output = c_rob([2, 7, 9, 3, 1])
        XCTAssertTrue(output == 12)
    }
    
    func testC3() {
        let output = c_rob([2, 1, 1, 2])
        XCTAssertTrue(output == 4)
    }

}
