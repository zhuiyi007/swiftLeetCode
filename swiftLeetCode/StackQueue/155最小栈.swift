//
//  155最小栈.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/6.
//  155. 最小栈
//  https://leetcode-cn.com/problems/min-stack/
//  相同问题:
//  面试题 03.02. 栈的最小值
//  https://leetcode-cn.com/problems/min-stack-lcci/submissions/

/**
 设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。

 push(x) —— 将元素 x 推入栈中。
 pop() —— 删除栈顶的元素。
 top() —— 获取栈顶元素。
 getMin() —— 检索栈中的最小元素。
  
 示例:
 输入：
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]
 输出：
 [null,null,null,null,-3,null,0,-2]
 解释：
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.getMin();   --> 返回 -2.
 */

import Foundation

// 执行用时：92 ms, 在所有 Swift 提交中击败了52.17%的用户
// 内存消耗：14.8 MB, 在所有 Swift 提交中击败了61.41%的用户
class MinStack {
    
    var stack : [Int]
    var minStack : [Int]
    /** initialize your data structure here. */
    init() {
        self.stack = [Int]()
        self.minStack = [Int]()
    }
    
    func push(_ val: Int) {
        
        if stack.count == 0 {
            minStack.append(val)
            stack.append(val)
            return
        }
        
        let top = minStack.last!
        stack.append(val)
        if top < val {
            
            minStack.append(top)
        } else {
            
            minStack.append(val)
        }
    }
    
    func pop() {

        if stack.count == 0 {
            return
        }
        stack.removeLast()
        minStack.removeLast()
    }
    
    func top() -> Int {

        return stack.last!
    }
    
    func getMin() -> Int {

        return minStack.last!
    }
}

