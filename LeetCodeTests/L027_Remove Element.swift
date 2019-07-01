//
//  27. Remove Element
//  https://leetcode.com/problems/remove-element/
//
//  Given an array nums and a value val, remove all instances of that value in-place and return the new length.
//  Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//  The order of elements can be changed. It doesn't matter what you leave beyond the new length.
//

import XCTest

class L027_Remove_Element: XCTestCase {

    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
     
        guard nums.count > 0 else { return 0 }
        
        var countIdx = 0
        for compareIdx in 0..<nums.count {
            if nums[compareIdx] != val {
                nums[countIdx] = nums[compareIdx]
                countIdx += 1
            }
        }
        return countIdx
    }

    func test1() {
        var nums = [3, 2, 2, 3]
        let output = removeElement(&nums, 3)
        XCTAssertTrue(output == 2)
    }
    
    func test2() {
        
        var nums = [0, 1, 2, 2, 3, 0, 4, 2]
        let output = removeElement(&nums, 2)
        XCTAssertTrue(output == 5)
    }

    func test3() {
        
        var nums = [2]
        let output = removeElement(&nums, 3)
        XCTAssertTrue(output == 1)
    }

}
