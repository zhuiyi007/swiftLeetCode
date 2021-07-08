//
//  面试题01_09字符串轮转.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/8.
//  面试题 01.09. 字符串轮转
//  https://leetcode-cn.com/problems/string-rotation-lcci

/**
 字符串轮转。给定两个字符串s1和s2，请编写代码检查s2是否为s1旋转而成（比如，waterbottle是erbottlewat旋转后的字符串）。

 示例1:
  输入：s1 = "waterbottle", s2 = "erbottlewat"
  输出：True
 
 示例2:
  输入：s1 = "aa", s2 = "aba"
  输出：False
 */

import Foundation

class Solution01_09 {
    
    // 执行用时：8 ms, 在所有 Swift 提交中击败了69.70%的用户
    // 内存消耗：14.4 MB, 在所有 Swift 提交中击败了57.58%的用户
    func isFlipedString(_ s1: String, _ s2: String) -> Bool {
        
        // 如果两个字符串长度不相等,返回false
        if s1.count != s2.count {
            return false
        }
        // 如果都是空串,返回true
        if s1 == "" && s2 == "" {
            return true
        }
        // 将s1与自己拼接起来,看其中是否包含s2
        return (s1 + s1).contains(s2)
    }
}
