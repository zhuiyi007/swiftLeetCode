//
//  5最长回文子串.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/6/30.
//  5. 最长回文子串
//  https://leetcode-cn.com/problems/longest-palindromic-substring/

/**
 给你一个字符串 s，找到 s 中最长的回文子串。

 示例 1：
 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 
 示例 2：
 输入：s = "cbbd"
 输出："bb"
 
 示例 3：
 输入：s = "a"
 输出："a"
 
 示例 4：
 输入：s = "ac"
 输出："a"
 */
import Foundation

class Solution5 {
    
    // 扩展中心法
    // 超出时间限制
    func longestPalindrome(_ s: String) -> String {
        
        if s.count <= 1 {
            return s
        }
        var maxLength = 1, begin = 0
        var i = 0
        
        while i < s.count {
            var l = i - 1
            var r = i
            r += 1
            while r < s.count && s[s.index(s.startIndex, offsetBy: r)] == s[s.index(s.startIndex, offsetBy: i)] {
                // 找到右边不相等的元素
                r += 1
            }
            i = r
            while l >= 0 && r < s.count && s[s.index(s.startIndex, offsetBy: r)] == s[s.index(s.startIndex, offsetBy: l)] {
                l -= 1
                r += 1
            }
            l += 1
            if r - l > maxLength {
                maxLength = r - l
                begin = l
            }
        }
        let startIndex = s.index(s.startIndex, offsetBy: begin)
        let endIndex = s.index(s.startIndex, offsetBy: begin + maxLength - 1)
        
        return String(s[startIndex...endIndex])
    }
    
    // 优化动态规划写法
    // 超出时间限制
    func longestPalindrome2(_ s: String) -> String {
        // dpArray[i][j]为字符串s(i, j)是否为回文串
        var dpArray = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
        var begin = 0, length = 0
        
        for i in (0...s.count - 1).reversed() {
            for j in i...s.count - 1 {
                if s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: j)] &&
                    (j - i < 2 || dpArray[i + 1][j - 1]) {
                    dpArray[i][j] = true
                }
                if dpArray[i][j] && length < j - i {
                    begin = i
                    length = j - i
                }
            }
        }
        let startIndex = s.index(s.startIndex, offsetBy: begin)
        let endIndex = s.index(s.startIndex, offsetBy: begin + length)
        
        return String(s[startIndex...endIndex])
    }
    
    // 动态规划
    // 超出时间限制
    func longestPalindrome1(_ s: String) -> String {
        
        // dpArray[i][j]为字符串s(i, j)是否为回文串
        var dpArray = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
        
        var i = 0, j = 0
        var begin = 0, length = 0;
        
        while j < s.count {
            // 单字符一定是回文串
            if j - i == 0 {
                dpArray[i][j] = true
            } else if j - i == 1 {
                // 双字符如果两个字符相同,则也是回文串
                if s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: j)] {
                    dpArray[i][j] = true
                }
            } else {
                // 其他情况,如果去掉首尾字符后是回文串,且首尾字符相同,则也是回文串
                if dpArray[i + 1][j - 1] && s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: j)] {
                    
                    dpArray[i][j] = true
                }
            }
            // 如果是回文串,更新开始位置和长度
            if dpArray[i][j] == true {
                if j - i > length {
                    length = j - i
                    begin = i
                }
            }
            // 按照对角线来遍历
            if j == s.count - 1 {
                j = j - i + 1
                i = 0
                continue
            }
            i+=1
            j+=1
        }
        let startIndex = s.index(s.startIndex, offsetBy: begin)
        let endIndex = s.index(s.startIndex, offsetBy: begin + length)
        
        return String(s[startIndex...endIndex])
    }
}
