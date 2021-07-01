//
//  121买卖股票的最佳时机.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/6/30.
//  121. 买卖股票的最佳时机
//  https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock
//  剑指 Offer 63. 股票的最大利润
//  https://leetcode-cn.com/problems/gu-piao-de-zui-da-li-run-lcof/

/**
 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。

 示例 1：

 输入：[7,1,5,3,6,4]
 输出：5
 解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
 示例 2：

 输入：prices = [7,6,4,3,1]
 输出：0
 解释：在这种情况下, 没有交易完成, 所以最大利润为 0。
 */




import Foundation

class Solution121 {
    
    
    // 动态规划2,优化空间复杂度,去掉dp数组
    // 执行用时：1160 ms, 在所有 Swift 提交中击败了78.65%的用户
    // 内存消耗：17.3 MB, 在所有 Swift 提交中击败了75.95%的用户
    func maxProfit(_ prices: [Int]) -> Int {
        
        if prices.isEmpty {
            return 0
        }
        var dpValue = 0
        var maxValue = 0
        for i in 1..<prices.count {
            // 前两天的股价差
            let valueCount = prices[i] - prices[i - 1]
            if dpValue < 0 {
                dpValue = valueCount
            } else {
                dpValue += valueCount
            }
            maxValue = max(dpValue, maxValue)
        }
        return maxValue
    }
    
    
    // 动态规划
    // 执行用时：1456 ms, 在所有 Swift 提交中击败了5.13%的用户
    // 内存消耗：17.2 MB, 在所有 Swift 提交中击败了88.38%的用户
    func maxProfit2(_ prices: [Int]) -> Int {
        
        if prices.isEmpty {
            return 0
        }
        // 存放两天的股价差
        var profitArray = [Int](repeating: 0, count: prices.count)
        for i in 1..<prices.count {
            profitArray[i] = prices[i] - prices[i - 1]
        }
        
        var dpArray = [Int](repeating: 0, count: prices.count)
        var maxProfit = 0
        
        // 转化为求最大连续子序列和的问题
        for i in 1..<prices.count {
            if dpArray[i - 1] < 0 {
                dpArray[i] = profitArray[i]
            } else {
                dpArray[i] = dpArray[i - 1] + profitArray[i]
            }
            maxProfit = max(maxProfit, dpArray[i])
        }
        return maxProfit
    }
    
    // 遍历的方式解决
    // 超出时间限制
    func maxProfit1(_ prices: [Int]) -> Int {

        var maxProfit = 0
        
        for i in 1..<prices.count {
            
            var minPrice = prices[0]
            for j in 1..<i {
                // 每次找出最低的价格
                minPrice = min(minPrice, prices[j])
            }
            // 最低价格买入即有最大价值
            maxProfit = max(prices[i] - minPrice, maxProfit)
        }
        
        return maxProfit
    }
}
