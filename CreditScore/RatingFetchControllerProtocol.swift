//
//  RatingFetchControllerProtocol.swift
//  CreditScore
//
//  Created by Jacobo Koenig on 13/03/2020.
//  Copyright © 2020 Binary Mango. All rights reserved.
//

import Foundation

protocol RatingFetchControllerProtocol {
    func fetchRating(completion: @escaping ((Result<Score, Error>) -> Void))
}
