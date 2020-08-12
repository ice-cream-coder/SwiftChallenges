//
//  File.swift
//  
//
//  Created by Roy Dawson on 8/11/20.
//

import Foundation

public protocol Futoshiki {

    typealias Puzzle = [[Int]]
    typealias ConstraintGrid = [[Character]]

    
    init()
    
    // This function will be called for test cases.
    // a default implementation is given that parses the strings into workable
    // data structures. You may optionally parse them into custom data structors
    // and solve the problem within this method instead of forwarding it to
    // solve(puzzle:lateralConstraints:verticalConstrains)
    func solve(numbers: String, constraints: String) -> String
    
    // This message will recieve the parsed data stuctures of solve(numbers:constraints)
    // This is the recomended method to implement the solution to the problem
    func solve(puzzle: Puzzle, lateralConstraints: ConstraintGrid, verticalContraints: ConstraintGrid) -> String
}

public extension Futoshiki {
    
    var size: Int { 5 }
    
    func solve(numbers: String, constraints: String) -> String {
        // Parse numbers
        let numbers = Array(numbers)
        var puzzle = Puzzle()
        for row in 0..<size {
            var rowArray = [Int]()
            for column in 0..<size {
                let number = Int(String(numbers[(row * size) + column]))!
                rowArray.append(number)
            }
            puzzle.append(rowArray)
        }
    
        // Parse contrainsts
        let constraints = Array(constraints)
        var lateralConstraints = [[Character]]()
        for row in 0..<size {
            let start = (row * (size - 1))
            lateralConstraints.append(Array(constraints[start..<(start + size - 1)]))
        }
        var verticalContraints = [[Character]]()
        for row in 0..<size {
            let start = size * (size - 1) + (row * (size - 1))
            verticalContraints.append(Array(constraints[start..<(start + size - 1)]))
        }
        
        return solve(puzzle: puzzle, lateralConstraints: lateralConstraints, verticalContraints: verticalContraints)
    }
}
