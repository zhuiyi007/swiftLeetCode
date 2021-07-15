//
//  17电话号码的字母组合.swift
//  swiftLeetCode
//
//  Created by 张森 on 2021/7/15.
//  17. 电话号码的字母组合
//  https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
/**
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。
 
 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
 */


import Foundation

class Solution17 {
    
    let digitsDict:[String:[String]] =
        ["2":["a", "b", "c"],
         "3":["d", "e", "f"],
         "4":["g", "h", "i"],
         "5":["j", "k", "l"],
         "6":["m", "n", "o"],
         "7":["p", "q", "r", "s"],
         "8":["t", "u", "v"],
         "9":["w", "x", "y", "z"]]
    
    // 执行用时：0 ms, 在所有 Swift 提交中击败了100.00%的用户
    // 内存消耗：14.1 MB, 在所有 Swift 提交中击败了10.32%的用户
    func letterCombinations(_ digits: String) -> [String] {

        if digits.count == 0 {
            return []
        }
        var result = [String]()
        var tmpResult = String()
        _dfs(0, digits, &tmpResult, &result)
        return result
    }
    
    private func _dfs(_ index: Int, _ digits: String, _ tmpResult: inout String, _ result: inout [String]) {
        
        // 如果已经遍历到最后一层,则输出保存的结果
        if index == digits.count {
            
            result.append(tmpResult)
            return
        }
        // 取出当前这一层的字母数组
        let letter = String(digits[digits.index(digits.startIndex, offsetBy: index)])
        let letterArray = digitsDict[letter]
        
        for item in letterArray ?? [] {
            // 拿到一个结果后添加到当前的结果字符串中
            tmpResult.append(item)
            // 钻入下一层
            _dfs(index + 1, digits, &tmpResult, &result)
            // 完成后恢复现场
            tmpResult.removeLast()
        }
    }
}
