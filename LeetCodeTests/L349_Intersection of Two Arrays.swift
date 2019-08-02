//
//  349. Intersection of Two Arrays
//  https://leetcode.com/problems/intersection-of-two-arrays/
//  Easy
//
//  Given two arrays, write a function to compute their intersection.
//  Example 1:
//  Input: nums1 = [1,2,2,1], nums2 = [2,2]
//  Output: [2]
//
//  Example 2:
//  Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//  Output: [9,4]
//
//  Note:
//  Each element in the result must be unique.
//  The result can be in any order.
//

import XCTest

class L349_Intersection_of_Two_Arrays: XCTestCase {

    func a_intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result: [Int] = []
        
        for n1 in nums1 {
            for n2 in nums2 {
                if n1 == n2, !result.contains(n1) {
                    result.append(n1)
                }
            }
        }
        return result
    }
    
    // standard swift syntax
    func b_intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let set1 = Set<Int>.init(nums1)
        let set2 = Set<Int>.init(nums2)
        return Array(set1.intersection(set2))
    }
    
    
    // Set and loop to check intersection
    func c_intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        let set1 = Set<Int>.init(nums1)
        var result: [Int] = []
        for n in nums2 {
            if set1.contains(n), !result.contains(n) {
                result.append(n)
            }
        }
        return result
    }
    
    // Sort and two pointers
    func d_intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result: Set<Int> = .init()
        let nums1 = nums1.sorted()
        let nums2 = nums2.sorted()
        var index1 = 0
        var index2 = 0
        
        while index1 < nums1.count, index2 < nums2.count {
            let n1 = nums1[index1]
            let n2 = nums2[index2]
            if n1 == n2 {
                result.insert(n1)
                index1 += 1
                index2 += 1
                
            } else if n1 > n2 {
                index2 += 1
            } else if n1 < n2 {
                index1 += 1
            }
        }
        return Array(result)
    }

    func testA1() {
        let output = a_intersection([1,2,2,1], [2,2])
        XCTAssertTrue(output == [2])
    }
    
    func testA2() {
        let output = a_intersection([4, 9, 5], [9, 4, 9, 8, 4])
        XCTAssertTrue(output == [4, 9])
    }
    
    func testB1() {
        let output = b_intersection([1,2,2,1], [2,2])
        XCTAssertTrue(output == [2])
    }
    
    func testB2() {
        let output = b_intersection([4, 9, 5], [9, 4, 9, 8, 4])
        XCTAssertTrue(output == [9, 4])
    }

    func testC1() {
        let output = c_intersection([1,2,2,1], [2,2])
        XCTAssertTrue(output == [2])
    }
    
    func testC2() {
        let output = c_intersection([4, 9, 5], [9, 4, 9, 8, 4])
        XCTAssertTrue(output == [4, 9])
    }
 
    func testD1() {
        let output = d_intersection([1,2,2,1], [2,2])
        XCTAssertTrue(output == [2])
    }
    
    func testD2() {
        let output = d_intersection([4, 9, 5], [9, 4, 9, 8, 4])
        XCTAssertTrue(output == [4, 9])
    }

}
