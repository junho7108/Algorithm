//
//  미로탈출.swift
//  Algorithm
//
//  Created by Junho Yoon on 7/2/24.
//

import Foundation

final class 미로탈출: Algorithm {
    
    func solution() {
        solution(["SOOOL","XXXXO","OOOOO","OXXXX","OOOOE"])
        solution(["LOOXS","OOOOX","OOOOO","OOOOO","EOOOO"])
    }
    
    @discardableResult
    private func solution(_ maps:[String]) -> Int {
        let width = maps[0].count
        let height = maps.count
        
        var maze: [[String]] = []
        
        let directions = [(1, 0), (-1, 0), (0 ,1), (0, -1)]
        
        var start: (Int, Int)?
        var lever: (Int, Int)?
        var exit: (Int, Int)?
      
        maps.forEach { elem in
            maze.append(elem.map { String($0) })
        }
        
        for i in 0 ..< maze.count {
            for j in 0 ..< maze[i].count {
                if maze[i][j] == "S" {
                    start = (j, i)
                } else if maze[i][j] == "L" {
                    lever = (j, i)
                } else if maze[i][j] == "E" {
                    exit = (j, i)
                }
            }
        }
        
        
        func bfs(start: (Int, Int), end: (Int, Int)) -> Int {
            var queue: [(Int, Int, Int)] = [(start.0, start.1, 0)] // x, y, distance
            var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: width), count: height)
          
            visited[start.1][start.0] = true
            
            while !queue.isEmpty {
                let (x, y, distance) = queue.removeFirst()
                
                if (x, y) == end {
                    return distance
                }
             
                for direction in directions {
                    let nx = x + direction.0
                    let ny = y + direction.1
                    
                    if nx >= 0 && ny >= 0
                        && nx < width && ny < height {
                        
                        if !visited[ny][nx] && maze[ny][nx] != "X" {
                            visited[ny][nx] = true
                            queue.append((nx, ny, distance + 1))
                        }
                    }
                }
            }
            
            return -1
        }
        
        guard let start, let exit, let lever else { return -1 }
      
        let distanceToExit = bfs(start: lever, end: exit)
        let distanceToLever = bfs(start: start, end: lever)
      
        let result = (distanceToExit == -1 || distanceToLever == -1) ? -1 : distanceToExit + distanceToLever
      
        return result
    }
}
