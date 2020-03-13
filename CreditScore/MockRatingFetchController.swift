//
//  MockRatingFetchController.swift
//  CreditScoreTests
//
//  Created by Jacobo Koenig on 13/03/2020.
//  Copyright © 2020 Binary Mango. All rights reserved.
//

import Foundation

class MockRatingFetchController: RatingFetchControllerProtocol {
    var expectedScore: Score
    
    init(_ score: Score) {
        self.expectedScore = score
    }
    
    func fetchRating(completion: @escaping ((Result<Score, Error>) -> Void)) {
        guard let _ = URL(string: Constants.fetchRatingUrlString) else { return } //Handle error here
        
        //Simulate server latency
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let score = self?.expectedScore else { return }
            completion(Result.success(score))
        }
    }
}
