//
//  54螺旋矩阵.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/23.
//  54. 螺旋矩阵
//  https://leetcode-cn.com/problems/spiral-matrix

/**
 给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。

 示例 1：
 输入：matrix = [[1,2,3],
                [4,5,6],
                [7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 
 示例 2：
 输入：matrix = [[1,2,3,4],
                [5,6,7,8],
                [9,10,11,12]]
 输出：[1,2,3,4,8,12,11,10,9,5,6,7]
 */

import Foundation
class Solution54 {
    
    // 执行用时：0 ms, 在所有 Swift 提交中击败了100.00%的用户
    // 内存消耗：13.9 MB, 在所有 Swift 提交中击败了9.21%的用户
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        var top = 0
        var bottom = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1
        var result = [Int]()
        while true {
            // 横向从左到右遍历
            for index in left...right {
                result.append(matrix[top][index])
            }
            top += 1
            if top > bottom {
                break
            }
            
            // 纵向从上到下遍历
            for index in top...bottom {
                result.append(matrix[index][right])
            }
            right -= 1
            if left > right {
                break
            }
            
            // 横向从右往左遍历
            for index in (left...right).reversed() {
                result.append(matrix[bottom][index])
            }
            bottom -= 1
            if top > bottom {
                break
            }
            
            // 纵向从下到上遍历
            for index in (top...bottom).reversed() {
                result.append(matrix[index][left])
            }
            left += 1
            if left > right {
                break
            }
        }
        return result
    }
}
