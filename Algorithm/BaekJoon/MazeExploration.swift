//
//  MazeExploration.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/14/24.
//

import Foundation

class MazeExploration: Algorithm {
    func solution() {
        let direction = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        
        let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
        
        let height = nm[0]
        let width = nm[1]
        
        var maze = [[Int]]()
        var count = [[Int]](repeating: [Int](repeating: 0, count: width), count: height)
       
        for _ in 0 ..< height {
            maze.append(readLine()!.map{Int(String($0))!})
        }
    
        func bfs() {
            var queue: [(Int, Int)] = [(0, 0)]
       
            var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: width), count: height)
            
            visited[0][0] = true
            
            count[0][0] = 1
        
            while !queue.isEmpty {
                let first = queue.removeFirst()
                let x = first.0
                let y = first.1
                
                direction.forEach { (dx, dy) in
                    let nextX = x + dx
                    let nextY = y + dy
                    
                    if nextX >= 0 && nextY >= 0
                        && nextX < width && nextY < height {
                        
                        if maze[nextY][nextX] == 1 && !visited[nextY][nextX] {
                            
                            visited[nextY][nextX] = true
                            
                            count[nextY][nextX] = count[y][x] + 1
                            
                            queue.append((nextX, nextY))
                        }
                    }
                }
            }
        }
        
        bfs()
    
        print(count[height - 1][width - 1])
    }
}
