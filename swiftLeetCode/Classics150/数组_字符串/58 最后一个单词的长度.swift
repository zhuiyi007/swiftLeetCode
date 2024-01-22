//
//  58 最后一个单词的长度.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/18.
//
//  https://leetcode.cn/problems/length-of-last-word/description/?envType=study-plan-v2&envId=top-interview-150

/**
 给你一个字符串 s，由若干单词组成，单词前后用一些空格字符隔开。返回字符串中 最后一个 单词的长度。

 单词 是指仅由字母组成、不包含任何空格字符的最大子字符串。

  

 示例 1：

 输入：s = "Hello World"
 输出：5
 解释：最后一个单词是“World”，长度为5。
 示例 2：

 输入：s = "   fly me   to   the moon  "
 输出：4
 解释：最后一个单词是“moon”，长度为4。
 示例 3：

 输入：s = "luffy is still joyboy"
 输出：6
 解释：最后一个单词是长度为6的“joyboy”。
  

 提示：

 1 <= s.length <= 104
 s 仅有英文字母和空格 ' ' 组成
 s 中至少存在一个单词
 */

import Foundation

class Classics150_Solution58 {
    /**
     执行用时分布 0 ms 击败 100.00% 使用 Swift 的用户
     消耗内存分布 15.80 MB 击败 6.00% 使用 Swift 的用户
     */
    func lengthOfLastWord(_ s: String) -> Int {
        var count = 0
        for word in s.reversed() {
            if word == " " {
                if  count > 0 {
                    /// 如果是空格,并且count>0
                    /// 表示单词已经结束了,可以直接退出
                    break
                } else {
                    /// 如果count == 0
                    /// 表示当前是结尾的空格,什么都不做,继续下一次循环
                    continue
                }
            }
            /// 增加单词长度
            count += 1
        }
        return count
    }
}
