//
//  11 盛最多水的容器.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/22.
//
//  https://leetcode.cn/problems/container-with-most-water/description/?envType=study-plan-v2&envId=top-interview-150

/**
 给定一个长度为 n 的整数数组 height 。有 n 条垂线，第 i 条线的两个端点是 (i, 0) 和 (i, height[i]) 。

 找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

 返回容器可以储存的最大水量。

 说明：你不能倾斜容器。

  

 示例 1：



 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
 示例 2：

 输入：height = [1,1]
 输出：1
  

 提示：

 n == height.length
 2 <= n <= 105
 0 <= height[i] <= 104
 */

import Foundation

class Classics150_Solution11 {
    /**
     执行用时分布 621 ms 击败 11.34% 使用 Swift 的用户
     消耗内存分布 19.53 MB 击败 5.46% 使用 Swift 的用户
     */
    func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var result = 0
        while left < right {
            /// 记录两边最低的柱子
            let minHeight = min(height[left], height[right])
            let tempResult = minHeight * (right - left)
            if tempResult > result {
                result = tempResult
            }
            /// 比当前最低高度还低的柱子直接跳过
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
