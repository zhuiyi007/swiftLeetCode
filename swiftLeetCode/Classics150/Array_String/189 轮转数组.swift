//
//  189 轮转数组.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/12.
//
//  https://leetcode.cn/problems/rotate-array/description/?envType=study-plan-v2&envId=top-interview-150

/**
 给定一个整数数组 nums，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。

  

 示例 1:

 输入: nums = [1,2,3,4,5,6,7], k = 3
 输出: [5,6,7,1,2,3,4]
 解释:
 向右轮转 1 步: [7,1,2,3,4,5,6]
 向右轮转 2 步: [6,7,1,2,3,4,5]
 向右轮转 3 步: [5,6,7,1,2,3,4]
 示例 2:

 输入：nums = [-1,-100,3,99], k = 2
 输出：[3,99,-1,-100]
 解释:
 向右轮转 1 步: [99,-1,-100,3]
 向右轮转 2 步: [3,99,-1,-100]
  

 提示：

 1 <= nums.length <= 105
 -231 <= nums[i] <= 231 - 1
 0 <= k <= 105
  

 进阶：

 尽可能想出更多的解决方案，至少有 三种 不同的方法可以解决这个问题。
 你可以使用空间复杂度为 O(1) 的 原地 算法解决这个问题吗？
 */

import Foundation

class Classics150_Solution189 {
    /**
     额外数组的方式
     时间复杂度O(n),空间复杂度O(n)
     执行用时分布 244 ms 击败 18.66% 使用 Swift 的用户
     消耗内存分布 22.44 MB 击败 12.44% 使用 Swift 的用户
     */
    func rotate1(_ nums: inout [Int], _ k: Int) {
        let tempNums = Array(nums)
        let numCount = nums.count
        for index in 0..<numCount {
            nums[(index + k) % numCount] = tempNums[index]
        }
    }
    
    /**
     多次翻转,先整体翻转,再对k位置分隔的左右两个子数组分别翻转
     执行用时分布 240 ms 击败 22.97% 使用 Swift 的用户
     消耗内存分布 22.30 MB 击败 16.75% 使用 Swift 的用户
     */
    func rotate2(_ nums: inout [Int], _ k: Int) {
        /// 先整体翻转
        let count = nums.count
        var start = 0, end = count - 1
        reverse(&nums, &start, &end)
        
        /// 处理一些特殊情况,避免越界的情况
        let processK = k % count
        
        /// 0 - (k - 1) 位置的元素再进行翻转
        start = 0
        end = processK - 1
        reverse(&nums, &start, &end)
        /// k - (count - 1) 位置的元素再进行翻转
        start = processK
        end = nums.count - 1
        reverse(&nums, &start, &end)
    }
    
    func reverse(_ nums: inout [Int], _ start: inout Int, _ end: inout Int) {
        while start < end {
            let temp = nums[start]
            nums[start] = nums[end]
            nums[end] = temp
            start += 1
            end -= 1
        }
    }
    
    /**
     从0位置开始,依次往后替换,直到替换回0位置,再开始下一次循环,总共循环次数为k和数组个数的最大公约数
     执行用时分布 240 ms 击败 25.23% 使用 Swift 的用户
     消耗内存分布 22.49 MB 击败 10.75% 使用 Swift 的用户
     */
    func rotate(_ nums: inout [Int], _ k: Int) {
        let numsCount = nums.count
        let processK = k % numsCount
        /// 循环次数:k和数组个数的最大公约数
        let loopCount = gcd(processK, numsCount)
        
        for start in 0..<loopCount {
            var current = start, lastPositionNum = nums[start]
            while true {
                /// 当前元素移动后的位置
                let targetPosition = (current + processK) % numsCount
                /// 先记录一下移动后目标位置的数值
                let tempLastNum = nums[targetPosition]
                /// 拿上一次纪录的数值替换目标位置的数值
                nums[targetPosition] = lastPositionNum
                /// 更新上一次纪录的数值
                lastPositionNum = tempLastNum
                /// 更新当前位置
                current = targetPosition
                /// 如果当前替换到了开始位置
                /// 则退出此次循环
                if start == current {
                    break
                }
            }
        }
    }
    
    /// 求最大公约数
    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
}
