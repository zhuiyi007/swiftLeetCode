//
//  main.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/6/29.
//

import Foundation

// 链表
let listNode6 = ListNode.init(6, nil)
let listNode5 = ListNode.init(5, listNode6)
let listNode4 = ListNode.init(4, listNode5)
let listNode3 = ListNode.init(3, listNode4)
let listNode6_1 = ListNode.init(6, listNode3)
let listNode2 = ListNode.init(2, listNode6_1)
let listNode1 = ListNode.init(1, listNode2)

let listNode7_1 = ListNode.init(7, nil)
let listNode7_2 = ListNode.init(7, listNode7_1)
let listNode7_3 = ListNode.init(7, listNode7_2)
let listNode7_4 = ListNode.init(7, listNode7_3)

print(Solution203().removeElements(listNode1, 6) as Any)

// 数组排序
//print(Solution977().sortedSquares([-5,-3,-2,-1]))
//print(Solution16_16().subSort([1,2,4,7,10,11,7,12,6,7,16,18,19]))

//var array75 = [1]
//print(Solution75().sortColors(&array75))

//var array88 = [2,0]
//print(Solution88().merge(&array, 1, [1], 1))

// 二叉树
//var node3 = TreeNode.init(3);
//var node1 = TreeNode.init(1);
//var node2 = TreeNode.init(2);
//node1.left = node3
//node3.right = node2
//print(Solution99().recoverTree(node1))

//示例 1：
//                   3
//           5               1
//       6       2       0       8
//           7       4

//var node3 = TreeNode.init(3);
//var node5 = TreeNode.init(5);
//var node1 = TreeNode.init(1);
//var node6 = TreeNode.init(6);
//var node2 = TreeNode.init(2);
//var node0 = TreeNode.init(0);
//var node8 = TreeNode.init(8);
//var node7 = TreeNode.init(7);
//var node4 = TreeNode.init(4);
//
//node3.left = node5
//node3.right = node1
//node5.left = node6
//node5.right = node2
//node1.left = node0
//node1.right = node8
//node2.left = node7
//node2.right = node4

//print(Solution236().lowestCommonAncestor(node3, node6, node4)!.val)

// 动态规划
//print(Solution5().longestPalindrome("cbbd"))
//print(Solution62().uniquePaths(7, 3))
//print(Solution64().minPathSum([[1,3,1],[1,5,1],[4,2,1]]))
//print(Solution121().maxProfit([7,1,5,3,6,4]))
//print(SolutionOffer47().maxValue([[1,3,1],[1,5,1],[4,2,1]]))


