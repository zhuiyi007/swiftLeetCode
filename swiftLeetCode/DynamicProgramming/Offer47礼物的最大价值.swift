//
//  Offer47礼物的最大价值.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/6/29.
//
//  https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/
//  剑指 Offer 47. 礼物的最大价值
/*
在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？
 
 示例 1:

 输入:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 输出: 12
 解释: 路径 1→3→5→2→1 可以拿到最多价值的礼物
 */


import Foundation

class SolutionOffer47 {
    
    // 优化为一维数组
    // 执行用时：68 ms, 在所有 Swift 提交中击败了96.39%的用户
    // 内存消耗：13.7 MB, 在所有 Swift 提交中击败了95.18%的用户
    func maxValue(_ grid: [[Int]]) -> Int {

        if grid.count == 0 {
            return 0
        }
        // dpArray[i]代表拿到当前礼物时的最大价值
        var dpArray = [Int](repeating: 0, count: grid[0].count + 1)
        for i in 0..<grid.count {
            for j in 1...grid[i].count {
                
                dpArray[j] = max(dpArray[j], dpArray[j - 1]) + grid[i][j - 1]
            }
        }
        return dpArray.last!
    }
    
    // 执行用时：72 ms, 在所有 Swift 提交中击败了68.67%的用户
    // 内存消耗：13.9 MB, 在所有 Swift 提交中击败了83.13%的用户
    func maxValue1(_ grid: [[Int]]) -> Int {

        if grid.count == 0 {
            return 0
        }
        // dpArray[i][j]代表拿到当前礼物时的最大价值
        var dpArray = [[Int]](repeating: [Int](repeating: 0, count: grid[0].count + 1), count: grid.count + 1)
        for i in 1..<dpArray.count {
            for j in 1..<dpArray[i].count {
                
                let left = dpArray[i - 1][j]
                let top = dpArray[i][j - 1]
                let max = left > top ? left : top
                
                dpArray[i][j] = max + grid[i - 1][j - 1]
            }
        }
        return dpArray[grid.count][grid[grid.count - 1].count]
    }
}
