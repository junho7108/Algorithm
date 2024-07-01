//
//  점프와순간이동.swift
//  Algorithm
//
//  Created by Junho Yoon on 7/2/24.
//

import Foundation

class 점프와순간이동: Algorithm {
    func solution() {
        solution(5)
        solution(6)
        solution(5000)
    }
    
    @discardableResult 
    private func solution(_ n:Int) -> Int
    {
        var result: Int = 0
        var n = n
        
        while n != 0 {
            
            if n % 2 == 0 {
                n /= 2
            } else {
                n -= 1
                result += 1
            }
        }
        
        print(result)
        
        return result
    }
}
