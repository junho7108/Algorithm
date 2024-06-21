//
//  OrganicCabbage.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/13/24.
//

import Foundation

class 유기농배추: Algorithm {
    
    func solution(_ count: Int) {
        for _ in 0 ..< count {
            solution()
        }
    }
    
    func solution() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        
        let m = input[0]
        let n = input[1]
        let k = input[2]
        
        let direction: [(Int, Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        
        var map: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        var result: Int = 0
        
        for _ in 0 ..< k {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            let x = input[0]
            let y = input[1]
            
            map[y][x] = 1
        }
        
        for y in 0 ..< n {
            for x in 0 ..< m {
                if !visited[y][x] && map[y][x] == 1 {
                    result += 1
                    bfs(start: (x, y))
                }
            }
        }
        
        print(result)
        
        func bfs(start: (Int, Int)) {
            var queue: [(Int, Int)] = [(start)]
            
            while !queue.isEmpty {
                let first = queue.removeFirst()
                
                let x = first.0
                let y = first.1
                
                visited[y][x] = true
                
                for i in 0 ..< direction.count {
                    let dx = direction[i].0
                    let dy = direction[i].1
                    
                    let nextX = x + dx
                    let nextY = y + dy
                    
                    if nextX >= 0 && nextY >= 0
                        && nextX < m && nextY < n {
                        
                        if !visited[nextY][nextX] && map[nextY][nextX] == 1 {
                            visited[nextY][nextX] = true
                            queue.append((nextX, nextY))
                        }
                    }
                }
            }
        }
    }
}
