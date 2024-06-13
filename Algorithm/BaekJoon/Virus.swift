//
//  Virus.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/13/24.
//

import Foundation

class BaekJoonVirus: Algorithm {
    var list: [Int: [Int]] = [:]
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    
    var virusNode: [Int] = []
    lazy var visited: [Bool] = [Bool](repeating: false, count: n + 1)
    
    func solution() {
        for index in 1 ... n { list[index] = [] }
     
        for _ in 0 ..< m {
            let array = readLine()!.split(separator: " ").map{Int(String($0))!}
            
            let first = array.first!
            let last = array.last!
            
            list[first]!.append(last)
            list[last]?.append(first)
        }
        
        bfs()
        
        print(virusNode.count - 1)
    }
    
    func bfs() {
        var queue: [Int] = [1]
    
        while !queue.isEmpty {
            let first = queue.removeFirst()
         
            if !visited[first] {
                visited[first] = true
                
                virusNode.append(first)
                
                if let nodesToVisit = list[first] {
                    nodesToVisit.forEach { node in
                        queue.append(node)
                    }
                }
            }
        }
    }
}
