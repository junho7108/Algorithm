//
//  숨바꼭질.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/18/24.
//

import Foundation

class 숨바꼭질: Algorithm {
  
    func solution() {
     
        let input = readLine()!.split(separator: " ").map { Int($0) }
        let n = input[0]!
        let k = input[1]!

        var visited: [Bool] = [Bool](repeating: false, count: 1000001)
        var time: [Int] = [Int](repeating: 0, count: 1000001)

        func bfs() {
            var queue: [Int] = [n]
            visited[n] = true
            
            while !queue.isEmpty {
                let first = queue.removeFirst()
                
                if first == k { break }
                
                if isValid(first + 1) && !visited[first + 1] {
                    visited[first + 1] = true
                    queue.append(first + 1)
                    time[first + 1] = time[first] + 1
                }
                
                if isValid(first - 1) && !visited[first - 1] {
                    visited[first - 1] = true
                    queue.append(first - 1)
                    time[first - 1] = time[first] + 1
                }
                
                if isValid(first * 2) && !visited[first * 2] {
                    visited[first * 2] = true
                    queue.append(first * 2)
                    time[first * 2] = time[first] + 1
                }
            }
        }
        
        func isValid(_ value: Int) -> Bool {
            return value >= 0 && value < 1000001
        }     

        bfs()

        print(time[k])
    }
}
