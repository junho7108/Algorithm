//
//  배달.swift
//  Algorithm
//
//  Created by Junho Yoon on 7/2/24.
//

import Foundation

final class 배달: Algorithm {
    func solution() {
        solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3) // 4
        solution(6, [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]], 4) // 4
    }
    
    @discardableResult
    func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
        var answer = 0
        var dict: [Int: [(Int, Int)]] = [:]
        
        var distance: [Int] = [Int](repeating: Int.max, count: N + 1)
        
        for i in 1 ... N { dict[i] = [] }
        
        road.forEach { elem in
            dict[elem[0]]?.append((elem[1], elem[2]))
            dict[elem[1]]?.append((elem[0], elem[2]))
        }
       
        func dijkstra() {
            var priorityQueue: [(Int, Int)] = [(0, 1)]
            distance[1] = 0
            
            while !priorityQueue.isEmpty {
                priorityQueue.sort(by: { $0.0 < $1.0 })
                
                let (currentTiem, currentVillage) = priorityQueue.removeFirst()
                
                if currentTiem > distance[currentVillage] { continue }
                
                if let neighbors = dict[currentVillage] {
                    for (neighbor, travelTime) in neighbors {
                        let newTime = currentTiem + travelTime
                        if newTime < distance[neighbor] {
                            distance[neighbor] = newTime
                            priorityQueue.append((newTime, neighbor))
                        }
                    }
                }
                
            }
        }
        
        dijkstra()

        answer = distance.filter { $0 <= k }.count
        
        return answer
    }
}
