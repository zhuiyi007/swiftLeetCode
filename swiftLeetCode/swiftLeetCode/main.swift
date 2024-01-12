//
//  main.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/6/29.
//

import Foundation

// ----- 高频题 -----
print(Solution42().trap([4,2,3]))
//print(Solution11().maxArea([1,2,4,3]))
//print(Solution7().reverse(1534236469))
//print(Solution54().spiralOrder([[2,5],[8,4],[0,-1]]))
//print(SolutionOffer62().lastRemaining(10, 17))
//print(Solution15().threeSum([0,0,0,0]))
//print(Solution1().twoSum([3, 3], 6))
//var nums = [0,1,0,3,12]
//Solution283().moveZeroes(&nums)
//print(nums)

// ----- DFS -----
//print(Solution22().generateParenthesis(3))
//print(Solution47().permuteUnique([1, 1]))
//print(Solution46().permute([1, 2, 3]))
//print(Solution17().letterCombinations("23"))


// ----- 字符串 -----

//print(Solution242().isAnagram("abc", "aba"))

//给定的树 s:
//     3
//    / \
//   4   5
//  / \
// 1   2
//给定的树 t：
//   4
//  / \
// 1   2

//var node3 = TreeNode(3)
//var node4 = TreeNode(4)
//var node5 = TreeNode(5)
//var node1 = TreeNode(1)
//var node2 = TreeNode(2)
//node3.left = node4
//node3.right = node5
//node4.left = node1
//node4.right = node2
//
//var node4_1 = TreeNode(4)
//var node1_1 = TreeNode(1)
//var node2_1 = TreeNode(2)
//node4_1.left = node1_1
//node4_1.right = node2_1
//
//Solution572().isSubtree(node3, node4_1)

// ----- 栈&队列 -----
//print(Solution739().dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73]))
//Solution654().constructMaximumBinaryTree([3,2,1,6,0,5])

//print(Solution239().maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
//var stack = MinStack.init()
//stack.push(-2)
//stack.push(0)
//stack.push(-1)
//stack.getMin()
//stack.pop()
//stack.top()
//stack.getMin()

// ----- 链表 -----
//let listNode1_1 = ListNode.init(1, nil)
//let listNode2_1 = ListNode.init(2, listNode1_1)
//let listNode2 = ListNode.init(2, listNode2_1)
//let listNode1 = ListNode.init(1, listNode2)
//Solution234().isPalindrome(listNode1)

//输入：head = [1,4,3,2,5,2], x = 3
//输出：[1,2,2,4,3,5]

//let listNode2 = ListNode.init(2, nil)
//let listNode5 = ListNode.init(5, listNode2)
//let listNode2_1 = ListNode.init(2, listNode5)
//let listNode3 = ListNode.init(3, listNode2_1)
//let listNode4 = ListNode.init(4, listNode3)
//let listNode1 = ListNode.init(1, listNode4)
//
//Solution86().partition(listNode1, 3)


// 4 -> 1 -> [8 -> 4 -> 5] -> 5 -> 0 -> 1 -> [8 -> 4 -> 5]
// 5 -> 0 -> 1 -> [8 -> 4 -> 5] -> 4 -> 1 -> [8 -> 4 -> 5]

//let listNode21 = ListNode.init(21, nil)
//let listNode19 = ListNode.init(19, listNode21)
//let listNode17 = ListNode.init(17, listNode19)
//let listNode15 = ListNode.init(15, listNode17)
//let listNode13 = ListNode.init(13, listNode15)
//let listNode11 = ListNode.init(11, listNode13)
//let listNode9 = ListNode.init(9, listNode11)
//let listNode7 = ListNode.init(7, listNode9)
//let listNode5 = ListNode.init(5, listNode7)
//let listNode3 = ListNode.init(3, listNode5)
//let listNode1 = ListNode.init(1, listNode3)
//
//let listNode2 = ListNode.init(2, nil)

//let listNode5 = ListNode.init(5, nil)
//let listNode4 = ListNode.init(4, listNode5)
//let listNode8 = ListNode.init(8, listNode4)
//
//let listNode1 = ListNode.init(1, listNode8)
//let listNode4_1 = ListNode.init(4, listNode1)
//
//let listNode1_1 = ListNode.init(1, listNode8)
//let listNode0 = ListNode.init(0, listNode1_1)
//let listNode5_1 = ListNode.init(5, listNode0)
//Solution160().getIntersectionNode(listNode1, listNode2)


//let listNode4 = ListNode.init(4, nil)
//let listNode6 = ListNode.init(6, listNode4)
//let listNode5 = ListNode.init(5, listNode6)
//
//let listNode3 = ListNode.init(3, nil)
//let listNode4_1 = ListNode.init(4, listNode3)
//let listNode2 = ListNode.init(2, listNode4_1)
//
//let listNode9 = ListNode.init(9, nil)
//let listNode9_1 = ListNode.init(9, nil)
//let listNode9_2 = ListNode.init(9, listNode9_1)
//
//Solution2().addTwoNumbers(listNode9, listNode9_2)

//let listNode6 = ListNode.init(6, nil)
//let listNode5 = ListNode.init(5, listNode6)
//let listNode4 = ListNode.init(4, listNode5)
//let listNode3 = ListNode.init(3, listNode4)
//let listNode6_1 = ListNode.init(6, listNode3)
//let listNode2 = ListNode.init(2, listNode6_1)
//let listNode1 = ListNode.init(1, listNode2)
//
//let listNode7_1 = ListNode.init(7, nil)
//let listNode7_2 = ListNode.init(7, listNode7_1)
//let listNode7_3 = ListNode.init(7, listNode7_2)
//let listNode7_4 = ListNode.init(7, listNode7_3)
//
//print(Solution203().removeElements(listNode1, 6) as Any)

// ----- 数组排序 -----
//print(Solution977().sortedSquares([-5,-3,-2,-1]))
//print(Solution16_16().subSort([1,2,4,7,10,11,7,12,6,7,16,18,19]))

//var array75 = [1]
//print(Solution75().sortColors(&array75))

//var array88 = [2,0]
//print(Solution88().merge(&array, 1, [1], 1))

// ----- 二叉树 -----
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

// ----- 动态规划 -----
//print(Solution5().longestPalindrome("cbbd"))
//print(Solution62().uniquePaths(7, 3))
//print(Solution64().minPathSum([[1,3,1],[1,5,1],[4,2,1]]))
//print(Solution121().maxProfit([7,1,5,3,6,4]))
//print(SolutionOffer47().maxValue([[1,3,1],[1,5,1],[4,2,1]]))


