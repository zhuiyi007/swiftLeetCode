//
//  11盛最多水的容器.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/27.
//  11. 盛最多水的容器
//  https://leetcode-cn.com/problems/container-with-most-water

/**
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

 说明：你不能倾斜容器。

 示例 1：
 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
 
 示例 2：
 输入：height = [1,1]
 输出：1
 
 示例 3：
 输入：height = [4,3,2,1,4]
 输出：16
 
 示例 4：
 输入：height = [1,2,1]
 输出：2
 */

import Foundation

class Solution11 {
    
    // 执行用时：640 ms, 在所有 Swift 提交中击败了94.58%的用户
    // 内存消耗：17.6 MB, 在所有 Swift 提交中击败了33.90%的用户
    func maxArea(_ height: [Int]) -> Int {
        
        var left = 0
        var right = height.count - 1
        var result = 0
        while left < right {
            
            // 记录当前最低的那根柱子
            let minHeight = min(height[left], height[right])
            let tmpResult =  minHeight * (right - left)
            if tmpResult > result {
                result = tmpResult
            }
            // 忽略中间比当前最低的柱子还低的柱子
            while left < right && height[left] <= minHeight {
                left += 1
            }
            while left < right && height[right] <= minHeight {
                right -= 1
            }
        }
        return result
    }
}
