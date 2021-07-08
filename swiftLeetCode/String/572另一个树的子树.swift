//
//  572另一个树的子树.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/8.
//  572. 另一个树的子树
//  https://leetcode-cn.com/problems/subtree-of-another-tree

/**
 给定两个非空二叉树 s 和 t，检验 s 中是否包含和 t 具有相同结构和节点值的子树。s 的一个子树包括 s 的一个节点和这个节点的所有子孙。s 也可以看做它自身的一棵子树。

 示例 1:
 给定的树 s:
      3
     / \
    4   5
   / \
  1   2
 给定的树 t：
    4
   / \
  1   2
 返回 true，因为 t 与 s 的一个子树拥有相同的结构和节点值。

 示例 2:
 给定的树 s：
      3
     / \
    4   5
   / \
  1   2
     /
    0
 给定的树 t：

    4
   / \
  1   2
 返回 false。
 */
import Foundation
class Solution572 {
    
    // 采取序列化树的方式进行判断
    // 执行用时：84 ms, 在所有 Swift 提交中击败了100.00%的用户
    // 内存消耗：14.7 MB, 在所有 Swift 提交中击败了15.38%的用户
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        
        var rootString = ""
        _preorderSequence(root, &rootString)
        var subRootString = ""
        _preorderSequence(subRoot, &subRootString)
        return rootString.contains(subRootString)
    }
    
    
    /// 前序遍历
    private func _preorderSequence(_ root: TreeNode?,_ sequenceString: inout String) {
        
        if root == nil {
            sequenceString += "!#"
            return
        }
        sequenceString += "!\(root!.val)"
        _preorderSequence(root?.left, &sequenceString)
        _preorderSequence(root?.right, &sequenceString)
    }
}
