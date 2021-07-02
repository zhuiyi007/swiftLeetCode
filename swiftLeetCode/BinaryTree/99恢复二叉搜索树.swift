//
//  99恢复二叉搜索树.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/1.
//  99. 恢复二叉搜索树
//  https://leetcode-cn.com/problems/recover-binary-search-tree/
/**
 给你二叉搜索树的根节点 root ，该树中的两个节点被错误地交换。请在不改变其结构的情况下，恢复这棵树。
 进阶：使用 O(n) 空间复杂度的解法很容易实现。你能想出一个只使用常数空间的解决方案吗？

 示例 1：
        1
    3       null
 null   2
 
 ↓
 
        3
    1       null
null   2
 输入：root = [1,3,null,null,2]
 输出：[3,1,null,null,2]
 解释：3 不能是 1 左孩子，因为 3 > 1 。交换 1 和 3 使二叉搜索树有效。
 
 示例 2：
                3
        1               4
 null       null    2      null
 
 ↓
                2
        1               4
null       null    3      null
 输入：root = [3,1,4,null,null,2]
 输出：[2,1,4,null,null,3]
 解释：2 不能在 3 的右子树中，因为 2 < 3 。交换 2 和 3 使二叉搜索树有效。
 */

import Foundation
class Solution99 {
    
    // 前一个遍历的根节点
    var prevNode : TreeNode?
    // 第一个和第二个错误的节点
    var firstErrorNode : TreeNode?
    var secondErrorNode : TreeNode?
    
    // mirrors算法进行遍历,时间复杂度O(n),空间复杂度O(1)
    // 执行用时：76 ms, 在所有 Swift 提交中击败了16.28%的用户
    // 内存消耗：14 MB, 在所有 Swift 提交中击败了32.56%的用户
    func recoverTree(_ root: TreeNode?) {
        
        if root == nil {
            return
        }
        _inorderMirrors(root)
        _exchangeNode()
    }
    
    
    
    // 中序遍历的方法
    // 时间复杂度,空间复杂度均为O(n)
    // 执行用时：116 ms, 在所有 Swift 提交中击败了16.28%的用户
    // 内存消耗：13.8 MB, 在所有 Swift 提交中击败了69.77%的用户
    /** 示例1中,正确的中序遍历为1,2,3 错误的中序遍历为3,2,1
        交换了1和3
        在错误的中序遍历中,会产生两个逆序对:3,2和2,1;
        其中第一个逆序对的首元素和最后一个逆序对的尾元素即为交换的两个元素
     
        示例2中,正确的中序遍历为1,2,3,4 错误的中序遍历为1,3,2,4
        交换了2和3
        在错误的中序遍历中,会产生一个逆序对:3,2
        同理:其中第一个逆序对的首元素和最后一个逆序对的尾元素即为交换的两个元素
    */
    
    func recoverTree1(_ root: TreeNode?) {
        
        if root == nil {
            return
        }
        self._inorder(root)
        self._exchangeNode()
    }
    
    // mirrors算法进行中序遍历
    func _inorderMirrors(_ root: TreeNode?) {
        
        var node = root
        var precursor : TreeNode?
        while node != nil {
            
            // 如果左子树为空,遍历到最底层了,打印当前节点
            if node?.left == nil {
                _findReverseOrder(node)
                node = node?.right
                continue
            }
            
            // 寻找前驱节点
            precursor = _precursor(node)
            
            // 如果前驱节点没有右子树
            // 将前驱结点的右子树赋值给当前节点
            // 继续往左边遍历
            if precursor?.right == nil {
                precursor?.right = node
                node = node?.left
            } else {
                // 如果前驱节点有右子树(右子树与当前节点相同)
                // 证明前驱节点已经打印完毕
                // 打印当前节点,断掉前驱结点的右子树
                // 继续遍历右子树
                _findReverseOrder(node)
                precursor?.right = nil
                node = node?.right
            }
        }
    }
    
    func _precursor(_ root: TreeNode?) -> TreeNode? {
        
        var node = root?.left
        // 如果node没有右子树或者右子树等于根节点,则退出循环
        while node?.right != nil && root?.val != node?.right?.val {
            
            node = node!.right
        }
        return node
    }
    
    // 递归方式进行中序遍历
    func _inorder(_ root: TreeNode?) {
        
        if root == nil {
            return
        }
        self._inorder(root!.left)
        
        self._findReverseOrder(root)
        
        self._inorder(root!.right)
    }
    
    // 判断是否是逆序对
    func _findReverseOrder(_ node: TreeNode!) {
        
        if prevNode != nil && prevNode!.val > node!.val {
            if firstErrorNode == nil {
                
                firstErrorNode = prevNode
            }
            secondErrorNode = node
        }
        prevNode = node
    }
    
    // 交换逆序对
    func _exchangeNode() {
        
        let tmpVal = firstErrorNode!.val
        firstErrorNode!.val = secondErrorNode!.val
        secondErrorNode!.val = tmpVal
    }
    
}
