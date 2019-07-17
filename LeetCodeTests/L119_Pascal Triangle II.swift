//
//  119. Pascal's Triangle II
//  https://leetcode.com/problems/pascals-triangle-ii/
//  Easy
//
//  Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.
//  Note that the row index starts from 0.
//
//  Example:
//  Input: 3
//  Output: [1,3,3,1]
//

import XCTest

class L119_Pascal_Triangle_II: XCTestCase {

    func getRow(_ rowIndex: Int) -> [Int] {
        var result: [Int] = [1]
        guard rowIndex > 0 else { return result }
        for _ in 1...rowIndex {
            result.insert(1, at: 0)
            for idxInRow in 1..<result.count - 1 {
                result[idxInRow] = result[idxInRow] + result[idxInRow + 1]
            }
        }
        return result
    }

    func test1() {
        let output = getRow(4)
        let mock = [1, 4, 6, 4, 1]
        XCTAssert(output == mock)
    }
    
    func test2() {
        let output = getRow(0)
        XCTAssert(output == [1])
    }

}
