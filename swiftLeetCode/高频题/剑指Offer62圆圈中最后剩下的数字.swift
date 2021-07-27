//
//  剑指Offer62圆圈中最后剩下的数字.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/22.
//  剑指 Offer 62. 圆圈中最后剩下的数字
//  https://leetcode-cn.com/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof

/**
 0,1,···,n-1这n个数字排成一个圆圈，从数字0开始，每次从这个圆圈里删除第m个数字（删除后从下一个数字开始计数）。求出这个圆圈里剩下的最后一个数字。

 例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。

 示例 1：
 输入: n = 5, m = 3
 输出: 3
 
 示例 2：
 输入: n = 10, m = 17
 输出: 2
 */

import Foundation

class SolutionOffer62 {
    
    // 执行用时：8 ms, 在所有 Swift 提交中击败了100.00%的用户
    // 内存消耗：13.4 MB, 在所有 Swift 提交中击败了92.42%的用户
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        // 如果只有一个数,则直接返回
        if n == 0 {
            return 0
        }
        var result = 0
        // 从第二个数开始数
        for index in 1..<n {
            // 每次的结果相当于在之前的结果基础上加上数的个数
            // 为了不越界,需要对当前剩余的个数进行取余
            result = (result + m) % (index + 1)
        }
        return result
    }
}
