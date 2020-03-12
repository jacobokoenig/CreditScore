//
//  ContentView.swift
//  CreditScore
//
//  Created by Jacobo Koenig on 12/03/2020.
//  Copyright © 2020 Binary Mango. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                ZStack {
                    Circle()
                        .stroke(lineWidth: 1)
                        .foregroundColor(
                            Color.black
                    )
                        .padding(60)
                    
                    Circle()
                        .trim(from: 0.0, to: 0.8)
                        .stroke(
                            AngularGradient(
                                gradient: Constants.csGradient, center: .center, startAngle: .degrees(0), endAngle: .degrees(360)
                            ),
                            style: StrokeStyle(
                                lineWidth: 4, lineCap: .round, lineJoin: .round
                            )
                    ).rotationEffect(
                        Angle(degrees: 270.0)
                    )
                        .padding(70)
                    
                    VStack {
                        Text("Your credit score is")
                        Text("327")
                            .foregroundColor(.yellow)
                            .font(.system(size: 60))
                            .fontWeight(.ultraLight)
                        Text("out of 700")
                    }
                    .padding(100)
                }
                
            }
            .navigationBarTitle("Dashboard", displayMode: .inline
            )
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
