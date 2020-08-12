//
//  Nacci.swift
//
//  Created by Roy Dawson on 8/11/20.
//

//  Problem:
//
//  Create a O order Fibinacci function.
//  N is the number in the sequence.
//  O is the order of Fibinacci. O = 2 is standard. O = 3 starts with 0, 0, 1
//  and sums the previous three numbers and so on.


import BigInt

protocol Nacci {
    static func nacci(_ n: Int, _ o: Int) -> BigInt
}
