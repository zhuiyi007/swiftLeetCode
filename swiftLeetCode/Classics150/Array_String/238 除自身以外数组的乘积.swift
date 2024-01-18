//
//  238 除自身以外数组的乘积.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/17.
//
//  https://leetcode.cn/problems/product-of-array-except-self/description/?envType=study-plan-v2&envId=top-interview-150

/**
 给你一个整数数组 nums，返回 数组 answer ，其中 answer[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积 。

 题目数据 保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内。

 请 不要使用除法，且在 O(n) 时间复杂度内完成此题。

  

 示例 1:

 输入: nums = [1,2,3,4]
 输出: [24,12,8,6]
 示例 2:

 输入: nums = [-1,1,0,-3,3]
 输出: [0,0,9,0,0]
  

 提示：

 2 <= nums.length <= 105
 -30 <= nums[i] <= 30
 保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内
  

 进阶：你可以在 O(1) 的额外空间复杂度内完成这个题目吗？（ 出于对空间复杂度分析的目的，输出数组 不被视为 额外空间。）
 */
import Foundation

class Classics150_Solution238 {
    
    /**
     执行用时分布 166 ms 击败 26.52% 使用 Swift 的用户
     消耗内存分布 22.31 MB 击败 5.30% 使用 Swift 的用户
     */
    func productExceptSelf1(_ nums: [Int]) -> [Int] {
        /// 声明两个数组
        /// L:L[i]代表i位置元素左边所有元素的乘积
        /// R:R[j]代表j位置元素右边所有元素的乘积
        /// ans[i] = L[i] * R[j]
        let count = nums.count
        var L = [Int](repeating: 1, count: count)
        var R = [Int](repeating: 1, count: count)
        var ans = [Int](repeating: 1, count: count)
        var i = 1, j = count - 2
        for _ in 1..<count {
            L[i] = nums[i - 1] * L[i - 1]
            R[j] = nums[j + 1] * R[j + 1]
            i += 1
            j -= 1
        }
        for index in 0..<count {
            ans[index] = L[index] * R[index]
        }
        return ans
    }
    
    /**
     执行用时分布 169 ms 击败 18.94% 使用 Swift 的用户
     消耗内存分布 22.14 MB 击败 6.06% 使用 Swift 的用户
     */
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        /// 使用一个数组ans,并且最终返回这个数组,达到空间复杂度O(1)
        /// ans[i]中保存i元素左边元素的乘积
        /// 再反向遍历nums数组,从右到左乘一遍ans[j]
        let count = nums.count
        var ans = [Int](repeating: 1, count: count)
        for i in 1..<count {
            ans[i] = ans[i - 1] * nums[i - 1]
        }
        var R = 1
        for j in (0..<count).reversed() {
            ans[j] *= R
            R *= nums[j]
        }
        return ans
    }
}




