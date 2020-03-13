//
//  Shortest Path .swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Diego Espinosa on 2020-03-13.
//  Copyright © 2020 Diego Espinosa. All rights reserved.
//

import Foundation
func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
    var count = Array<Array<Int>>(repeating: Array<Int>(repeating: Int.max , count: N + 1), count: N + 1)
    for time in times {
        count[time[0]][time[1]] = time[2]
    }
    for i in 0...N {
        count[i][i] = 0
    }
    for i in 1...N {
        for j in 1...N {
            for k in 1...N {
                if !(count[j][i] == Int.max || count[i][k] == Int.max) {
                    count[j][k] = min(count[j][k], count[j][i] + count[i][k])
                }
            }
        }
    }
    var lenght = count[K]
    lenght.removeFirst()
    let maxDistance = lenght.max()!
    return maxDistance == Int.max ? -1 : maxDistance
}
