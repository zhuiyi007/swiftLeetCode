//
//  169 多数元素.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/12.
//
//  https://leetcode.cn/problems/majority-element/description/?envType=study-plan-v2&envId=top-interview-150

/**
 给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

  

 示例 1：

 输入：nums = [3,2,3]
 输出：3
 示例 2：

 输入：nums = [2,2,1,1,1,2,2]
 输出：2
  

 提示：
 n == nums.length
 1 <= n <= 5 * 104
 -109 <= nums[i] <= 109
  

 进阶：尝试设计时间复杂度为 O(n)、空间复杂度为 O(1) 的算法解决此问题。
 */
import Foundation

class Classics150_Solution169 {
    /**
     执行用时分布 108 ms 击败 23.83% 使用 Swift 的用户
     消耗内存分布 16.99 MB 击败 7.48% 使用 Swift 的用户
     */
    /**
     投票法
     由于总有一个大于一半数量的数字
     所以,当这个数字出现一次,就+1
     其他数字出现一次,就-1
     最开始不需要关心谁是这个数字,最终能剩下来的数字就是结果
     */
    func majorityElement(_ nums: [Int]) -> Int {
        var num = nums[0], count = 1
        for i in 1..<nums.count {
            if nums[i] == num {
                count += 1
            } else {
                count -= 1
                if count < 0 {
                    num = nums[i]
                    count = 0
                }
            }
        }
        return num
    }
}
