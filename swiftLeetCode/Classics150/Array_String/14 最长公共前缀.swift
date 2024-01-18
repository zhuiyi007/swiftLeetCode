//
//  14 最长公共前缀.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/18.
//
//  https://leetcode.cn/problems/longest-common-prefix/description/?envType=study-plan-v2&envId=top-interview-150

/**
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。

  

 示例 1：

 输入：strs = ["flower","flow","flight"]
 输出："fl"
 示例 2：

 输入：strs = ["dog","racecar","car"]
 输出：""
 解释：输入不存在公共前缀。
  

 提示：

 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] 仅由小写英文字母组成
 */


import Foundation

class Classics150_Solution14 {
    
    /**
     执行用时分布 58 ms 击败 30.99% 使用 Swift 的用户
     消耗内存分布 15.60 MB 击败 9.86% 使用 Swift 的用户
     */
    func longestCommonPrefix1(_ strs: [String]) -> String {
        var currentIndex = 0
        var prefix = ""
        for word in strs[0] {
            /// 从第一个字符串中依次取出每一个字符,与后面的字符串中对应位置进行比较
            for str in strs {
                if currentIndex >= str.count {
                    /// 如果后续字符串长度较小,则直接退出返回
                    return prefix
                }
                let index = str.index(str.startIndex, offsetBy: currentIndex)
                let character = str[index]
                /// 如果遍历到一个不相等的字符,则可以提前退出返回
                if character != word {
                    return prefix
                }
            }
            prefix += String(word)
            currentIndex += 1
        }
        return prefix
    }
    
    /**
     执行用时分布 13 ms 击败 52.11% 使用 Swift 的用户
     消耗内存分布 16.01 MB 击败 5.63% 使用 Swift 的用户
     */
    func longestCommonPrefix2(_ strs: [String]) -> String {
        /// 首先判断数组数量是否大于1
        /// 不大于1,则取第一个字符串返回,否则返回空串
        guard strs.count > 1 else {
            return strs.first ?? ""
        }
        var prefix = ""
        for word in strs[0] {
            /// 每次循环前维护好prefix
            prefix += String(word)
            for str in strs {
                /// 判断当前字符串中是否有此前缀
                if !str.hasPrefix(prefix) {
                    /// 如果没有,则移除掉prefix的最后一个字符,直接返回
                    prefix.removeLast()
                    return prefix
                }
            }
        }
        return prefix
    }
    
    
    /**
     执行用时分布 12 ms 击败 69.01% 使用 Swift 的用户
     消耗内存分布 15.69 MB 击败 5.63% 使用 Swift 的用户
     */
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 1 else {
            return strs.first ?? ""
        }
        /// 先将数组排序
        let sortStrs = strs.sorted()
        /// 取出头尾元素
        let first = sortStrs.first!
        let last = sortStrs.last!
        /// 只需要对比头尾元素的最大前缀即可
        var prefix = ""
        for i in first.indices {
            if first[i] != last[i] {
                return prefix
            }
            prefix.append(first[i])
        }
        return prefix
    }
}



