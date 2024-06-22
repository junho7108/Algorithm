//
//  main.swift
//  Algorithm
//
//  Created by Junho Yoon on 6/8/24.
//

import Foundation

let N = Int(readLine()!)!
var dp: [Int] = Array(repeating: 0, count: N + 1)

for i in 1 ... N {
    let value = readLine()!.split(separator: " ").map { Int(String($0))! }
    if i + value[0] > N + 1 { continue }
    
    dp[i + value[0]] = max(value[1] + dp[1 ... i].max()!,
                      dp[i + value[0]])
}

print(dp.max()!)


