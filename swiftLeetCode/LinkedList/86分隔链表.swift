//
//  86分隔链表.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/6.
//  86. 分隔链表
//  https://leetcode-cn.com/problems/partition-list
//  相同题目:
//  面试题 02.04. 分割链表
//  https://leetcode-cn.com/problems/partition-list-lcci/

/**
 给你一个链表的头节点 head 和一个特定值 x ，请你对链表进行分隔，使得所有 小于 x 的节点都出现在 大于或等于 x 的节点之前。
 你应当 保留 两个分区中每个节点的初始相对位置。

 示例 1：
 输入：head = [1,4,3,2,5,2], x = 3
 输出：[1,2,2,4,3,5]
 
 示例 2：
 输入：head = [2,1], x = 2
 输出：[1,2]
 */

import Foundation

class Solution86 {
    
    // 执行用时：12 ms, 在所有 Swift 提交中击败了84.75%的用户
    // 内存消耗：13.3 MB, 在所有 Swift 提交中击败了89.83%的用户
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        
        if head == nil {
            return nil
        }
        var current = head
        let small = ListNode.init()
        let big = ListNode.init()
        var smallTail = small, bigTail = big
        
        while current != nil {
            if current!.val < x {
                smallTail.next = current
                smallTail = smallTail.next!
            } else {
                bigTail.next = current
                bigTail = bigTail.next!
            }
            current = current?.next
        }
        smallTail.next = big.next
        bigTail.next = nil
        return small.next
    }
}
