//
//  빗물.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/25/24.
//

import Foundation

class 빗물: Algorithm {
    func solution() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let height = input[0]
        let width = input[1]
        
        let walls = readLine()!.split(separator: " ").map { Int($0)! }
        
        var left: Int = 0
        var right: Int = width - 1
        
        var sum = 0
        var result = 0
        
        for i in 0 ..< width {
            if walls[left] > walls[i] {
                sum += walls[left] - walls[i]
                
            } else {
                result += sum
                sum = 0
                left = i
            }
        }
        
        while right > left {
            
            for i in stride(from: width - 1, through: left, by: -1) {
                if walls[right] > walls[i] {
                    result += walls[right] - walls[i]
                } else {
                    right = i
                }
            }
        }
    
        print(result)
    }
}
