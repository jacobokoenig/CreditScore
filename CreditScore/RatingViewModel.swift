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
    @Published var percentage: Double = 0
    @Published var rating: Int = 0
    
    func fetchRating() {
        viewStatus = .loaded
        rating = 349
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.percentage = 0.8
        }
    }
}

enum RatingViewModelStatus {
    case standby
    case loading
    case loaded
}
