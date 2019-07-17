//
//  118. Pascal's Triangle
//  https://leetcode.com/problems/pascals-triangle/
//  Easy
//
//  Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
//  In Pascal's triangle, each number is the sum of the two numbers directly above it.
//
//  Example:
//  Input: 5
//  Output:
//  [
//       [1],
//      [1,1],
//     [1,2,1],
//    [1,3,3,1],
//   [1,4,6,4,1]
//  ]
//

import XCTest

class L118_Pascal_Triangle: XCTestCase {

    // iterative
    func a_generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else { return [] }
        var result: [[Int]] = [[1]]
        for i in 1..<numRows {
            let lastRow = result[i - 1]
            var row: [Int] = [Int].init(repeating: 1, count: i + 1)
            
            for j in 1..<row.count - 1 {
                row[j] = lastRow[j - 1] + lastRow[j]
            }
            result.append(row)
        }
        return result
    }
    
    // recursive
    func b_generate(_ numRows: Int) -> [[Int]] {
        var result: [[Int]] = [[1]]
        pascal(currentRow: result.count, totalRows: numRows, result: &result)
        return result
    }
    
    func pascal(currentRow: Int, totalRows: Int, result: inout [[Int]]) {
        if currentRow < totalRows {
            let last = result[currentRow - 1]
            var row: [Int] = [Int](repeating: 1, count: currentRow + 1)
            for i in 1..<row.count - 1 {
                row[i] = last[i - 1] + last[i]
            }
            result.append(row)
            pascal(currentRow: result.count, totalRows: totalRows, result: &result)
        }
    }

    func testA() {
        let output = a_generate(5)
        let mock = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
        XCTAssert(output == mock)
    }

    func testB() {
        let output = b_generate(5)
        let mock = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
        XCTAssert(output == mock)
    }

}
