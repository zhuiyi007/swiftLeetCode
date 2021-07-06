//
//  234回文链表.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/6.
//  234. 回文链表
//  https://leetcode-cn.com/problems/palindrome-linked-list/
//  ------------------------
//  相同题目:
//  面试题 02.06. 回文链表
//  https://leetcode-cn.com/problems/palindrome-linked-list-lcci/

/**
 请判断一个链表是否为回文链表。

 示例 1:
 输入: 1->2
 输出: false
 
 示例 2:
 输入: 1->2->2->1
 输出: true
 
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
 */

import Foundation

class Solution234 {
    
    // 利用反转链表的方式进行判断
    // 先运用快慢指针找到中间元素
    // 将后面的链表进行反转
    // 从头部和中间元素后面开始对比元素是否是相等的
    // 执行用时：1200 ms, 在所有 Swift 提交中击败了49.03%的用户
    // 内存消耗：25.6 MB, 在所有 Swift 提交中击败了72.37%的用户
    func isPalindrome(_ head: ListNode?) -> Bool {
        
        var midNode = _findMidNode(head)
        midNode = _reverseList(midNode?.next)
        
        var headNode = head
        while midNode != nil {
            if midNode?.val != headNode?.val {
                return false
            }
            midNode = midNode?.next
            headNode = headNode?.next
        }
        return true
    }
    
    // 运用快慢指针找到中间的元素
    // 后面的元素入栈
    // 从头结点开始与栈中元素比较
    // 都相等则是回文串
    // 执行用时：1224 ms, 在所有 Swift 提交中击败了36.58%的用户
    // 内存消耗：30.5 MB, 在所有 Swift 提交中击败了43.58%的用户
    func isPalindrome1(_ head: ListNode?) -> Bool {

        var midNode = _findMidNode(head)
        var stack = [ListNode]()
        while midNode?.next != nil {
            
            stack.append(midNode!.next!)
            midNode = midNode?.next
        }
        
        var headPoint = head
        while stack.count > 0 {
            if headPoint?.val != stack.last?.val {
                return false
            }
            headPoint = headPoint?.next
            stack.removeLast()
        }
        return true
    }
    
    // 利用快慢指针寻找中间元素
    func _findMidNode(_ head: ListNode!) -> ListNode! {
        
        var slowPoint = head, fastPoint = head
        while fastPoint?.next != nil && fastPoint?.next?.next != nil {
            
            slowPoint = slowPoint?.next
            fastPoint = fastPoint?.next?.next
        }
        return slowPoint
    }
    
    // 反转链表
    func _reverseList(_ head: ListNode!) -> ListNode! {
        
        var newHead : ListNode?
        var headNode = head
        while headNode != nil {
            let tmp = headNode!.next
            headNode!.next = newHead
            newHead = headNode
            headNode = tmp
        }
        return newHead
    }
}
