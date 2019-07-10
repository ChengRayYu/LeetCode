//
//  88. Merge Sorted Array
//  https://leetcode.com/problems/merge-sorted-array/
//  Easy
//
//  Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
//  Note:
//  The number of elements initialized in nums1 and nums2 are m and n respectively.
//  You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
//
//  Example:
//  Input:
//  nums1 = [1,2,3,0,0,0], m = 3
//  nums2 = [2,5,6],       n = 3
//
//  Output: [1,2,2,3,5,6]
//

import XCTest

class L088_Merge_Sorted_Array: XCTestCase {

    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        guard m <= nums1.count, nums2.count > 0, n <= nums2.count else {
            return
        }
        
        var indexM = m - 1
        var indexN = n - 1
        var index = m + n - 1
    
        while indexM >= 0 && indexN >= 0 {
            
            if nums1[indexM] > nums2[indexN] {
                nums1.swapAt(indexM, index)
                indexM -= 1
            } else {
                nums1[index] = nums2[indexN]
                indexN -= 1
            }
            index -= 1
        }

        while indexN >= 0 {
            nums1[index] = nums2[indexN]
            indexN -= 1
            index -= 1
        }
    }
    
    func test1() {
        var nums1 = [1, 2, 3, 0, 0, 0]
        let nums2 = [2, 5, 6]
        merge(&nums1, 3, nums2, 3)
        XCTAssertTrue(nums1 == [1, 2, 2, 3, 5, 6])
    }
    
    func test2() {
        var nums1: [Int] = [0]
        let nums2: [Int] = [1]
        merge(&nums1, 0, nums2, 1)
        XCTAssertTrue(nums1 == [1])
    }
    
    func test3() {
        var nums1: [Int] = [2, 3, 3, 0, 0, 0, 0, 0, 0]
        let nums2: [Int] = [2, 3, 5, 5, 5, 6]
        merge(&nums1, 3, nums2, 6)
        XCTAssertTrue(nums1 == [2, 2, 3, 3, 3, 5, 5, 5, 6])
    }
}
