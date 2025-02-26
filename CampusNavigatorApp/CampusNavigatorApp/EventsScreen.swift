//
//  EventsScreen.swift
//  CampusNavigatorApp
//
//  Created by sasiri rukshan nanayakkara on 2/24/25.
//

import SwiftUI
import MapKit



// MARK: - Event Card View
struct EventCardView: View {
    let event: Event
    let onPress: () -> Void
    
    var body: some View {
        Button(action: onPress) {
            VStack(alignment: .leading, spacing: 0) {
                // Image with date overlay
                ZStack(alignment: .topLeading) {
                    AsyncImage(url: URL(string: event.image)) { phase in
                        switch phase {
                        case .empty:
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        case .failure:
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .overlay(
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                )
                        @unknown default:
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                        }
                    }
                    .frame(height: 180)
                    .clipped()
                    
                    // Date box
                    Text(event.formattedDate)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(hex: "1B3054"))
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                        .padding(16)
                }
                
                // Content
                VStack(alignment: .leading, spacing: 12) {
                    // Title
                    Text(event.title)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color(hex: "1B3054"))
                        .lineLimit(1)
                    
                    // Description
                    Text(event.description)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .lineLimit(2)
                    
                    // Details
                    VStack(alignment: .leading, spacing: 8) {
                        // Time
                        HStack(spacing: 8) {
                            Image(systemName: "clock")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                            Text(event.time)
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        
                        // Location
                        HStack(spacing: 8) {
                            Image(systemName: "mappin.and.ellipse")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                            Text(event.location)
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        
                        // Capacity
                        HStack(spacing: 8) {
                            Image(systemName: "person.2")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                            Text("\(event.registeredCount)/\(event.capacity) registered")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    // View on map link
                    HStack {
                        Spacer()
                        HStack {
                            Text("View on map")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color(hex: "2A9D8F"))
                            Image(systemName: "chevron.right")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "2A9D8F"))
                        }
                        .padding(.top, 12)
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color(hex: "EEEEEE"))
                                .offset(y: -6),
                            alignment: .top
                        )
                    }
                }
                .padding(16)
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Events Screen
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
                Color(hex: "F5F5F5")
                    .ignoresSafeArea()
                
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
    
    // This function would be used in a real app
    func navigateToMap(locationId: String) {
        // Implementation would depend on your navigation setup
        print("Navigating to map with locationId: \(locationId)")
    }
}

// MARK: - Color Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Preview Provider
#Preview {
  EventsScreen()
}
