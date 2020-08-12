import XCTest
import Futoshiki
import BigInt


final class FutoshikiTest: XCTestCase {
    
    let futoshikiSolution = FutoshikiSolution.self
    
    func testFutoshiki() throws {
        let problems = [
            ("0000404010000000000000000", "|<|>|||||<|||||||||||<|<|||||||||||<>|<|"),
            ("0000000030000000000000000", "|||||<||||||>|||||||<|>|||<||||||||<||<<"),
            ("2000000000000000000000000", "|||<||||||<||||||<<<|||||<||<|>|>|||||||"),
            ("0000000000000000000000000", "<|>||||>|||<<|||||>|||||||||<<|||<||||||"),
            ("2000030000000020000000000", "|||<>||||||<||<|||||||||||<||>|||||||<|>"),
            ("0000000000000000020000000", ">>|<|>||||||<|||||||||||||||||||>|>|||>>")
        ]
        let answers = [
            "3125424513523411342545132",
            "1425321435523414351235124",
            "2513442513134525432131245",
            "4521354321124352315431542",
            "2314532451543121523441523",
            "3214554321215344521313452"
        ]
        
        for (problem, answer) in zip(problems, answers) {
            let futoshikik = futoshikiSolution.init()
            let response = futoshikik.solve(numbers: problem.0, constraints: problem.1)
            XCTAssertEqual(response, answer)
        }
    }

    static var allTests = [
        ("testNacci", testFutoshiki),
    ]
}

