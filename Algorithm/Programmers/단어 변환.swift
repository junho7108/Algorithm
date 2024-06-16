//
//  단어 변환.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/16/24.
//

import Foundation

class 단어변환: Algorithm {
    
    @discardableResult
    private func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
        guard words.contains(target) else { return 0 }
        
        var result: Int = 0
        var visited: [Bool] = [Bool](repeating: false, count: words.count)
        
        
        func dfs(begin: String, target: String, count: Int) {
         
            result = min(result, count)
            
            if begin == target { return }
            
            for i in 0 ..< words.count {
                
                if isOneCharDifferent(begin, words[i]) && !visited[i] {
                    visited[i] = true
                    
                    result += 1
       
                    dfs(begin: words[i], target: target, count: count + 1)
                    
                    visited[i] = false
                }
            }
        }
        
        dfs(begin: begin, target: target, count: 0)
        
        return result
    }
    
    func isOneCharDifferent(_ str1: String, _ str2: String) -> Bool {
        let characters1 = Array(str1)
        let characters2 = Array(str2)
        var differenceCount = 0
        
        for i in 0..<characters1.count {
               if characters1[i] != characters2[i] {
                   differenceCount += 1
            
                   if differenceCount > 1 {
                       return false
                   }
               }
           }
           return differenceCount == 1
    }
    
    func solution() {
        self.solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])
        // solution: "hit" -> "hot" -> "dot" -> "dog" -> "cog"
        
        self.solution("hit", "cog", ["hot", "dot", "dog", "lot", "log"])
    }
}
