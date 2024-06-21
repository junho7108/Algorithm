//
//  A->B.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/20/24.
//

import Foundation

class BaekJoon16953: Algorithm {
    
    func solution() {
        
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        var result: Int = 9999
     
        let a = input[0]
        let b = input[1]
      
        func dfs(start: Int, count: Int = 0) {
            if start == b {
                result = min(count, result)
                return
            }
         
            if start * 2 <= b {
                dfs(start: start * 2, count: count + 1 )
            }
            
            let string = "\(start)1"
            let value = Int(string)!
            
            if value <= b {
                dfs(start: value, count: count + 1)
            }
        }
        
        dfs(start: a, count: 1)
        
        result = result == 9999 ? -1 : result
        
        print(result)
    }
}
