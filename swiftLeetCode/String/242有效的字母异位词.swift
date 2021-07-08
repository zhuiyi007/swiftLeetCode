//
//  242有效的字母异位词.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/8.
//  242. 有效的字母异位词
//  https://leetcode-cn.com/problems/valid-anagram

/**
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

 示例 1:
 输入: s = "anagram", t = "nagaram"
 输出: true
 
 示例 2:
 输入: s = "rat", t = "car"
 输出: false
  
 提示:
 1 <= s.length, t.length <= 5 * 104
 s 和 t 仅包含小写字母
 */

import Foundation

class Solution242 {
    
    // 执行用时：20 ms, 在所有 Swift 提交中击败了93.22%的用户
    // 内存消耗：14.1 MB, 在所有 Swift 提交中击败了70.62%的用户
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        // 长度不相等,直接返回
        if s.count != t.count {
            return false
        }
        
        var letters = [Int](repeating: 0, count: 26)
        // 构建字母数组
        for c in s.unicodeScalars {
            
            letters[Int(c.value - 97)] += 1
        }
        // 查找是否都相同
        for c in t.unicodeScalars {
            
            if letters[Int(c.value - 97)] == 0 {
                return false
            }
            letters[Int(c.value - 97)] -= 1
        }
        return true
    }
}
