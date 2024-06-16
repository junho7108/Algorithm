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
        var netWork: [Int: [Int]] = [:]
        var startNumberList: Set<Int> = Set<Int>()
        var visited: [Bool] = [Bool](repeating: false, count: n + 1)
        
        for i in 1 ... n { netWork.updateValue([], forKey: i) }
    
        computers.enumerated().forEach { (index, computer) in
            for i in 0 ..< computer.count {
                if i != index && computer[i] == 1 {
                    netWork[index + 1]?.append(i + 1)
                }
            }
        }
        
        func bfs() {
            for i in 1 ... n {
                var queue: [Int] = [i]
             
                while !queue.isEmpty {
                    let first = queue.removeFirst()
                
                    if !visited[first] {
                        visited[first] = true
                        startNumberList.insert(i)
                      
                        if let list = netWork[first] {
                            list.forEach { queue.append($0) }
                        }
                    }
                }
            }
        }
     
        bfs()
        return startNumberList.count
    }
    
    func solution() {
        self.solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])
        self.solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]])
        self.solution(3, [[1, 0, 1], [0, 1, 0], [1, 0, 1]])
    }
}
