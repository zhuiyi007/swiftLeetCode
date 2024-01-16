//
//  56 跳跃游戏 II.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/16.
//
//  https://leetcode.cn/problems/jump-game-ii/description/?envType=study-plan-v2&envId=top-interview-150

/**
 给定一个长度为 n 的 0 索引整数数组 nums。初始位置为 nums[0]。

 每个元素 nums[i] 表示从索引 i 向前跳转的最大长度。换句话说，如果你在 nums[i] 处，你可以跳转到任意 nums[i + j] 处:

 0 <= j <= nums[i]
 i + j < n
 返回到达 nums[n - 1] 的最小跳跃次数。生成的测试用例可以到达 nums[n - 1]。

  

 示例 1:

 输入: nums = [2,3,1,1,4]
 输出: 2
 解释: 跳到最后一个位置的最小跳跃数是 2。
      从下标为 0 跳到下标为 1 的位置，跳 1 步，然后跳 3 步到达数组的最后一个位置。
 示例 2:

 输入: nums = [2,3,0,1,4]
 输出: 2
  

 提示:

 1 <= nums.length <= 104
 0 <= nums[i] <= 1000
 题目保证可以到达 nums[n-1]
 */
import Foundation

class Classics150_Solution45 {
    
    /**
     执行用时分布 88 ms 击败 28.47% 使用 Swift 的用户
     消耗内存分布 15.68 MB 击败 5.11% 使用 Swift 的用户
     */
    func jump(_ nums: [Int]) -> Int {
        /// 上一步跳跃时能到达的最远位置
        var end = 0
        /// 当前位置能跳到的最远位置
        var currentMaxTarget = 0
        /// 跳跃的次数
        var jumpCount = 0
        for index in 0..<nums.count - 1 {
            /// 更新当前位置能跳到的最远位置
            currentMaxTarget = max(currentMaxTarget, nums[index] + index)
            /// 上一次跳跃处理完成
            /// 开始处理下一次跳跃的情况
            if index == end {
                /// 下一次跳跃最远能到达的地方
                end = currentMaxTarget
                /// 跳跃次数+1
                jumpCount += 1
            }
        }
        return jumpCount
    }
}


