//
//  7整数反转.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/27.
//  7. 整数反转
//  https://leetcode-cn.com/problems/reverse-integer

/**
 给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。
 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。
 假设环境不允许存储 64 位整数（有符号或无符号）。

 示例 1：
 输入：x = 123
 输出：321
 
 示例 2：
 输入：x = -123
 输出：-321
 
 示例 3：
 输入：x = 120
 输出：21
 
 示例 4：
 输入：x = 0
 输出：0
 */

import Foundation

class Solution7 {
    
    // 执行用时：4 ms, 在所有 Swift 提交中击败了95.41%的用户
    // 内存消耗：13.5 MB, 在所有 Swift 提交中击败了53.96%的用户
    func reverse(_ x: Int) -> Int {

        var result: Int32 = 0
        var num: Int32 = Int32(x)
        while num != 0 {
            // 防止越界
            if result > Int32.max / 10 || result < Int32.min / 10 {
                return 0
            }
            result = num % 10 + result * 10
            num = num / 10
        }
        return Int(result)
    }
}
