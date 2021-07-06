//
//  160相交链表.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/5.
//  160. 相交链表
//  https://leetcode-cn.com/problems/intersection-of-two-linked-lists
//  相同题目:
//  面试题 02.07. 链表相交
//  https://leetcode-cn.com/problems/intersection-of-two-linked-lists-lcci/
//  剑指 Offer 52. 两个链表的第一个公共节点
//  https://leetcode-cn.com/problems/liang-ge-lian-biao-de-di-yi-ge-gong-gong-jie-dian-lcof/

/**
 给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表没有交点，返回 null 。
 图示两个链表在节点 c1 开始相交：
 题目数据 保证 整个链式结构中不存在环。
 注意，函数返回结果后，链表必须 保持其原始结构 。

 示例 1：
 
         4 -> 1
                -> 8 -> 4 -> 5
    5 -> 0 -> 1
 输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
 输出：Intersected at '8'
 解释：相交节点的值为 8 （注意，如果两个链表相交则不能为 0）。
 从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,0,1,8,4,5]。
 在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。
 
 示例 2：
 
    0 -> 9 -> 1
                -> 2 -> 4
              3
 输入：intersectVal = 2, listA = [0,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
 输出：Intersected at '2'
 解释：相交节点的值为 2 （注意，如果两个链表相交则不能为 0）。
 从各自的表头开始算起，链表 A 为 [0,9,1,2,4]，链表 B 为 [3,2,4]。
 在 A 中，相交节点前有 3 个节点；在 B 中，相交节点前有 1 个节点。
 
 示例 3：
 
    2 -> 6 -> 4
         1 -> 5
 输入：intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
 输出：null
 解释：从各自的表头开始算起，链表 A 为 [2,6,4]，链表 B 为 [1,5]。
 由于这两个链表不相交，所以 intersectVal 必须为 0，而 skipA 和 skipB 可以是任意值。
 这两个链表不相交，因此返回 null 。
 */

import Foundation

class Solution160 {
    
    // 简化版
    // 执行用时：340 ms, 在所有 Swift 提交中击败了84.96%的用户
    // 内存消耗：16.4 MB, 在所有 Swift 提交中击败了86.35%的用户
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        var nodeA = headA, nodeB = headB
        
        while nodeA !== nodeB {
            nodeA = nodeA == nil ? headB : nodeA?.next
            nodeB = nodeB == nil ? headA : nodeB?.next
        }
        
        return nodeA
    }
    
    // 此题的解决方案为分别将两条链表拼接到另外两条链表的尾部
    // 如果在同一个位置返回了相同的节点
    // 则为相交节点
    // 否则,没有相交节点
    // 4 -> 1 -> [8 -> 4 -> 5] -> 5 -> 0 -> 1 -> [8 -> 4 -> 5]
    // 5 -> 0 -> 1 -> [8 -> 4 -> 5] -> 4 -> 1 -> [8 -> 4 -> 5]
    // 执行用时：348 ms, 在所有 Swift 提交中击败了56.55%的用户
    // 内存消耗：16.7 MB, 在所有 Swift 提交中击败了39.55%的用户
    func getIntersectionNode1(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        var tempA = headA, tempB = headB
        var aAppend = false, bAppend = false
        
        
        while tempA != nil && tempB != nil {
            
            if tempA === tempB {
                return tempA
            }
            
            if tempA?.next == nil && !aAppend {
                // 如果A遍历完了,且没有拼接过的话
                // 把B拼接到A后面
                tempA?.next = headB
                aAppend = true
                
                let tailA = tempA
                tempA = tempA?.next
                tempB = tempB?.next
                // 把A后面的next线去掉
                tailA?.next = nil
                continue
            }
            if tempB?.next == nil && !bAppend {
                // 如果B遍历完了,且没有拼接过的话
                // 把A拼接到B后面
                tempB?.next = headA
                bAppend = true
                
                let tailB = tempB
                tempB = tempB?.next
                tempA = tempA?.next
                // 把B后面的next线去掉
                tailB?.next = nil
                continue
            }
            tempA = tempA?.next
            tempB = tempB?.next
        }
        return nil
    }
}
