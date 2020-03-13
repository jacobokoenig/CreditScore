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
    
    func fetchRating(using api: RatingFetchController = RatingFetchController()) {
        viewStatus = .loading
        api.fetchRating { [weak self] score, err in
            guard let self = self else { return }
            
            guard
                let score = score
                else {
                    //Handle error here
                    self.viewStatus = .standby
                    return
            }
            
            self.viewStatus = .loaded
            
            //Small shortcut to help with the animation of the progress bar
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.score = score
            }
        }
    }
}

enum RatingViewModelStatus {
    case standby
    case loading
    case loaded
}
