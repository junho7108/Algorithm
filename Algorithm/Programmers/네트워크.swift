//
//  네트워크.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/16/24.
//

import Foundation

class 네트워크: Algorithm {
    
    @discardableResult
    private func solution(_ n:Int, _ computers:[[Int]]) -> Int {
        var startNumberList: Set<Int> = []
        var visited: [Bool] = [Bool](repeating: false, count: computers.count)
        
        func bfs(start: Int) {
            var queue: [Int] = [start]
            
            while !queue.isEmpty {
                let start = queue.removeFirst()
                
                if !visited[start] {
                    visited[start] = true
                    
                    for (index, elem) in computers[start].enumerated() {
                        if elem == 1 { queue.append(index) }
                    }
                }
            }
        }
        
        for i in 0 ..< computers.count {
            if !visited[i] { startNumberList.insert(i) }
            bfs(start: i)
        }
        
        return startNumberList.count
    }
    
    func solution() {
        self.solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])
        self.solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]])
        self.solution(3, [[1, 0, 1], [0, 1, 0], [1, 0, 1]])
    }
}
