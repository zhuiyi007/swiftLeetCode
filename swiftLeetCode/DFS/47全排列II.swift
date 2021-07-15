//
//  47全排列II.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/15.
//  47. 全排列 II
//  https://leetcode-cn.com/problems/permutations-ii

/**
 给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。

 示例 1：
 输入：nums = [1,1,2]
 输出：
 [[1,1,2],
  [1,2,1],
  [2,1,1]]
 
 示例 2：
 输入：nums = [1,2,3]
 输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 */
import Foundation

class Solution47 {
    
    // 执行用时：32 ms, 在所有 Swift 提交中击败了98.33%的用户
    // 内存消耗：14.2 MB, 在所有 Swift 提交中击败了16.67%的用户
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var tmpNums = nums
        var result = [[Int]]()
        _dfs(0, &tmpNums, &result)
        return result
    }
    
    private func _dfs(_ index: Int, _ nums: inout [Int], _ result: inout [[Int]]) {
        
        // 如果遍历完成,则添加结果
        if index == nums.count {
            result.append(nums)
            return
        }
        
        for i in index..<nums.count {
            
            // 往前遍历一下当前要处理的位置之前是否有重复
            var isRepeat = false
            for j in index...i{
                if i != j && nums[j] == nums[i] {
                    isRepeat = true
                    break
                }
            }
            if isRepeat {
                continue
            }
            // 交换index与i
            // 交换完成天然就进行了排重效果
            _swap(i, index, &nums)
            // 钻入下一层
            _dfs(index + 1, &nums, &result)
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
}
