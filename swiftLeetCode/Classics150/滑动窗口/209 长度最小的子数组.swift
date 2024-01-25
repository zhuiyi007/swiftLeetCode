//
//  209 长度最小的子数组.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/24.
//
//  https://leetcode.cn/problems/minimum-size-subarray-sum/description/?envType=study-plan-v2&envId=top-interview-150

/**
 给定一个含有 n 个正整数的数组和一个正整数 target 。

 找出该数组中满足其总和大于等于 target 的长度最小的 连续子数组 [numsl, numsl+1, ..., numsr-1, numsr] ，并返回其长度。如果不存在符合条件的子数组，返回 0 。

  

 示例 1：

 输入：target = 7, nums = [2,3,1,2,4,3]
 输出：2
 解释：子数组 [4,3] 是该条件下的长度最小的子数组。
 示例 2：

 输入：target = 4, nums = [1,4,4]
 输出：1
 示例 3：

 输入：target = 11, nums = [1,1,1,1,1,1,1,1]
 输出：0
  

 提示：

 1 <= target <= 109
 1 <= nums.length <= 105
 1 <= nums[i] <= 105
  

 进阶：

 如果你已经实现 O(n) 时间复杂度的解法, 请尝试设计一个 O(n log(n)) 时间复杂度的解法。
 */

import Foundation

class Classics150_Solution209 {
    
    /**
     滑动窗口
     执行用时分布 266 ms 击败 33.61% 使用 Swift 的用户
     消耗内存分布 19.50 MB 击败 6.56% 使用 Swift 的用户
     */
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        let count = nums.count
        if count == 0 {
            return 0
        }
        var start = 0, end = 0
        var result = Int.max
        var sum = 0
        while end < count {
            sum += nums[end]
            while sum >= target {
                /// 找到了合适的组合
                /// 更新result
                result = min(result, end - start + 1)
                /// start右移,同时减去start
                sum -= nums[start]
                start += 1
            }
            /// 没有找到合适的组合
            /// end右移
            end += 1
        }
        return result == Int.max ? 0 : result
    }
    
    /**
     暴力法
     执行用时分布 1773 ms 击败 5.74% 使用 Swift 的用户
     消耗内存分布 19.63 MB 击败 6.56% 使用 Swift 的用户
     */
    func minSubArrayLen1(_ target: Int, _ nums: [Int]) -> Int {
        let count = nums.count
        if count == 0 {
            return 0
        }
        var start = 0, end = 0
        var result = 0
        var sum = 0
        while start < count {
            if start == end {
                /// 起点终点相同
                /// 则只统计一遍
                sum = nums[start]
            } else {
                /// 起终点不同,则证明end指针有变动,结果累加上end
                sum += nums[end]
            }
            if sum < target {
                /// 结果小于目标
                /// end指针右移
                end += 1
                if end == count {
                    /// end指针走到了最后
                    /// 但是还没有合适的组合
                    /// 那么,后续的循环只会比当前值更小
                    /// 所以,可以直接退出
                    break
                }
            } else {
                /// 找到了结果,更新结果
                result = result == 0 ? end - start + 1 : min(result, end - start + 1)
                /// 同时重新开始寻找
                start += 1
                end = start
            }
        }
        return result
    }
}
