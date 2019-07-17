//
//  121. Best Time to Buy and Sell Stock
//  https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
//  Easy
//
//  Say you have an array for which the ith element is the price of a given stock on day i.
//  If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
//  Note that you cannot sell a stock before you buy one.
//
//  Example 1:
//  Input: [7,1,5,3,6,4]
//  Output: 5
//  Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
//  Not 7-1 = 6, as selling price needs to be larger than buying price.

//  Example 2:
//  Input: [7,6,4,3,1]
//  Output: 0
//  Explanation: In this case, no transaction is done, i.e. max profit = 0.
//

import XCTest

class L121_Best_Time_to_Buy_and_Sell_Stock: XCTestCase {

    func a_maxProfit(_ prices: [Int]) -> Int {
        
        guard prices.count > 1 else { return 0 }
        var profit = 0
        for i in 0..<prices.count - 1 {
            for j in i + 1..<prices.count {
                let margin = prices[j] - prices[i]
                profit = max(profit, margin)
            }
        }
        return profit
    }

    func b_maxProfit(_ prices: [Int]) -> Int {
        
        guard prices.count > 1 else { return 0 }
        var profit: Int = 0
        var lowPrice: Int = Int.max

        for i in 0..<prices.count {
            if prices[i] < lowPrice {
                lowPrice = prices[i]
            
            } else if prices[i] - lowPrice > profit {
                profit = prices[i] - lowPrice
            }
        }
        return profit
    }

    func testA() {
        let profit = a_maxProfit([7, 1, 5, 3, 6, 4])
        XCTAssertTrue(profit == 5)
    }

    func testB() {
        let profit = a_maxProfit([7, 1, 5, 3, 6, 4])
        XCTAssertTrue(profit == 5)
    }

}
