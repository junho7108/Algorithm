//
//  전력망을둘로나누기.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/16/24.
//

import Foundation

class 전력망을둘로나구기: Algorithm {
    
    @discardableResult
    private func solution(_ n:Int, _ wires:[[Int]]) -> Int {
        var graph: [Int: [Int]] = [:]
        var result: Int = 999
        
        for i in 1 ... n {  graph[i] = [] }
        
        wires.forEach { wire in
            graph[wire[0]]?.append(wire[1])
            graph[wire[1]]?.append(wire[0])
        }
        
        func bfs(visited: inout [Bool]) -> Int {
            var count: Int = 0
            var queue: [Int] = [1]
          
            while !queue.isEmpty {
                let first = queue.removeFirst()
                
                if !visited[first] {
                    visited[first] = true
                    count += 1
                    
                    graph[first]?.forEach { queue.append($0)}
                }
            }
            
            return count
        }
         
        for i in 1 ... n {
            var visited = [Bool](repeating: false, count: n + 1)
            visited[i] = true
            
            let count = bfs(visited: &visited)

            result = min(result, abs(n - count - count))
        }
        
        print(result)
    
        return result
    }
    
    func solution() {
        self.solution(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]])
        self.solution(4, [[1,2],[2,3],[3,4]])
        self.solution(7, [[1,2],[2,7],[3,7],[3,4],[4,5],[6,7]])
    }
}
