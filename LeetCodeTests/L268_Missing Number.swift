//
//  268. Missing Number
//  https://leetcode.com/problems/missing-number/
//
//  Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
//

import XCTest

class L268_Missing_Number: XCTestCase {

    func a_missingNumber(_ nums: [Int]) -> Int {
        
        let nums = nums.sorted()
        
        for i in 0...nums.count {
            if i == nums.count {
                return i
            } else if i != nums[i] {
                return i
            }
        }
        return -1
    }
    
    func b_missingNumber(_ nums: [Int]) -> Int {
        
        let sumToBe = (nums.count + 1) * (0 + nums.count) / 2
        let actualSum = nums.reduce(0) { (result, n) -> Int in
            return result + n
        }
        return sumToBe - actualSum
    }
    
    func c_missingNumber(_ nums: [Int]) -> Int {
        
        var set = Set<Int>()
        nums.forEach { (num) in
            set.insert(num)
        }
        
        let actualLengthToBe = nums.count + 1

        for i in 0..<actualLengthToBe {
            if !set.contains(i) {
                return i
            }
        }
        return -1
    }

    func testA1() {
        let output = a_missingNumber([3,0,1])
        XCTAssertTrue(output == 2)
    }
    
    func testA2() {
        let output = a_missingNumber([9,6,4,2,3,5,7,0,1])
        XCTAssertTrue(output == 8)
    }
    
    func testB1() {
        let output = b_missingNumber([3,0,1])
        XCTAssertTrue(output == 2)
    }
    
    func testB2() {
        let output = b_missingNumber([9,6,4,2,3,5,7,0,1])
        XCTAssertTrue(output == 8)
    }
    
    func testC1() {
        let output = c_missingNumber([3,0,1])
        XCTAssertTrue(output == 2)
    }
    
    func testC2() {
        let output = c_missingNumber([9,6,4,2,3,5,7,0,1])
        XCTAssertTrue(output == 8)
    }
}
