//
//  125 验证回文串.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/22.
//
//  https://leetcode.cn/problems/valid-palindrome/description/?envType=study-plan-v2&envId=top-interview-150

/**
 如果在将所有大写字符转换为小写字符、并移除所有非字母数字字符之后，短语正着读和反着读都一样。则可以认为该短语是一个 回文串 。

 字母和数字都属于字母数字字符。

 给你一个字符串 s，如果它是 回文串 ，返回 true ；否则，返回 false 。

  

 示例 1：

 输入: s = "A man, a plan, a canal: Panama"
 输出：true
 解释："amanaplanacanalpanama" 是回文串。
 示例 2：

 输入：s = "race a car"
 输出：false
 解释："raceacar" 不是回文串。
 示例 3：

 输入：s = " "
 输出：true
 解释：在移除非字母数字字符之后，s 是一个空字符串 "" 。
 由于空字符串正着反着读都一样，所以是回文串。
  

 提示：

 1 <= s.length <= 2 * 105
 s 仅由可打印的 ASCII 字符组成
 */

import Foundation

class Classics150_Solution125 {
    
    /**
     执行用时分布 15 ms 击败 62.35% 使用 Swift 的用户
     消耗内存分布 17.59 MB 击败 14.12% 使用 Swift 的用户
     */
    func isPalindrome(_ s: String) -> Bool {
        /// swift特性,构造一个数组,在构造过程中,把非法字符直接删掉
        let array = s.lowercased().compactMap { char in
            return isLowercaseOrNumber(uint8:char.asciiValue!) ? char : nil
        }
        var start = 0, end = array.count - 1
        while start < end {
            if array[start] != array[end] {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
    func isLowercaseOrNumber(uint8 ascii: UInt8) -> Bool {
        return (ascii >= "0".unicodeScalars.first!.value && ascii <= "9".unicodeScalars.first!.value) || (ascii >= "a".unicodeScalars.first!.value) && ascii <= "z".unicodeScalars.first!.value
    }
    
    /**
     执行用时分布 33 ms 击败 12.94% 使用 Swift 的用户
     消耗内存分布 15.45 MB 击败 62.35% 使用 Swift 的用户
     */
    func isPalindrome1(_ s: String) -> Bool {
        let lowerString = s.lowercased()
        var start = 0, end = lowerString.count - 1
        while start < end {
            var startChar = UInt32()
            var endChar = UInt32()
            while start < end {
                /// 小循环过滤掉非法字符
                var canStop = 0
                
                /// ✅使用NSRange比直接用String.index效率要好很多 : 50s => 10ms✅
                /// ❌startChar = lowerString[lowerString.index(lowerString.startIndex, offsetBy: start)].unicodeScalars.first!.value❌
                startChar = lowerString[Range(NSRange(location: start, length: 1), in: lowerString)!].unicodeScalars.first!.value
                if !isLowercaseOrNumber(startChar) {
                    start += 1
                } else {
                    canStop += 1
                }
                endChar = lowerString[Range(NSRange(location: end, length: 1), in: lowerString)!].unicodeScalars.first!.value
                if !isLowercaseOrNumber(endChar)  {
                    end -= 1
                } else {
                    canStop += 1
                }
                /// 当头和尾都不是非字母字符时,退出
                if canStop == 2 {
                    break
                }
            }
            if end <= start {
                return true
            }
            if startChar != endChar {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
    func isLowercaseOrNumber(_ ascii: UInt32) -> Bool {
        return (ascii >= "0".unicodeScalars.first!.value && ascii <= "9".unicodeScalars.first!.value) || (ascii >= "a".unicodeScalars.first!.value) && ascii <= "z".unicodeScalars.first!.value
    }
}
