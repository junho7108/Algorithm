//
//  무인도여행.swift
//  Algorithm
//
//  Created by Junho Yoon on 7/2/24.
//

import Foundation

final class 무인도여행: Algorithm {
    func solution() {
        solution(["X591X","X1X5X","X231X", "1XXX1"])
        solution(["XXX","XXX","XXX"])
        solution(["X1", "1X"]) // [1, 1]
    }
    
    @discardableResult
    func solution(_ maps:[String]) -> [Int] {
        var result: [Int] = []
        var numberMaps: [[Int]] = []
        let direction = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    
        let width = maps[0].count
        let height = maps.count
     
        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: width), count: height)
        
        maps.forEach { map in
            let charArray = map.map { String($0) }
            let numberList = charArray.map { Int($0) ?? 0 }
        
            numberMaps.append(numberList)
        }
        
        func bfs(start: (Int, Int)) {
            var queue: [(Int, Int)] = [start]
            var total: Int = numberMaps[start.1][start.0]
            
            visited[start.1][start.0] = true

            while !queue.isEmpty {
                let start = queue.removeFirst()
                
                let x = start.0
                let y = start.1

                
                direction.forEach { (dx, dy) in
                    let nextX = x + dx
                    let nextY = y + dy
                    
                    if nextX >= 0 && nextY >= 0
                        && nextX < width && nextY < height {
                        
                        if !visited[nextY][nextX] && numberMaps[nextY][nextX] != 0 {
                            visited[nextY][nextX] = true
                            
                            queue.append((nextX, nextY))
                            
                            total += numberMaps[nextY][nextX]
                        }
                    }
                }
            }
            
            if total > 0 { result.append(total) }
        }
        
        for y in 0 ..< numberMaps.count {
            for x in 0 ..< numberMaps[y].count {
                if !visited[y][x] && numberMaps[y][x] != 0 {
                    bfs(start: (x, y))
                }
            }
        }
        
    
        result = result.isEmpty ? [-1] : result.sorted()
        
        return result
    }
}
