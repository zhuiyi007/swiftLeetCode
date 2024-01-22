//
//  55 跳跃游戏.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/16.
//
//  https://leetcode.cn/problems/jump-game/description/?envType=study-plan-v2&envId=top-interview-150

/**
 给你一个非负整数数组 nums ，你最初位于数组的 第一个下标 。数组中的每个元素代表你在该位置可以跳跃的最大长度。

 判断你是否能够到达最后一个下标，如果可以，返回 true ；否则，返回 false 。

  

 示例 1：

 输入：nums = [2,3,1,1,4]
 输出：true
 解释：可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。
 示例 2：

 输入：nums = [3,2,1,0,4]
 输出：false
 解释：无论怎样，总会到达下标为 3 的位置。但该下标的最大跳跃长度是 0 ， 所以永远不可能到达最后一个下标。
  

 提示：

 1 <= nums.length <= 104
 0 <= nums[i] <= 105
 */
import Foundation

class Classics150_Solution55 {
    /**
     执行用时分布 412 ms 击败 21.57% 使用 Swift 的用户
     消耗内存分布 15.47 MB 击败 7.84% 使用 Swift 的用户
     */
    func canJump(_ nums: [Int]) -> Bool {
        /// 目标要跳到的位置
        let target = nums.count - 1
        /// 当前最远能跳到的位置
        var currentMaxTarget = 0
        for index in 0..<nums.count {
            /// 如果跳跃过程中发现
            /// 已经跳过了最远可达的距离
            /// 直接return
            if index > currentMaxTarget {
                return false
            }
            /// 更新当前位置能跳到的最远距离
            currentMaxTarget = max(currentMaxTarget, index + nums[index])
            /// 如果已经跳到了终点,则直接return
            if currentMaxTarget >= target {
                return true
            }
        }
        return false
    }
}




