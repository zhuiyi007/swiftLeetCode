//
//  62不同路径.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/6/30.
//  62. 不同路径
//  https://leetcode-cn.com/problems/unique-paths

/**
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。

 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。

 问总共有多少条不同的路径？
 示例 1：
 输入：m = 3, n = 7
 输出：28
 
 示例 2：
 输入：m = 3, n = 2
 输出：3
 解释：
 从左上角开始，总共有 3 条路径可以到达右下角。
 1. 向右 -> 向下 -> 向下
 2. 向下 -> 向下 -> 向右
 3. 向下 -> 向右 -> 向下
 
 示例 3：
 输入：m = 7, n = 3
 输出：28
 
 示例 4：
 输入：m = 3, n = 3
 输出：6

 */

import Foundation

class Solution62 {
    
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        var dpArray = [Int](repeating: 1, count: m)
        
        for _ in 1..<n {
            for j in 1..<m {
                dpArray[j] = dpArray[j] + dpArray[j - 1]
            }
        }
        return dpArray.last!
    }
    
    // 一维数组动态规划
    // 执行用时：4 ms, 在所有 Swift 提交中击败了77.56%的用户
    // 内存消耗：13.6 MB, 在所有 Swift 提交中击败了12.18%的用户
    func uniquePaths1(_ m: Int, _ n: Int) -> Int {
        
        let col = min(m, n)
        let row = max(m, n)
        
        var dpArray = [Int](repeating: 1, count: col)
        
        for _ in 1..<row {
            for j in 1..<col {
                dpArray[j] = dpArray[j] + dpArray[j - 1]
            }
        }
        return dpArray.last!
    }
}
