//
//  Cheese.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/12/24.
//

import Foundation

struct BaekJoonCheese: Algorithm {
    
    func solution() {
        let input = readLine()!
        let dimensions = input.split(separator: " ").map { Int($0)! }

        let direction: [(Int, Int)] = [(1,0), (-1, 0), (0, 1), (0, -1)]

        let height = dimensions[0]
        let width = dimensions[1]

        var cheeseMap: [[Int]] = [[Int]]()
        var cheeseCount: [Int] = []

        for _ in 0 ..< height {
            let elem = readLine()!.split(separator: " ").map { Int($0)! }
            cheeseMap.append(elem)
        }

        func search() -> Int {
            var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: width), count: height)
            visited[0][0] = true
            
            var count: Int = 0
            var queue: [(Int, Int)] = [(0, 0)]
            
            while !queue.isEmpty {
                
                let currentPosition = queue.removeFirst()
                
                
                direction.forEach { (dx, dy) in
                    let nextX = currentPosition.0 + dx
                    let nextY = currentPosition.1 + dy
                    
                    if nextX >= 0 && nextY >= 0
                        && nextX < width && nextY < height {
                        
                        if cheeseMap[nextY][nextX] == 0 && !visited[nextY][nextX] {
                            visited[nextY][nextX] = true
                            queue.append((nextX, nextY))
                            
                        } else if cheeseMap[nextY][nextX] == 1 && !visited[nextY][nextX] {
                            visited[nextY][nextX] = true
                            count += 1
                            cheeseMap[nextY][nextX] = 0
                        }
                    }
                }
            }
            
            cheeseCount.append(count)
            
            return count
        }

        while true {
            if search() == 0 { break }
        }

        print(cheeseCount)

        print(cheeseCount.count)

    }
}

