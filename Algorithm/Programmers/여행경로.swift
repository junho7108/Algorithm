//
//  여행경로.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/14/24.
//

import Foundation

struct 여행경로: Algorithm {
    
    @discardableResult
    private func solution(_ tickets:[[String]]) -> [String] {
        
        let tickets: [[String]] = tickets.sorted(by: { $0.last! < $1.last!})
        
        var result: [String] = []
        
        var visited: [Bool] = [Bool](repeating: false, count: tickets.count)
        
        func dfs(start: String) {
            
            if result.count == tickets.count {
                result.append(start)
                return
            }
       
            for i in 0 ..< tickets.count {
                let first = tickets[i].first!
                let last = tickets[i].last!
                
                if first == start && !visited[i] {
                    visited[i] = true
                    result.append(first)
                    
                    dfs(start: last)
                    
                    if result.count == tickets.count + 1 { return }
                    
                    result.removeLast()
                    visited[i] = false
                }
            }
        }
        
        dfs(start: "ICN")
        
        print(result)
       
        return result
    }
    
    func solution() {
        self.solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]])
        
        self.solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]])
        
        self.solution([["ICN", "BBB"], ["BBB", "ICN"], ["ICN", "AAA"]])
         // solution: ["ICN", "BBB", "ICN", "AAA"]]
        
        self.solution([["ICN", "AAA"], ["AAA", "ICN"], ["ICN", "CCC"], ["CCC", "ICN"], ["ICN", "DDD"], ["DDD", "AAA"]])
        // solution: ["ICN", "AAA", "ICN", "CCC", "ICN", "DDD", "AAA"]
    
        self.solution([["ICN", "AOO"], ["AOO", "BOO"], ["BOO", "COO"], ["COO", "DOO"], ["DOO", "EOO"], ["EOO", "DOO"], ["DOO", "COO"], ["COO", "BOO"], ["BOO", "AOO"]])
        // solution: ["ICN", "AOO", "BOO", "COO", "DOO", "EOO", "DOO", "COO", "BOO", "AOO"]
    }
}
