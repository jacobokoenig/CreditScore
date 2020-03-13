//
//  RatingViewModel.swift
//  CreditScore
//
//  Created by Jacobo Koenig on 12/03/2020.
//  Copyright © 2020 Binary Mango. All rights reserved.
//

import Foundation

class RatingViewModel: ObservableObject {
    @Published var viewStatus: RatingViewModelStatus = .standby
    @Published var score: Score = Score()
    
    func fetchRating(using api: RatingFetchControllerProtocol = RatingFetchController(), completion: (()->())? = nil) {
        viewStatus = .loading
        api.fetchRating { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let score) :
                self.viewStatus = .loaded
                self.score = score
            case .failure(_):
                //Handle error here
                self.viewStatus = .standby
                break
            }
            
            completion?()
        }
    }
}

enum RatingViewModelStatus {
    case standby
    case loading
    case loaded
}
