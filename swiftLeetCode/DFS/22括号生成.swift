//
//  22括号生成.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/15.
//  22. 括号生成
//  https://leetcode-cn.com/problems/generate-parentheses

/**
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。

 示例 1：
 输入：n = 3
 输出：["((()))","(()())","(())()","()(())","()()()"]
 示例 2：

 输入：n = 1
 输出：["()"]
 */

import Foundation

class Solution22 {
    
    // 执行用时：12 ms, 在所有 Swift 提交中击败了97.18%的用户
    // 内存消耗：14.2 MB, 在所有 Swift 提交中击败了5.08%的用户
    func generateParenthesis(_ n: Int) -> [String] {

        var result = [String]()
        _dfs(0, n << 1, n, n, "", &result)
        return result
    }
    
    private func _dfs(_ index: Int, _ n: Int, _ leftRemain: Int, _ rightRemain: Int, _ tmpResult: String, _ result: inout [String]) {
        
        // 如果遍历到最后一层,则添加结果
        if index == n {
            result.append(tmpResult)
            return
        }
        
        // 如果还有左括号,那么直接选择左括号,并进入下一层
        if leftRemain > 0 {
            _dfs(index + 1, n, leftRemain - 1, rightRemain, "\(tmpResult)(", &result)
        }
        
        // 如果还有右括号
        // 并且左右括号数量不相等
        // 选择右括号,并进入下一层
        // 当左右剩余括号相等时,只能先选择左括号,不能选择右括号
        if rightRemain > 0 && leftRemain != rightRemain {
            _dfs(index + 1, n, leftRemain, rightRemain - 1, "\(tmpResult))", &result)
        }
    }
}

