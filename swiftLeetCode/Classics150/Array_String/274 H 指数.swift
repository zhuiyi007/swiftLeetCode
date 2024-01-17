//
//  274 H 指数.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2024/1/17.
//
//  https://leetcode.cn/problems/h-index/description/?envType=study-plan-v2&envId=top-interview-150

/**
 给你一个整数数组 citations ，其中 citations[i] 表示研究者的第 i 篇论文被引用的次数。计算并返回该研究者的 h 指数。

 根据维基百科上 h 指数的定义：h 代表“高引用次数” ，一名科研人员的 h 指数 是指他（她）至少发表了 h 篇论文，并且 至少 有 h 篇论文被引用次数大于等于 h 。如果 h 有多种可能的值，h 指数 是其中最大的那个。

  

 示例 1：

 输入：citations = [3,0,6,1,5]
 输出：3
 解释：给定数组表示研究者总共有 5 篇论文，每篇论文相应的被引用了 3, 0, 6, 1, 5 次。
      由于研究者有 3 篇论文每篇 至少 被引用了 3 次，其余两篇论文每篇被引用 不多于 3 次，所以她的 h 指数是 3。
 示例 2：

 输入：citations = [1,3,1]
 输出：1
  

 提示：

 n == citations.length
 1 <= n <= 5000
 0 <= citations[i] <= 1000
 */
import Foundation
class Classics150_Solution274 {
    
    /**
     排序法
     执行用时分布 8 ms 击败 69.61% 使用 Swift 的用户
     消耗内存分布 15.49 MB 击败 5.88% 使用 Swift 的用户
     */
    func hIndex1(_ citations: [Int]) -> Int {
        /// 先对原始数据做个排序
        let sortArray = citations.sorted()
        var h = 0, i = sortArray.count - 1
        /// 从后往前遍历(从大到小)
        while i >= 0 && sortArray[i] > h {
            /// 如果当前位置的数值 > h
            /// 则证明还可以继续尝试寻找
            /// 当不满足条件时,h就是最大值
            h += 1
            i -= 1
        }
        return h
    }
    
    /**
     二分法,有H篇论文引用次数,因此H <= count,二分count遍历查找是否满足条件
     执行用时分布 12 ms 击败 18.63% 使用 Swift 的用户
     消耗内存分布 15.34 MB 击败 6.86% 使用 Swift 的用户
     */
    func hIndex(_ citations: [Int]) -> Int {
        var start = 0, end = citations.count
        while start < end {
            /// mid为二分的中间值
            /// 当前循环中,假设mid为h值
            let mid = (start + end + 1) >> 1
            var countGreaterThanH = 0
            for item in citations {
                if item >= mid {
                    countGreaterThanH += 1
                }
            }
            if countGreaterThanH >= mid {
                /// 如果count > mid,证明h在[mid, end]之间
                start = mid
            } else {
                /// 其他情况,证明h在[start, mid)之间
                end = mid - 1
            }
        }
        return start
    }
}




