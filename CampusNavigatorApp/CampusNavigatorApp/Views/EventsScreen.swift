//
//  EventsScreen.swift
//  CampusNavigatorApp
//
//  Created by sasiri rukshan nanayakkara on 2/24/25.
//

import SwiftUI
import MapKit

struct EventsScreen: View {
    @State private var events = [
        Event(
            id: 1,
            title: "Annual Sports Day",
            date: "2025-03-01",
            time: "09:00 AM",
            location: "Main Playground",
            locationId: "playground",
            description: "Join us for a day of competitive sports and fun activities.",
            capacity: 200,
            registeredCount: 150,
            image: "https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZXZlbnR8ZW58MHx8MHx8fDA%3D"
        ),
        Event(
            id: 2,
            title: "Tech Innovation Summit",
            date: "2025-03-15",
            time: "02:00 PM",
            location: "Engineering Building Auditorium",
            locationId: "eng_building",
            description: "Showcasing student projects and industry speakers.",
            capacity: 100,
            registeredCount: 45,
            image: "https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZXZlbnR8ZW58MHx8MHx8fDA%3D"
        )
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color(hex: "F5F5F5")
                    .ignoresSafeArea()
                
                // Shape image at the top
                Image("shape")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 500)
                    .edgesIgnoringSafeArea(.top)
                    .position(x: UIScreen.main.bounds.width / 2, y: 0)
                
                VStack(spacing: 0) {
                    // Header
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Campus Events")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(hex: "1B3054"))
                        
                        Text("Discover upcoming events happening around campus")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
                    .background(Color.white)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color(hex: "EEEEEE")),
                        alignment: .bottom
                    )
                    
                    // List of events
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(events) { event in
                                EventCardView(event: event) {
                                    print("Navigate to Map with location: \(event.locationId)")
                                    // In a real app, you would navigate to the map screen here
                                    // Example: navigateToMap(locationId: event.locationId)
                                }
                            }
                        }
                        .padding(16)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    func navigateToMap(locationId: String) {
        print("Navigating to map with locationId: \(locationId)")
    }
}

#Preview {
  EventsScreen()
}