//
//  롤케이크자르기.swift
//  Algorithm
//
//  Created by Junho Yoon on 7/1/24.
//

import Foundation

class 롤케이크자르기: Algorithm {
    
    func solution() {
        solution([1, 2, 1, 3, 1, 4, 1, 2])
        solution([1, 2, 3, 1, 4])
    }
    
    @discardableResult
    private func solution(_ topping:[Int]) -> Int {
        var result: Int = 0
        
        var leftTopping: [Int: Int] = [:]
        var rightTopping: [Int: Int] = [:]
        
        topping.forEach { elem in
            if !leftTopping.keys.contains(elem) {
                leftTopping[elem] = 1
            } else {
                leftTopping[elem]! += 1
            }
        }
        
        topping.forEach { elem in
            if leftTopping[elem] == 1,
               let firstIndex = leftTopping.keys.firstIndex(of: elem) {
                leftTopping.remove(at: firstIndex)
            } else {
                leftTopping[elem]! -= 1
            }
         
            
            if !rightTopping.keys.contains(elem) {
                rightTopping[elem] = 1
            } else {
                rightTopping[elem]! += 1
            }
            
            if leftTopping.keys.count == rightTopping.keys.count { result += 1}
        }
     
        return result
    }
}
