//
//  977有序数组的平方.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/2.
//  977. 有序数组的平方
//  https://leetcode-cn.com/problems/squares-of-a-sorted-array

/**
 给你一个按 非递减顺序 排序的整数数组 nums，返回 每个数字的平方 组成的新数组，要求也按 非递减顺序 排序。

 示例 1：
 输入：nums = [-4,-1,0,3,10]
 输出：[0,1,9,16,100]
 解释：平方后，数组变为 [16,1,0,9,100]
 排序后，数组变为 [0,1,9,16,100]
 
 示例 2：
 输入：nums = [-7,-3,2,3,11]
 输出：[4,9,9,49,121]

 进阶：
 请你设计时间复杂度为 O(n) 的算法解决本问题
 */

import Foundation

class Solution977 {
    
    // 执行用时：328 ms, 在所有 Swift 提交中击败了63.93%的用户
    // 内存消耗：15.5 MB, 在所有 Swift 提交中击败了11.48%的用户
    func sortedSquares(_ nums: [Int]) -> [Int] {

        let arrayCount = nums.count
        if arrayCount == 0 {
            return nums
        }
        
        var array = [Int](repeating: 0, count: nums.count)
        var left = 0
        var right = arrayCount - 1
        
        for i in (0..<arrayCount).reversed() {
            
            let leftSquare = nums[left] * nums[left]
            let rightSquare = nums[right] * nums[right]
            if rightSquare > leftSquare {
                // 右边的比左边的大
                array[i] = rightSquare
                right -= 1
            } else {
                // 左边比右边大
                array[i] = leftSquare
                left += 1
            }
        }
        return array
    }
}
