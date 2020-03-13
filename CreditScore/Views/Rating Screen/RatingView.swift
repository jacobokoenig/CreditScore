//
//  ContentView.swift
//  CreditScore
//
//  Created by Jacobo Koenig on 12/03/2020.
//  Copyright © 2020 Binary Mango. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    @EnvironmentObject var ratingViewModel: RatingViewModel
    
    init() {
        UINavigationBar.appearance()
            .titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance()
            .barTintColor = UIColor.black
    }
    
    var body: some View {
        NavigationView {
            VStack { () -> AnyView in
                switch self.ratingViewModel.viewStatus {
                    
                case .loaded:
                    return AnyView(
                        CircularProgressView()
                            .padding(60))
                    
                case .loading:
                    return AnyView(Text("Loading..."))
                    
                case .standby:
                    return AnyView(Button(action: {
                        self.ratingViewModel
                            .fetchRating()
                    }) {
                        Text("Fetch Rating")
                    })
                    
                }
                
            }
            .navigationBarTitle(
                Text("Dashboard"),
                displayMode: .inline)
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
