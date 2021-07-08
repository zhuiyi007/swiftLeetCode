//
//  239滑动窗口最大值.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/6.
//  239. 滑动窗口最大值
//  https://leetcode-cn.com/problems/sliding-window-maximum/
//  相同题目:
//  剑指 Offer 59 - I. 滑动窗口的最大值
//  https://leetcode-cn.com/problems/hua-dong-chuang-kou-de-zui-da-zhi-lcof/

/**
 给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。
 返回滑动窗口中的最大值。

 示例 1：
 输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
 输出：[3,3,5,5,6,7]
 解释：
 滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 
 示例 2：
 输入：nums = [1], k = 1
 输出：[1]
 
 示例 3：
 输入：nums = [1,-1], k = 1
 输出：[1,-1]
 
 示例 4：
 输入：nums = [9,11], k = 2
 输出：[11]
 
 示例 5：
 输入：nums = [4,-2], k = 2
 输出：[4]
 */

import Foundation

class Solution239 {
    
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        
        if k <= 1 {
            return nums
        }
        
        var result = [Int]()
        var tmpQueue = [Int]()
        
        for i in 0..<nums.count {
            
            // 当前元素比队尾元素大,则不断删除队尾元素
            while tmpQueue.count > 0 && nums[i] > nums[tmpQueue.last!] {
                tmpQueue.removeLast()
            }
            // 插入到队列中
            tmpQueue.append(i)
            
            // 将不合法的序号出队
            if tmpQueue.first! < i - k + 1 {
                tmpQueue.removeFirst()
            }
            
            if i >= k - 1 {
                // 从队列头部取出
                result.append(nums[tmpQueue.first!])
            }
        }
        
        return result
    }
}
