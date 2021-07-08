//
//  654最大二叉树.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/8.
//  654. 最大二叉树
//  https://leetcode-cn.com/problems/maximum-binary-tree
/**
 给定一个不含重复元素的整数数组 nums 。一个以此数组直接递归构建的 最大二叉树 定义如下：

 二叉树的根是数组 nums 中的最大元素。
 左子树是通过数组中 最大值左边部分 递归构造出的最大二叉树。
 右子树是通过数组中 最大值右边部分 递归构造出的最大二叉树。
 返回有给定数组 nums 构建的 最大二叉树 。

 示例 1：
 输入：nums = [3,2,1,6,0,5]
 输出：[6,3,5,null,2,0,null,null,1]
 解释：递归调用如下所示：
 - [3,2,1,6,0,5] 中的最大值是 6 ，左边部分是 [3,2,1] ，右边部分是 [0,5] 。
     - [3,2,1] 中的最大值是 3 ，左边部分是 [] ，右边部分是 [2,1] 。
         - 空数组，无子节点。
         - [2,1] 中的最大值是 2 ，左边部分是 [] ，右边部分是 [1] 。
             - 空数组，无子节点。
             - 只有一个元素，所以子节点是一个值为 1 的节点。
     - [0,5] 中的最大值是 5 ，左边部分是 [0] ，右边部分是 [] 。
         - 只有一个元素，所以子节点是一个值为 0 的节点。
         - 空数组，无子节点。
 
 示例 2：
 输入：nums = [3,2,1]
 输出：[3,null,2,null,1]

 */

import Foundation

class Solution654 {
    
    // 执行用时：108 ms, 在所有 Swift 提交中击败了100.00%的用户
    // 内存消耗：14.3 MB, 在所有 Swift 提交中击败了13.79%的用户
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        
        return _findRoot(nums, left: 0, right: nums.count)
    }
    
    private func _findRoot(_ nums:[Int], left:Int, right:Int) -> TreeNode? {
        
        if left == right {
            return nil
        }
        
        // 最大值的下标
        var maxIds = left
        for i in left..<right {
            if nums[i] > nums[maxIds] {
                maxIds = i
            }
        }
        let root = TreeNode(nums[maxIds])
        // 依次去找左子树和右子树
        root.left = _findRoot(nums, left: left, right: maxIds)
        root.right = _findRoot(nums, left: maxIds + 1, right: right)
        
        return root
    }
}
