//
//  46全排列.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/15.
//  46. 全排列
//  https://leetcode-cn.com/problems/permutations

/**
 给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。

 示例 1：
 输入：nums = [1,2,3]
 输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 
 示例 2：
 输入：nums = [0,1]
 输出：[[0,1],[1,0]]
 
 示例 3：
 输入：nums = [1]
 输出：[[1]]
  
 提示：
 1 <= nums.length <= 6
 -10 <= nums[i] <= 10
 nums 中的所有整数 互不相同
 */

import Foundation

class Solution46 {
    
    var result = [[Int]]()
    // 执行用时：12 ms, 在所有 Swift 提交中击败了100.00%的用户
    // 内存消耗：13.6 MB, 在所有 Swift 提交中击败了82.97%的用户
    func permute(_ nums: [Int]) -> [[Int]] {
        
        var tmpNums = nums
        _dfs(0, &tmpNums)
        return result
    }
    
    private func _dfs(_ index: Int, _ nums: inout [Int]) {
        
        // 如果遍历完成,则添加结果
        if index == nums.count {
            result.append(nums)
            return
        }
        
        for i in index..<nums.count {
            // 交换index与i
            // 交换完成天然就进行了排重效果
            _swap(i, index, &nums)
            // 钻入下一层
            _dfs(index + 1, &nums)
            // 恢复现场
            _swap(i, index, &nums)
        }
    }
    
    private func _swap(_ fromIndex: Int, _ toIndex: Int, _ nums: inout [Int]) {
        
        if fromIndex == toIndex {
            return
        }
        let tmp = nums[fromIndex]
        nums[fromIndex] = nums[toIndex]
        nums[toIndex] = tmp
    }
    
    

    var tmpResult = [Int]()
    // 执行用时：24 ms, 在所有 Swift 提交中击败了37.12%的用户
    // 内存消耗：13.7 MB, 在所有 Swift 提交中击败了69.43%的用户
    func permute1(_ nums: [Int]) -> [[Int]] {
        
        // 从第0层开始遍历
        _dfs1(0, nums)
        return result
    }
    
    private func _dfs1(_ index: Int, _ nums: [Int]) {
        
        // 如果遍历完成,则添加结果
        if index == nums.count {
            result.append(tmpResult)
            return
        }
        
        for item in nums {
            // 如果当前选择在之前已经选择过,则直接continue
            // ⚠️此处会进行O(n)级别的判断,影响代码效率
            if tmpResult.contains(item) {
                continue
            }
            // 进行选择
            tmpResult.append(item)
            // 钻入下一层
            _dfs1(index + 1, nums)
            // 恢复现场
            tmpResult.removeLast()
        }
    }
}
