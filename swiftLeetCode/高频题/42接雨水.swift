//
//  42接雨水.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2021/8/26.
//  42. 接雨水
//  https://leetcode-cn.com/problems/trapping-rain-water/

/**
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
 示例 1：
 输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
 输出：6
 解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。
 
 示例 2：
 输入：height = [4,2,0,3,2,5]
 输出：9

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/trapping-rain-water
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
class Solution42 {
    
    // 执行用时：52 ms, 在所有 Swift 提交中击败了19.48%的用户
    // 内存消耗：14.3 MB, 在所有 Swift 提交中击败了5.19%的用户
    func trap(_ height: [Int]) -> Int {
        
        if height.count <= 2 {
            return 0
        }
        // 找到当前柱子左右两边最高的柱子
        var leftMax = [Int](repeating: 0, count: height.count)
        var rightMax = [Int](repeating: 0, count: height.count)
        
        for index in 1..<height.count {
            leftMax[index] = max(leftMax[index - 1], height[index - 1])
        }
        
        for index in (1..<height.count - 1).reversed() {
            rightMax[index] = max(rightMax[index + 1], height[index + 1])
        }
        
        var totalHeight = 0
        for index in 1..<height.count {
            // 计算当前柱子能存多少水
            // 能存多少水取决于左右两边的最低的柱子跟当前柱子的差值
            let h = min(leftMax[index], rightMax[index])
            totalHeight += h - height[index] > 0 ? h - height[index] : 0
        }
        return totalHeight
    }
}
