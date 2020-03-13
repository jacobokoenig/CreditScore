//
//  APIController.swift
//  CreditScore
//
//  Created by Jacobo Koenig on 13/03/2020.
//  Copyright © 2020 Binary Mango. All rights reserved.
//

import Foundation

class RatingFetchController {
    func fetchRating(completion: @escaping (_ score: Score?, _ errDescription: String?) -> ()) {
        
        guard let url = URL(string: Constants.fetchRatingUrlString) else { return } //Handle error here
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            guard err == nil else { return } //Handle error here
            
            //NOTE: Since this is a mock API, we can expect the credit report info to always be returned. However, it would be necessary here to handle different scenarios such as user account being suspended
            guard
                let data = data,
                let parsedResponse = JSONParseController.dictionaryValue(of: data),
                let creditReportInfo = parsedResponse["creditReportInfo"] as? [String: Any],
                let creditScore = creditReportInfo["score"] as? Int,
                let maxScore = creditReportInfo["maxScoreValue"] as? Int
                else {
                    //Handle error here
                    return
            }
            
            let score = Score(rating: creditScore, percentage: Double(creditScore/maxScore))
            
            DispatchQueue.main.async {
                completion(score, nil)
            }
            
        }.resume()
    }
}
