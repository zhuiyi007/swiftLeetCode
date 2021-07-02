//
//  236二叉树的最近公共祖先.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/1.
//  236. 二叉树的最近公共祖先
//  https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/
/**
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 示例 1：
                    3
            5               1
        6       2       0       8
            7       4
 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出：3
 解释：节点 5 和节点 1 的最近公共祖先是节点 3 。
 
 示例 2：
 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 输出：5
 解释：节点 5 和节点 4 的最近公共祖先是节点 5 。因为根据定义最近公共祖先节点可以为节点本身。
 
 示例 3：
 输入：root = [1,2], p = 1, q = 2
 输出：1
 */

import Foundation

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


class Solution236 {
    
    // 此方法为在root树中寻找p和q的最近公共祖先
    // 执行用时：144 ms, 在所有 Swift 提交中击败了5.10%的用户
    // 内存消耗：21.2 MB, 在所有 Swift 提交中击败了5.10%的用户
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        
        let rootPoint = Unmanaged<AnyObject>.passUnretained(root as AnyObject).toOpaque()
        let pPoint = Unmanaged<AnyObject>.passUnretained(p as AnyObject).toOpaque()
        let qPoint = Unmanaged<AnyObject>.passUnretained(q as AnyObject).toOpaque()
        
        if root == nil || rootPoint == pPoint || rootPoint == qPoint {
            // 如果没有根节点,或者其中有一个节点是根节点,则直接返回根节点
            return root
        }
        
        /**
         注意p,q必然存在树内, 且所有节点的值唯一!!!
         递归思想, 对以root为根的(子)树进行查找p和q, 如果root == null || p || q 直接返回root
         表示对于当前树的查找已经完毕, 否则对左右子树进行查找, 根据左右子树的返回值判断:
         1. 左右子树的返回值都不为null, 由于值唯一左右子树的返回值就是p和q, 此时root为LCA
         2. 如果左右子树返回值只有一个不为null, 说明只有p和q存在与左或右子树中, 最先找到的那个节点为LCA
         3. 左右子树返回值均为null, p和q均不在树中, 返回null
         **/
        
        let left = Solution236().lowestCommonAncestor(root?.left, p, q)
        let right = Solution236().lowestCommonAncestor(root?.right, p, q)
        
        if left != nil && right != nil {
            // 如果在左子树和右子树中都没有找到共同的祖先,则根节点是最近公共祖先
            return root
        }
        return left != nil ? left : right
    }
}
