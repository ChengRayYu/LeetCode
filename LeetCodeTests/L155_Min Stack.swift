//
//  155. Min Stack
//  https://leetcode.com/problems/min-stack/
//  Easy
//
//  Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
//
//  push(x) -- Push element x onto stack.
//  pop() -- Removes the element on top of the stack.
//  top() -- Get the top element.
//  getMin() -- Retrieve the minimum element in the stack.
//
//  Example:
//  MinStack minStack = new MinStack();
//  minStack.push(-2);
//  minStack.push(0);
//  minStack.push(-3);
//  minStack.getMin();   --> Returns -3.
//  minStack.pop();
//  minStack.top();      --> Returns 0.
//  minStack.getMin();   --> Returns -2.
//

import XCTest

class L155_Min_Stack: XCTestCase {

    class MinStack {
        
        typealias Pair = (value: Int, min: Int)
        var stack: [Pair] = []
        
        func push(_ x: Int) {            
            var min = stack.last?.min ?? Int.max
            min = Swift.min(min, x)
            let pair = (x, min)
            stack.append(pair)
        }
        
        func pop() {
            stack.removeLast()
        }
        
        func top() -> Int {
            guard let last = stack.last else { fatalError() }
            return last.value
        }
        
        func getMin() -> Int {
            guard let last = stack.last else { fatalError() }
            return last.min
        }
    }

    func test1() {
        var result = true
        let minStack = MinStack()
        minStack.push(-2);
        minStack.push(0);
        minStack.push(-3);
        result = (minStack.getMin() == -3) && result
        minStack.pop();
        result = (minStack.top() == 0) && result
        result = (minStack.getMin() == -2) && result
        XCTAssertTrue(result)
    }
    
    func test2() {
        var result = true
        let minStack = MinStack()
        minStack.push(2)
        minStack.push(0)
        minStack.push(3)
        minStack.push(0)
        result = (minStack.getMin() == 0) && result
        minStack.pop()
        result = (minStack.getMin() == 0) && result
        minStack.pop()
        result = (minStack.getMin() == 0) && result
        minStack.pop()
        result = (minStack.getMin() == 2) && result
        XCTAssertTrue(result)
    }
    
    func test3() {
        var result = true
        let minStack = MinStack()
        minStack.push(2147483646)
        minStack.push(2147483646)
        minStack.push(2147483647)
        result = (minStack.top() == 2147483647) && result
        minStack.pop()
        result = (minStack.getMin() == 2147483646) && result
        minStack.pop()
        result = (minStack.getMin() == 2147483646) && result
        minStack.pop()
        minStack.push(2147483647)
        result = (minStack.top() == 2147483647) && result
        result = (minStack.getMin() == 2147483647) && result
        
        minStack.push(-2147483648)
        result = (minStack.top() == -2147483648) && result
        result = (minStack.getMin() == -2147483648) && result
        minStack.pop()
        result = (minStack.getMin() == 2147483647) && result
        XCTAssertTrue(result)
    }
}
