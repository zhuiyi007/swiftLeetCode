//
//  739每日温度.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/8.
//  739. 每日温度
//  https://leetcode-cn.com/problems/daily-temperatures

/**
 请根据每日 气温 列表，重新生成一个列表。对应位置的输出为：要想观测到更高的气温，至少需要等待的天数。如果气温在这之后都不会升高，请在该位置用 0 来代替。

 例如，给定一个列表 temperatures = [73, 74, 75, 71, 69, 72, 76, 73]，你的输出应该是 [1, 1, 4, 2, 1, 1, 0, 0]。

 提示：气温 列表长度的范围是 [1, 30000]。每个气温的值的均为华氏度，都是在 [30, 100] 范围内的整数。
 */

import Foundation
class Solution739 {
    
    // 动态规划
    // 执行用时：1188 ms, 在所有 Swift 提交中击败了48.72%的用户
    // 内存消耗：23.9 MB, 在所有 Swift 提交中击败了8.97%的用户
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        
        let count = temperatures.count
        
        // dp[i]代表i天后气温会比当前高
        // dp[temperatures.count - 1] = 0
        var dp = [Int](repeating: 0, count: count)
        
        // 从后往前开始递推
        for i in (0..<count - 1).reversed() {
            
            var j = i + 1
            // 顺着dp数组往后跳跃找比自己大的第一个元素
            while dp[j] > 0 && temperatures[i] >= temperatures[j] {
                j += dp[j]
            }
            // 循环完成后,如果找到的值比自己还小
            // 则证明后面没有比自己大的数了
            // 直接赋0
            dp[i] = temperatures[i] >= temperatures[j] ? 0 : j - i
        }
        
        return dp
    }
    
    // 执行用时：1320 ms, 在所有 Swift 提交中击败了48.72%的用户
    // 内存消耗：23.5 MB, 在所有 Swift 提交中击败了38.46%的用户
    // 利用栈解决
    func dailyTemperatures1(_ temperatures: [Int]) -> [Int] {

        var stack = [Int]()
        var result = [Int](repeating: 0, count: temperatures.count)
        
        for i in 0..<temperatures.count {
            
            // 当前温度比栈中的温度大,则需要出栈,并且设置值
            while stack.count > 0 && temperatures[stack.last!] < temperatures[i] {
                result[stack.last!] = i - stack.last!
                stack.removeLast()
            }
            // 整体栈中的元素是从栈底到栈顶单调递减的
            stack.append(i)
        }
        return result
    }
}
