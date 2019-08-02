//
//  26. Remove Duplicates from Sorted Array
//  https://leetcode.com/problems/remove-duplicates-from-sorted-array/
//
//  Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
//  Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//

import XCTest

class L026_Remove_Duplicates_from_Sorted_Array: XCTestCase {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        var pointer = 0
        for i in 1..<nums.count {
            if nums[pointer] != nums[i] {
                pointer += 1
                nums[pointer] = nums[i]
            }
        }
        return pointer + 1
    }
    
    func testA1() {
        var nums = [1, 1, 2]
        let output = removeDuplicates(&nums)
        XCTAssertTrue(output == 2)
    }

    func testA2() {
        var nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
        let output = removeDuplicates(&nums)
        XCTAssertTrue(output == 5)
    }

    /*
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var index: Int = 0
        for compareIdx in (index + 1)..<nums.count {
            if nums[index] != nums[compareIdx] {
                index += 1
                nums[index] = nums[compareIdx]
            }
        }
        return index + 1
    }
    */
}
