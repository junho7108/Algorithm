//
//  마법의엘레베이터.swift
//  Algorithm
//
//  Created by Junho Yoon on 7/1/24.
//

import Foundation

final class 마법의엘레베이터: Algorithm {
    func solution() {
        self.solution(16)
        self.solution(2554)
    }
    
    @discardableResult
    private func solution(_ storey:Int) -> Int {
        var storey = storey
        var result: Int = 0
        
        while storey != 0 {
            if storey % 10 > 5
                || (storey % 10 == 5 && (storey / 10) % 10 >= 5) {
                
                result += 10 - (storey % 10)
                
                storey = (storey / 10) + 1
                
            } else {
                result += storey % 10
                
                storey = storey / 10
            }
        }
        
        print(result)
        
        return result
    }
}
