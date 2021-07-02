//
//  75颜色分类.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/2.
//  75. 颜色分类
//  https://leetcode-cn.com/problems/sort-colors

/**
 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

 示例 1：
 输入：nums = [2,0,2,1,1,0]
 输出：[0,0,1,1,2,2]
 
 示例 2：
 输入：nums = [2,0,1]
 输出：[0,1,2]
 
 示例 3：
 输入：nums = [0]
 输出：[0]
 
 示例 4：
 输入：nums = [1]
 输出：[1]
 */

import Foundation

class Solution75 {
    
    // 执行用时：8 ms, 在所有 Swift 提交中击败了80.66%的用户
    // 内存消耗：13.6 MB, 在所有 Swift 提交中击败了62.43%的用户
    func sortColors(_ nums: inout [Int]) {
        
        // 三指针,0位置指针,2位置指针,当前遍历指针
        var point0 = 0, point2 = nums.count - 1
        var current = 0
        while current <= point2 {
            if nums[current] == 0 {
                // 如果当前位置是0,则跟0位置的元素交换
                nums[current] = nums[point0]
                nums[point0] = 0
                point0 += 1
                current += 1
            } else if nums[current] == 2 {
                // 如果当前位置是2,则跟2位置的元素交换
                nums[current] = nums[point2]
                nums[point2] = 2
                point2 -= 1
            } else {
                current += 1
            }
        }
        print(nums)
    }
}
