//
//  Heap.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2021/8/30.
//

import Foundation

class Heap {
    
    private var array: [Compare] = []
    
    
    /// 初始化堆
    /// - Parameter elements: 数组元素
    /// - Returns: 堆
    public class func binaryHeap(_ elements: [Compare]) -> Heap {
        let heap = Heap()
        if elements.count > 0 {
            for element in elements {
                heap.array.append(element)
            }
            heap._heapify()
        }
        return heap;
    }
    
    public func size() -> Int {
        
        return array.count
    }
    
    public func isEmpty() -> Bool {
        return self.size() == 0
    }
    
    public func clear() {
        array.removeAll()
    }
    
    public func add(_ element: Compare) {
        
    }
    
    public func remove() -> Compare {
        
        return nil
    }
    
    public func replace(_ element: Compare) {
        
    }
    
    public func get() -> Compare {
        if self.size() == 0 {
            
        }
        return array.first!
    }
    
    
    /// 原地建堆
    private func _heapify() {
        
    }
}
