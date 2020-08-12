//
//  main.swift
//  Nacci
//
//  Created by Roy Dawson on 11/25/19.
//  Copyright © 2019 Lucid Software. All rights reserved.
//
//  Create a O order Fibinacci function.
//  N is the number in the sequence.
//  O is the order of Fibinacci. O = 2 is standard. O = 3 starts with 0, 0, 1
//  and sums the previous three numbers and so on.

import BigInt


// This solution will call itself to produce previous fibanaccie numbers
// Althought this approach is intuitive it takes the time complexity is O(O^N)
public struct NacciRecursiveSolution: Nacci {
    
    public static func nacci(_ n: Int, _ o: Int) -> BigInt {
        if n < o - 1 {
            return 0
        } else if n == o - 1 {
            return 1
        }
        return (1...o)
            .map { nacci(n - $0, o) }
            .reduce(0, +)
    }
}

// This solution will iteratively replace the first value of the previous sum
// with the current some. Ignoring complexity due to using BigInt this will
// solve the problem in linear time.
public struct NacciIterativeSolution: Nacci {
    
    public static func nacci(_ n: Int, _ o: Int) -> BigInt {
        if n < o - 1 {
            return 0
        } else if n == o - 1 {
            return 1
        }
    
        var memo = Array(repeating: BigInt(0), count: o)
        memo[memo.count - 1] = 1
        for i in o...n {
            memo[i % o] = memo.reduce(0, +)
        }
        return memo[n % o]
    }
}


