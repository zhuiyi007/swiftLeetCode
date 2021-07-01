//
//  64最小路径和.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/6/30.
//  64. 最小路径和
//  https://leetcode-cn.com/problems/minimum-path-sum/

/**
 给定一个包含非负整数的 m x n 网格 grid ，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。

 说明：每次只能向下或者向右移动一步。
 
 示例 1：
 输入：grid = [[1,3,1],[1,5,1],[4,2,1]]
 输出：7
 解释：因为路径 1→3→1→1→1 的总和最小。
 
 示例 2：
 输入：grid = [[1,2,3],[4,5,6]]
 输出：12
 */

import Foundation

class Solution64 {
    
    // 改为一维数组,优化空间复杂度
    // 执行用时：68 ms, 在所有 Swift 提交中击败了91.80%的用户
    // 内存消耗：13.9 MB, 在所有 Swift 提交中击败了72.13%的用户
    func minPathSum(_ grid: [[Int]]) -> Int {
        
        if grid.isEmpty {
            return 0
        }
        // 构建首行数据
        var dpArray = [Int](repeating: 2147483647, count: grid.first!.count + 1)
        dpArray[1] = grid[0][0]
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if i == 0 && j == 0 {
                    continue
                }
                dpArray[j + 1] = min(dpArray[j + 1], dpArray[j]) + grid[i][j]
            }
        }
        
        return dpArray.last!
    }
    
    // 执行用时：72 ms, 在所有 Swift 提交中击败了65.57%的用户
    // 内存消耗：14.4 MB, 在所有 Swift 提交中击败了5.74%的用户
    func minPathSum1(_ grid: [[Int]]) -> Int {
        
        // dpArray[i][j]存放从(0,0)到(i,j)的最小路径
        var dpArray = grid
        // 先构建数组,把[0][j]和[i][0]的位置填充为INT_MAX
        dpArray.insert([Int](repeating: 2147483647, count: grid.first!.count), at: 0)
        
        for i in 0..<dpArray.count {
            dpArray[i].insert(2147483647, at: 0)
        }
        for i in 1...grid.count {
            for j in 1...grid[i - 1].count {
                if i == 1 && j == 1 {
                    continue
                }
                dpArray[i][j] = min(dpArray[i - 1][j], dpArray[i][j - 1]) + grid[i - 1][j - 1]
            }
        }
        return dpArray[grid.count][grid[grid.count - 1].count]
    }
}
