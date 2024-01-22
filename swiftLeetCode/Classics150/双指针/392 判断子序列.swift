//
//  392 判断子序列.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/22.
//
//  https://leetcode.cn/problems/is-subsequence/description/?envType=study-plan-v2&envId=top-interview-150

/**
 给定字符串 s 和 t ，判断 s 是否为 t 的子序列。

 字符串的一个子序列是原始字符串删除一些（也可以不删除）字符而不改变剩余字符相对位置形成的新字符串。（例如，"ace"是"abcde"的一个子序列，而"aec"不是）。

 进阶：

 如果有大量输入的 S，称作 S1, S2, ... , Sk 其中 k >= 10亿，你需要依次检查它们是否为 T 的子序列。在这种情况下，你会怎样改变代码？

 致谢：

 特别感谢 @pbrother 添加此问题并且创建所有测试用例。

  

 示例 1：

 输入：s = "abc", t = "ahbgdc"
 输出：true
 示例 2：

 输入：s = "axc", t = "ahbgdc"
 输出：false
  

 提示：

 0 <= s.length <= 100
 0 <= t.length <= 10^4
 两个字符串都只由小写字符组成。
 */

import Foundation

class Classics150_Solution392 {
    
    /**
     执行用时分布 3 ms 击败 82.56% 使用 Swift 的用户
     消耗内存分布 15.59 MB 击败 5.81% 使用 Swift 的用户
     */
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.count == 0 {
            return true
        }
        if s.count > t.count || t.count == 0 {
            return false
        }
        var sCurrentIndex = 0
        // 取出s的第一个字符
        var sCurrentChar = s[s.index(s.startIndex, offsetBy: sCurrentIndex)]
        for word in t {
            if sCurrentChar == word {
                sCurrentIndex += 1
                if sCurrentIndex == s.count {
                    return true
                }
                sCurrentChar = s[s.index(s.startIndex, offsetBy: sCurrentIndex)]
            }
        }
        return false
    }
}
