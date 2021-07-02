//
//  203移除链表元素.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/2.
//  203. 移除链表元素
//  https://leetcode-cn.com/problems/remove-linked-list-elements

/**
 给你一个链表的头节点 head 和一个整数 val ，请你删除链表中所有满足 Node.val == val 的节点，并返回 新的头节点 。
  
 示例 1：
 输入：head = [1,2,6,3,4,5,6], val = 6
 输出：[1,2,3,4,5]
 
 示例 2：
 输入：head = [], val = 1
 输出：[]
 
 示例 3：
 输入：head = [7,7,7,7], val = 7
 输出：[]
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution203 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {

        if head == nil {
            return head
        }
        
        let tmpNode = ListNode.init(0, head)
        var tailNode :ListNode? = tmpNode
        while tailNode != nil {
            
            if tailNode!.next?.val == val {
                
                tailNode!.next = tailNode!.next?.next
            } else {
                
                tailNode = tailNode!.next
            }
        }
        return tmpNode.next
    }
}
