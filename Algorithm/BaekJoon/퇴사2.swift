//
//  퇴사2.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/22/24.
//

import Foundation

class 퇴사2: Algorithm {

    func solution() {
        let N = Int(readLine()!)!
        var dp: [Int] = Array(repeating: 0, count: N + 1)

        for i in 1 ... N {
            let value = readLine()!.split(separator: " ").map { Int(String($0))! }
            
            let day = value[0]
            let pay = value[1]
            
            if i + day > N + 1 { continue }
            
            dp[i + day] = max(pay + dp[1 ... i].max()!,
                              dp[i + day])
        }

        print(dp.max()!)
    }
}
