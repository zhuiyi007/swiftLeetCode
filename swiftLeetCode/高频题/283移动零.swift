//
//  283移动零.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/20.
//  283. 移动零
//  https://leetcode-cn.com/problems/move-zeroes

/**
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 示例:

 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 */

import Foundation


class Solution283 {
    
    // 执行用时：32 ms, 在所有 Swift 提交中击败了100.00%的用户
    // 内存消耗：14.3 MB, 在所有 Swift 提交中击败了29.46%的用户
    func moveZeroes(_ nums: inout [Int]) {
        
        // 0位置先赋一个非法值,防止出现传入的数组中没有0的情况
        var zeroLoc = -1
        for i in 0..<nums.count {
            
            if nums[i] != 0 && zeroLoc >= 0 {
                // 找到非0的数值,与0进行交换
                nums[zeroLoc] = nums[i]
                nums[i] = 0
                zeroLoc += 1
            } else if nums[i] == 0 && zeroLoc == -1 {
                // 找到首个0的位置,赋值给zeroLoc
                zeroLoc = i
            }
        }
    }
}
