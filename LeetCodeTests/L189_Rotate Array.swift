//
//  189. Rotate Array
//  https://leetcode.com/problems/rotate-array/
//  Easy
//
//  Given an array, rotate the array to the right by k steps, where k is non-negative.
//
//  Example 1:
//  Input: [1,2,3,4,5,6,7] and k = 3
//  Output: [5,6,7,1,2,3,4]
//  Explanation:
//  rotate 1 steps to the right: [7,1,2,3,4,5,6]
//  rotate 2 steps to the right: [6,7,1,2,3,4,5]
//  rotate 3 steps to the right: [5,6,7,1,2,3,4]
//
//  Example 2:
//  Input: [-1,-100,3,99] and k = 2
//  Output: [3,99,-1,-100]
//  Explanation:
//  rotate 1 steps to the right: [99,-1,-100,3]
//  rotate 2 steps to the right: [3,99,-1,-100]
//

import XCTest

class L189_Rotate_Array: XCTestCase {

    func a_rotate(_ nums: inout [Int], _ k: Int) {
        var n = k
        while n > 0 {
            let last = nums.removeLast()
            nums.insert(last, at: 0)
            n -= 1
        }
    }
    
    func b_rotate(_ nums: inout [Int], _ k: Int) {
        var temp: [Int] = [Int](repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            temp[(i + k) % nums.count] = nums[i]
        }
        nums = temp
    }

    func c_rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        reverse(&nums, from: 0, to: nums.count - 1)
        reverse(&nums, from: 0, to: k - 1)
        reverse(&nums, from: k, to: nums.count - 1)
    }

    func reverse(_ nums: inout [Int], from startIdx: Int, to endIdx: Int) {
        var start = startIdx
        var end = endIdx
        while start < end {
            let tmp = nums[start]
            nums[start] = nums[end]
            nums[end] = tmp
            start += 1
            end -= 1
        }
    }
    
    func testA1() {
        var nums = [1, 2, 3, 4, 5, 6, 7]
        a_rotate(&nums, 3)
        XCTAssertTrue(nums == [5, 6, 7, 1, 2, 3, 4])
    }
    
    func testA2() {
        var nums = [-1, -100, 3, 99]
        a_rotate(&nums, 2)
        XCTAssertTrue(nums == [3, 99, -1, -100])
    }
    
    func testB1() {
        var nums = [1, 2, 3, 4, 5, 6, 7]
        b_rotate(&nums, 3)
        XCTAssertTrue(nums == [5, 6, 7, 1, 2, 3, 4])
    }
    
    func testB2() {
        var nums = [-1, -100, 3, 99]
        b_rotate(&nums, 2)
        XCTAssertTrue(nums == [3, 99, -1, -100])
    }
    
    func testC1() {
        var nums = [1, 2, 3, 4, 5, 6, 7]
        c_rotate(&nums, 3)
        XCTAssertTrue(nums == [5, 6, 7, 1, 2, 3, 4])
    }
    
    func testC2() {
        var nums = [-1, -100, 3, 99]
        c_rotate(&nums, 2)
        XCTAssertTrue(nums == [3, 99, -1, -100])
    }

}
