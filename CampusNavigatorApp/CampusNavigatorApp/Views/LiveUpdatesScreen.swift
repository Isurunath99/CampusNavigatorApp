//
//  LiveUpdatesScreen.swift
//  CampusNavigatorApp
//
//  Created by sasiri rukshan nanayakkara on 2/24/25.
//

import SwiftUI

struct LiveUpdatesScreen: View {
    let resources: [Resource] = [
        Resource(id: 1, title: "Main Library", currentCount: 145, maxCapacity: 200, isOpen: true, peakLevel: "high", openUntil: "10:00 PM"),
        Resource(id: 2, title: "Student Center Cafeteria", currentCount: 85, maxCapacity: 150, isOpen: true, peakLevel: "normal", openUntil: "8:00 PM"),
        Resource(id: 3, title: "Engineering Building Cafe", currentCount: 20, maxCapacity: 50, isOpen: true, peakLevel: "normal", openUntil: "6:00 PM"),
        Resource(id: 4, title: "Gym", currentCount: 45, maxCapacity: 60, isOpen: true, peakLevel: "high", openUntil: "11:00 PM"),
        Resource(id: 5, title: "Computer Lab", currentCount: 0, maxCapacity: 30, isOpen: false, peakLevel: "normal", openUntil: "Closed")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color(UIColor.systemGray6)
                    .ignoresSafeArea()
                
                // Shape image at the top
                Image("shape")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 500)
                    .edgesIgnoringSafeArea(.top)
                    .position(x: UIScreen.main.bounds.width / 2, y: 0)
                
                // Content
                VStack(spacing: 0) {
                    // Custom navigation header
                    HStack {
                        Text("Live Updates")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        HStack(spacing: 4) {
                            Image(systemName: "arrow.clockwise")
                                .font(.footnote)
                                .foregroundColor(.white)
                            
                            Text("Last updated: Just now")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 16)
                    
                    // Resources list
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(resources) { resource in
                                ResourceCardView(resource: resource)
                                    .onTapGesture {
                                        // Handle tap action
                                    }
                            }
                        }
                        .padding(16)
                    }
                }
            }
            .navigationBarHidden(true) // Hide the default navigation bar
        }
    }
}

#Preview {
    LiveUpdatesScreen()
}