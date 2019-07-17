//
//  122. Best Time to Buy and Sell Stock II
//  https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
//  Easy
//
//  Say you have an array for which the ith element is the price of a given stock on day i.
//  Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
//  Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

//  Example 1:
//  Input: [7,1,5,3,6,4]
//  Output: 7
//  Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
//  Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
//
//  Example 2:
//  Input: [1,2,3,4,5]
//  Output: 4
//  Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
//  Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
//  engaging multiple transactions at the same time. You must sell before buying again.
//
//  Example 3:
//  Input: [7,6,4,3,1]
//  Output: 0
//  Explanation: In this case, no transaction is done, i.e. max profit = 0.
//

import XCTest

class L122_Best_Time_to_Buy_and_Sell_Stock_II: XCTestCase {

    func a_maxProfit(_ prices: [Int]) -> Int {
        
        guard prices.count > 0 else { return 0 }
        var totalProfit: Int = 0
        var profit: Int = 0
        var lowPrice: Int = Int.max
        
        for i in 0..<prices.count {
            
            if prices[i] < lowPrice {
                lowPrice = prices[i]
            
            } else if prices[i] - lowPrice > profit {
                
                profit = prices[i] - lowPrice
                
                if i + 1 < prices.count, prices[i] >= prices[i + 1] {
                    totalProfit += profit
                    lowPrice = Int.max
                    profit = 0
                }
                
                if i == prices.count - 1 {
                    totalProfit += profit
                }                
            }
        }
        return totalProfit
    }

    func b_maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var totalProfit = 0
        
        for i in 1..<prices.count {
            if prices[i - 1] < prices[i] {
                totalProfit += prices[i] - prices[i - 1]
            }
        }
        return totalProfit
    }
    
    func testA1() {
        let profit = a_maxProfit([7, 1, 5, 3, 6, 4])
        XCTAssertTrue(profit == 7)
    }
    
    func testA2() {
        let profit = a_maxProfit([1, 2, 3, 4, 5])
        XCTAssertTrue(profit == 4)
    }

    func testA3() {
        let profit = a_maxProfit([5, 2, 3, 2, 6, 6, 2, 9, 1, 0, 7, 4, 5, 0])
        XCTAssertTrue(profit == 20)
    }
    
    func testB1() {
        let profit = b_maxProfit([7, 1, 5, 3, 6, 4])
        XCTAssertTrue(profit == 7)
    }
    
    func testB2() {
        let profit = b_maxProfit([1, 2, 3, 4, 5])
        XCTAssertTrue(profit == 4)
    }
    
    func testB3() {
        let profit = b_maxProfit([5, 2, 3, 2, 6, 6, 2, 9, 1, 0, 7, 4, 5, 0])
        XCTAssertTrue(profit == 20)
    }

}
