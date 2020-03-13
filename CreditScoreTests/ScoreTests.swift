//
//  ScoreTests.swift
//  CreditScoreTests
//
//  Created by Jacobo Koenig on 13/03/2020.
//  Copyright © 2020 Binary Mango. All rights reserved.
//

import XCTest
@testable import CreditScore

class ScoreModelTests: XCTestCase {
    
    func testInitScore_ReturnsCorrectParameters() {
        let rating: Int = 540
        let percentage: Double = 0.8
        
        let expectedScore = Score(rating: rating, percentage: percentage)
        
        XCTAssertEqual(expectedScore.rating, rating)
        XCTAssertEqual(expectedScore.percentage, percentage)
    }
    
}
