//
//  28 找出字符串中第一个匹配项的下标.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/18.
//
//  https://leetcode.cn/problems/find-the-index-of-the-first-occurrence-in-a-string/description/?envType=study-plan-v2&envId=top-interview-150

/**
 给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串的第一个匹配项的下标（下标从 0 开始）。如果 needle 不是 haystack 的一部分，则返回  -1 。

  

 示例 1：

 输入：haystack = "sadbutsad", needle = "sad"
 输出：0
 解释："sad" 在下标 0 和 6 处匹配。
 第一个匹配项的下标是 0 ，所以返回 0 。
 示例 2：

 输入：haystack = "leetcode", needle = "leeto"
 输出：-1
 解释："leeto" 没有在 "leetcode" 中出现，所以返回 -1 。
  

 提示：

 1 <= haystack.length, needle.length <= 104
 haystack 和 needle 仅由小写英文字符组成
 */

import Foundation

class Classics150_Solution28 {
    /**
     执行用时分布 4 ms 击败 74.44% 使用 Swift 的用户
     消耗内存分布 16.15 MB 击败 5.56% 使用 Swift 的用户
     */
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard let range = haystack.range(of: needle) else { return -1 }
        return haystack.distance(from: haystack.startIndex, to: range.lowerBound)
    }
}


