//
//  27 移除元素.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/12.
//
//  https://leetcode.cn/problems/remove-element/?envType=study-plan-v2&envId=top-interview-150

/**
 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。

 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。

 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。

  

 说明:

 为什么返回数值是整数，但输出的答案是数组呢?

 请注意，输入数组是以「引用」方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。

 你可以想象内部操作如下:

 // nums 是以“引用”方式传递的。也就是说，不对实参作任何拷贝
 int len = removeElement(nums, val);

 // 在函数里修改输入数组对于调用者是可见的。
 // 根据你的函数返回的长度, 它会打印出数组中 该长度范围内 的所有元素。
 for (int i = 0; i < len; i++) {
     print(nums[i]);
 }
  

 示例 1：

 输入：nums = [3,2,2,3], val = 3
 输出：2, nums = [2,2]
 解释：函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。你不需要考虑数组中超出新长度后面的元素。例如，函数返回的新长度为 2 ，而 nums = [2,2,3,3] 或 nums = [2,2,0,0]，也会被视作正确答案。
 示例 2：

 输入：nums = [0,1,2,2,3,0,4,2], val = 2
 输出：5, nums = [0,1,3,0,4]
 解释：函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。注意这五个元素可为任意顺序。你不需要考虑数组中超出新长度后面的元素。
  

 提示：

 0 <= nums.length <= 100
 0 <= nums[i] <= 50
 0 <= val <= 100
 */
import Foundation

class Classics150_Solution27 {
    /**
     头尾双指针方案
     执行用时分布 8 ms 击败 47.31% 使用 Swift 的用户
     消耗内存分布 15.03 MB 击败 27.24% 使用 Swift 的用户
     */
    func removeElement1(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0, j = nums.count - 1
        while i <= j {
            if nums[i] == val {
                /// 找到了一个要删除的值
                /// 从队尾找一个值来替代
                nums[i] = nums[j]
                j -= 1
            }
            if nums[i] != val {
                /// 需要检查一下赋值过来的数是不是要删除的数
                /// 如果不是要删除的数,则指针后移
                i += 1
            }
        }
        return i
    }
    
    /**
     头部双指针方案
     执行用时分布 4 ms 击败 84.23% 使用 Swift 的用户
     消耗内存分布 15.25 MB 击败 17.21% 使用 Swift 的用户
     */
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var slow = 0, fast = 0, count = nums.count
        while fast < count  {
            if nums[fast] != val {
                /// 找到了一个不需要删除的值
                /// 赋值给慢指针
                /// 同时慢指针后移
                nums[slow] = nums[fast]
                slow += 1
            }
            /// 快指针每次都后移
            fast += 1
        }
        return slow
    }
}








