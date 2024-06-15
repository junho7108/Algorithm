//
//  피로도.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/15/24.
//

import Foundation

class 피로도: Algorithm {
    
    @discardableResult
    private func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
        var result: Int = 0
        var visited: [Bool] = [Bool](repeating: false, count: dungeons.count)
        
        func dfs(currentValue: Int, count: Int) {
            
            result = max(result, count)
            
            for i in 0 ..< dungeons.count {
                let minValue = dungeons[i].first!
                let usedValue = dungeons[i].last!
                
                if currentValue >= minValue && !visited[i] {
                    visited[i] = true
                    
                    dfs(currentValue: currentValue - usedValue, count: count + 1)
                    
                    visited[i] = false
                }
            }
        }
        
        dfs(currentValue: k, count: 0)
        
        print(result)
        
        return result
    }
    
    func solution() {
        self.solution(80, [[80,20],[50,40],[30,10]])
    }
}
