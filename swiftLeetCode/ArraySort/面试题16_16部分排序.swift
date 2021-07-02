//
//  面试题16_16部分排序.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/2.
//  面试题 16.16. 部分排序
//  https://leetcode-cn.com/problems/sub-sort-lcci

/**
 给定一个整数数组，编写一个函数，找出索引m和n，只要将索引区间[m,n]的元素排好序，整个数组就是有序的。注意：n-m尽量最小，也就是说，找出符合条件的最短序列。函数返回值为[m,n]，若不存在这样的m和n（例如整个数组是有序的），请返回[-1,-1]。

 示例：
 输入： [1,2,4,7,10,11,7,12,6,7,16,18,19]
 输出： [3,9]
 */

import Foundation

class Solution16_16 {
    
    // 执行用时：716 ms, 在所有 Swift 提交中击败了60.98%的用户
    // 内存消耗：22.9 MB, 在所有 Swift 提交中击败了19.51%的用户
    func subSort(_ array: [Int]) -> [Int] {

        let arrayCount = array.count
        
        if arrayCount == 0 {
            return [-1, -1]
        }
        var left = -1, right = -1
        var tmp = array[0]
        // 从左往右寻找最右边的逆序对,即为right的位置
        for i in 0..<arrayCount {
            if array[i] > tmp  {
                tmp = array[i]
            }
            if array[i] < tmp {
                right = i
            }
        }
        // 如果遍历一遍后没有发现逆序对,可以提前退出
        if right == -1 {
            return [left, right]
        }
        // 在从右往左寻找最左边的逆序对,为left的位置
        for i in (0..<arrayCount).reversed() {
            if array[i] < tmp  {
                tmp = array[i]
            }
            if array[i] > tmp {
                left = i
            }
        }
        
        return [left, right]
    }
}
