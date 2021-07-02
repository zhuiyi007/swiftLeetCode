//
//  88合并两个有序数组.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/2.
//  88. 合并两个有序数组
//  https://leetcode-cn.com/problems/merge-sorted-array

/**
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。你可以假设 nums1 的空间大小等于 m + n，这样它就有足够的空间保存来自 nums2 的元素。

 示例 1：
 输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 输出：[1,2,2,3,5,6]
 
 示例 2：
 输入：nums1 = [1], m = 1, nums2 = [], n = 0
 输出：[1]
 */

import Foundation

class Solution88 {
    
    // 执行用时：12 ms, 在所有 Swift 提交中击败了82.28%的用户
    // 内存消耗：13.6 MB, 在所有 Swift 提交中击败了58.98%的用户
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

        var i = m - 1, j = n - 1
        var point = m + n - 1
        // 从后往前遍历
        while j >= 0 {
            if i < 0 || nums2[j] >= nums1[i] {
                nums1[point] = nums2[j]
                j -= 1
                point -= 1
            } else {
                nums1[point] = nums1[i]
                point -= 1
                i -= 1
            }
        }
    }
}
