//
//  TargetNumber.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/13/24.
//

import Foundation

// 프로그래머스 Level2. 타겟넘버

struct TargetNumber: Algorithm {
    @discardableResult
    func solution(_ numbers:[Int], _ target:Int) -> Int {
        var result: Int = 0
        
        dfs(start: 0, result: &result, currentIndex: 0, numbers: numbers, target: target)
    
        return result
    }
    
    func dfs(start: Int, result: inout Int, currentIndex: Int, numbers: [Int], target: Int) {
        if currentIndex == numbers.count {
            if start == target { result += 1}
            return
        }
        
        dfs(start: start + numbers[currentIndex]
            , result: &result,
            currentIndex: currentIndex + 1,
            numbers: numbers,
            target: target)
        
        dfs(start: start - numbers[currentIndex]
            , result: &result,
            currentIndex: currentIndex + 1,
            numbers: numbers,
            target: target)
    }
  
    func solution() {
        self.solution([1, 1, 1, 1, 1], 3)
        self.solution([4, 1, 2, 1], 4)
    }
}
