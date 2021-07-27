//
//  15三数之和.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/20.
//  15. 三数之和
//  https://leetcode-cn.com/problems/3sum
/**
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
 注意：答案中不可以包含重复的三元组。

 示例 1：
 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 
 示例 2：
 输入：nums = []
 输出：[]
 
 示例 3：
 输入：nums = [0]
 输出：[]
 */

import Foundation

class Solution15 {
    
    // 执行用时：160 ms, 在所有 Swift 提交中击败了98.97%的用户
    // 内存消耗：17.8 MB, 在所有 Swift 提交中击败了12.89%的用户
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        // 小于三个元素的时候直接返回
        if nums.count < 3 {
            return []
        }
        // 先对原始数据进行排序
        let sortNums = nums.sorted()
        var resultArray = [[Int]]()
        // 从开头进行遍历
        for current in 0..<sortNums.count {
            // 在遍历过程中,不断移动left和right
            var left = current + 1
            var right = sortNums.count - 1
            // 如果当前字符和前一个字符相同,则直接跳过
            if current > 0 && sortNums[current] == sortNums[current - 1] {
                continue
            }
            // 当左指针小于右指针时进行循环
            while left < right {
                // 先算出来当前的结果
                let result = sortNums[current] + sortNums[left] + sortNums[right]
                // 如果结果为0
                if result == 0 {
                    // 添加结果
                    resultArray.append([sortNums[current], sortNums[left], sortNums[right]])
                    // 左指针往右移,同时过滤掉相同的元素
                    while left < right && sortNums[left] == sortNums[left + 1] {
                        left += 1
                    }
                    // 右指针往左移,同时过滤掉相同的元素
                    while left < right && sortNums[right] == sortNums[right - 1] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                } else if result > 0 {
                    // 如果结果大于零,需要往小凑,因此需要右指针往左移
                    right -= 1
                } else {
                    // 结果小于零,需要往大凑,需要左指针往右移
                    left += 1
                }
            }
        }
        return resultArray
    }
}
