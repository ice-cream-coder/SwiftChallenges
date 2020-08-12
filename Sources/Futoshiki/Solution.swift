
public class FutoshikiSolution: Futoshiki {

    public required init() {}
    
    func predicate(for constraint: Character) -> (Int, Int) -> Bool {
        switch constraint {
        case "<":
            return { a,b in
                a < b
            }
        case ">":
            return { a,b in
                a > b
            }
        default:
            return { a, b in
                true
            }
        }
    }

    func opposite(_ constraint: Character) -> Character {
        switch constraint {
        case "<":
            return ">"
        case ">":
            return "<"
        default:
            return constraint
        }
    }

    func limit(by that: Int, with constraint: Character) -> Set<Int> {
        if that == 0 { return Set<Int>() }
        else { return Set<Int>(1...size).filter({ !predicate(for: constraint)($0, that) }) }
    }

    func possible(_ row: Int, _ col: Int, puzzle: Puzzle) -> Set<Int> {
        
        var taken = Set<Int>()
        
        // Preset
        if puzzle[row][col] != 0 {
            taken = taken.union(Set<Int>(1...size).subtracting(Set<Int>([puzzle[row][col]])))
        }
        
        // Regular contraints
        for row in 0..<row {
            let number = puzzle[row][col]
            if number != 0 {
                taken.insert(number)
            }
        }
        for col in 0..<col {
            let number = puzzle[row][col]
            if number != 0 {
                taken.insert(number)
            }
        }
        
        //Inequalities
        //Right
        if col < size - 1 {
            taken = taken.union(limit(by: puzzle[row][col + 1], with: lateralConstraints[row][col]))
        }
        //Left
        if col > 0 {
            taken = taken.union(limit(by: puzzle[row][col - 1], with: opposite(lateralConstraints[row][col - 1])))
        }
        //Bottom
        if row < size - 1 {
            taken = taken.union(limit(by: puzzle[row + 1][col], with: verticalContraints[col][row]))
        }
        //Top
        if row > 0 {
            taken = taken.union(limit(by: puzzle[row - 1][col], with: opposite(verticalContraints[col][row - 1])))
        }
        
        return Set(1...size).subtracting(taken)
    }

    func choose(_ row: Int, _ col: Int, puzzle: Puzzle) -> [Puzzle] {
        possible(row, col, puzzle: puzzle).map {
            var next = puzzle
            next[row][col] = $0
            return next
        }
    }

    func print(puzzle: Puzzle) {
        for row in 0..<size {
            Swift.print(puzzle[row].map(String.init).joined())
        }
        Swift.print()
    }
    
    var lateralConstraints: ConstraintGrid!
    var verticalContraints: ConstraintGrid!

    public func solve(puzzle: Puzzle, lateralConstraints: ConstraintGrid, verticalContraints: ConstraintGrid) -> String {
        // Initialize puzzle
        self.lateralConstraints = lateralConstraints
        self.verticalContraints = verticalContraints
        var permutations = [puzzle]

        // Do a breadth first search for all possible solutions
        for row in 0..<size {
            for col in 0..<size {
                var next = [Puzzle]()
                for permutation in permutations {
                    next += choose(row, col, puzzle: permutation)
                }
                permutations = next
            }
        }

        // Verify that there is only one possible solution
        if permutations.count == 1 {
            return permutations[0].map({ $0.map(String.init).joined() }).joined()
        } else {
            return "There where \(permutations.count) possible answers."
        }
    }
}



