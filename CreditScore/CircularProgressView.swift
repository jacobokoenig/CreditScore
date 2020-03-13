//
//  CircularProgressView.swift
//  CreditScore
//
//  Created by Jacobo Koenig on 12/03/2020.
//  Copyright © 2020 Binary Mango. All rights reserved.
//

import SwiftUI

struct CircularProgressView: View {
    @EnvironmentObject var ratingViewModel: RatingViewModel
    
    var body: some View {
        return ZStack {
            Circle()
                .stroke(lineWidth: 1)
                .foregroundColor(
                    Color.black)
                .padding(60)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(self.ratingViewModel.percentage))
                .stroke(
                    AngularGradient(
                        gradient: Constants.csGradient, center: .center, startAngle: .degrees(0), endAngle: .degrees(360)
                    ),
                    style: StrokeStyle(
                        lineWidth: 4, lineCap: .round, lineJoin: .round
                ))
                .rotationEffect(
                    Angle(degrees: 270.0))
                .animation(.easeOut)
                .padding(70)
            
            VStack {
                Text("Your credit score is")
                Text(String(self.ratingViewModel.rating))
                    .foregroundColor(.yellow)
                    .font(.system(size: 60))
                    .fontWeight(.ultraLight)
                Text("out of 700")
            }
            .padding(100)
        }
    }
}

