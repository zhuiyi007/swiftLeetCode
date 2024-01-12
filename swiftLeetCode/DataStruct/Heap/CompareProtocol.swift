//
//  CompareProtocol.swift
//  swiftLeetCode
//
//  Created by firstzhang on 2021/8/30.
//

import Foundation

protocol Compare {
    func compareTo(_ node: Compare) -> Int
}
