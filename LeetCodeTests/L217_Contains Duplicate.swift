//
//  217. Contains Duplicate
//  https://leetcode.com/problems/contains-duplicate/
//  Easy
//
//  Given an array of integers, find if the array contains any duplicates.
//  Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
//
//  Example 1:
//  Input: [1,2,3,1]
//  Output: true
//
//  Example 2:
//  Input: [1,2,3,4]
//  Output: false
//
//  Example 3:
//  Input: [1,1,1,3,3,4,3,2,4,2]
//  Output: true
//

import XCTest

class L217_Contains_Duplicate: XCTestCase {

    // Set
    func a_containsDuplicate(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return false }
        var set: Set<Int> = Set<Int>()
        for num in nums {
            if set.contains(num) {
                return true
            } else {
                set.insert(num)
            }
        }
        return false
    }
    
    // sorting
    func b_containsDuplicate(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return false }
        let sortedNums = nums.sorted()
        for i in 0..<sortedNums.count - 1 {
            if sortedNums[i] == sortedNums[i + 1] {
                return true
            }
        }
        return false
    }

    func testA1() {
        let output = a_containsDuplicate([1, 2, 3, 1])
        XCTAssertTrue(output)
    }

    func testA2() {
        let output = a_containsDuplicate([1, 2, 3, 4])
        XCTAssertFalse(output)
    }

    func testA3() {
        let output = a_containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2])
        XCTAssertTrue(output)
    }
    
    func testB1() {
        let output = b_containsDuplicate([1, 2, 3, 1])
        XCTAssertTrue(output)
    }
    
    func testB2() {
        let output = b_containsDuplicate([1, 2, 3, 4])
        XCTAssertFalse(output)
    }
    
    func testB3() {
        let output = b_containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2])
        XCTAssertTrue(output)
    }
}
