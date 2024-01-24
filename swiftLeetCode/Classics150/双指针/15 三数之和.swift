//
//  15 三数之和.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/22.
//
//  https://leetcode.cn/problems/3sum/description/?envType=study-plan-v2&envId=top-interview-150

/**
 给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。请

 你返回所有和为 0 且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

  

  

 示例 1：

 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 解释：
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0 。
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0 。
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0 。
 不同的三元组是 [-1,0,1] 和 [-1,-1,2] 。
 注意，输出的顺序和三元组的顺序并不重要。
 示例 2：

 输入：nums = [0,1,1]
 输出：[]
 解释：唯一可能的三元组和不为 0 。
 示例 3：

 输入：nums = [0,0,0]
 输出：[[0,0,0]]
 解释：唯一可能的三元组和为 0 。
  

 提示：

 3 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 */

import Foundation

class Classics150_Solution15 {
    
    /**
     执行用时分布 191 ms 击败 34.58% 使用 Swift 的用户
     消耗内存分布 19.74 MB 击败 12.54% 使用 Swift 的用户
     */
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        let sortNums = nums.sorted()
        var result = [[Int]]()
        
        /// 在每一轮大循环中,固定start值,让middle和end不断左右移动来寻找可能的答案
        for start in 0..<sortNums.count {
            if sortNums[start] > 0 {
                /// 因为数组是有序的
                /// 如果起始的数都大于0
                /// 后面就不用遍历了,肯定没有预期的结果
                break
            }
            if start > 0 && sortNums[start] == sortNums[start - 1] {
                /// 如果当前值与上一个值相等,则直接跳过
                continue
            }
            var middle = start + 1, end = sortNums.count - 1
            while middle < end {
                let count = sortNums[start] + sortNums[middle] + sortNums[end]
                if count == 0 {
                    /// 找到了符合预期的结果
                    result.append([sortNums[start], sortNums[middle], sortNums[end]])
                    /// 同时移动middle和end
                    /// 并且在过程中进行去重
                    while middle < end && sortNums[middle] == sortNums[middle + 1] {
                        middle += 1
                    }
                    while middle < end && sortNums[end] == sortNums[end - 1] {
                        end -= 1
                    }
                    middle += 1
                    end -= 1
                } else if count > 0 {
                    /// 结果大了,需要往小了凑
                    end -= 1
                } else {
                    /// 结果小了,需要往大了凑
                    middle += 1
                }
            }
        }
        return result
    }
}
