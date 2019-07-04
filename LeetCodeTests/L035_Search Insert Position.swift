//
//  035. Search Insert Position
//  https://leetcode.com/problems/search-insert-position/
//
//  Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
//  You may assume no duplicates in the array.
//

import XCTest

class L035_Search_Insert_Position: XCTestCase {

    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        guard nums.count > 0 else { return 0 }
        
        for i in 0..<nums.count {
            if nums[i] >= target {
                return i
            }
        }
        return nums.count
    }

    func test1() {
        let output = searchInsert([1, 3, 5, 6], 5)
        XCTAssert(output == 2)
    }

    func test2() {
        let output = searchInsert([1, 3, 5, 6], 2)
        XCTAssert(output == 1)
    }

}
