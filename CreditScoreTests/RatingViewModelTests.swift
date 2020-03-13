//
//  CreditScoreTests.swift
//  CreditScoreTests
//
//  Created by Jacobo Koenig on 12/03/2020.
//  Copyright © 2020 Binary Mango. All rights reserved.
//

import XCTest
@testable import CreditScore

class CreditScoreTests: XCTestCase {
    let expectedScore = Score(rating: 540, percentage: 0.8)
    var mockApi: MockRatingFetchController!
    
    override func setUp() {
        mockApi = MockRatingFetchController(expectedScore)
    }
    
    override func tearDown() {
        mockApi = nil
    }
    
    func testFetchRating_ViewModelShouldBeLoadedAndContainExpectedScore() {
        let expectation = self.expectation(description: "Correct score returned")
        
        let ratingViewModel: RatingViewModel = RatingViewModel()
        
        ratingViewModel.fetchRating(using: mockApi) {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(ratingViewModel.viewStatus, .loaded)
        XCTAssertEqual(ratingViewModel.score, expectedScore)
    }
}
