//
//  2两数相加.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/2.
//  2. 两数相加
//  https://leetcode-cn.com/problems/add-two-numbers

/**
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例 1：
 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 
 示例 2：
 输入：l1 = [0], l2 = [0]
 输出：[0]
 
 示例 3：
 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]
 */

import Foundation

class Solution2 {
    
    // 执行用时：56 ms, 在所有 Swift 提交中击败了70.31%的用户
    // 内存消耗：13.6 MB, 在所有 Swift 提交中击败了53.58%的用户
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var l1Tail = l1
        var l2Tail = l2
        var add = false
        let resultNode = ListNode()
        var resultTail = resultNode
        
        while add || l1Tail != nil || l2Tail != nil {
            
            let l1Val = l1Tail == nil ? 0 : l1Tail!.val
            let l2Val = l2Tail == nil ? 0 : l2Tail!.val
            
            let result = l1Val + l2Val + (add ? 1 : 0)
            add = result / 10 == 1
            resultTail.next = ListNode.init(result % 10, nil)
            resultTail = resultTail.next!
            l1Tail = l1Tail?.next
            l2Tail = l2Tail?.next
        }
        
        return resultNode.next
    }
}
