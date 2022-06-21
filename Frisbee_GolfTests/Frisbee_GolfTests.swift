//
//  Frisbee_GolfTests.swift
//  Frisbee_GolfTests
//
//  Created by noah nelson on 1/16/22.
//

import XCTest
@testable import Frisbee_Golf

class Frisbee_GolfTests: XCTestCase {

    func roundTest() {
        var players = [Player]()
        for x in 0...3 {
            players[x] = Player(rounds: 3)
        }
        
        XCTAssertEqual(players[1].getCurrentHole(), 1)
        XCTAssertEqual(players[0].getCurrentThrows(), 0)
        
    }

}
