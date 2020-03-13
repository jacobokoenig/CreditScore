//
//  Score.swift
//  CreditScore
//
//  Created by Jacobo Koenig on 13/03/2020.
//  Copyright © 2020 Binary Mango. All rights reserved.
//

import Foundation

struct Score: Equatable {
    var rating: Int = 0
    var percentage: Double = 0
    
    init() {}
    
    init(rating: Int, percentage: Double) {
        self.rating = rating
        self.percentage = percentage
    }
}
