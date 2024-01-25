//
//  3 无重复字符的最长子串.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/24.
//
//  https://leetcode.cn/problems/longest-substring-without-repeating-characters/description/?envType=study-plan-v2&envId=top-interview-150

/**
 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。

  

 示例 1:

 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
  

 提示：

 0 <= s.length <= 5 * 104
 s 由英文字母、数字、符号和空格组成
 */

import Foundation

class Classics150_Solution3 {
    /**
     执行用时分布 67 ms 击败 12.47% 使用 Swift 的用户
     消耗内存分布 15.86 MB 击败 11.42% 使用 Swift 的用户
     */
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var start = 0, end = 0
        var result = 0
        var elementSet = Set<Substring>()
        let count = s.count
        while end < count {
            let subString = s[Range(NSRange(location: end, length: 1), in: s)!]
            while elementSet.contains(subString) {
                /// 当前有重复的元素
                elementSet.remove(s[Range(NSRange(location: start, length: 1), in: s)!])
                /// 需要不断尝试start右移来去除掉重复元素
                start += 1
            }
            /// 当前没有重复的元素
            elementSet.insert(subString)
            end += 1
            result = max(end - start, result)
        }
        return result
    }
}
