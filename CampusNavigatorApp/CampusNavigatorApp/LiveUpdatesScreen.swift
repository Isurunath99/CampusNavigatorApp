//
//  LiveUpdatesScreen.swift
//  CampusNavigatorApp
//
//  Created by sasiri rukshan nanayakkara on 2/24/25.
//

import SwiftUI

// Model for resource data
struct Resource: Identifiable {
    let id: Int
    let title: String
    let currentCount: Int
    let maxCapacity: Int
    let isOpen: Bool
    let peakLevel: String
    let openUntil: String
    
    // Calculate capacity percentage
    var capacityPercentage: Double {
        return Double(currentCount) / Double(maxCapacity)
    }
    
    // Determine status color based on capacity
    var statusColor: Color {
        if capacityPercentage >= 0.8 {
            return Color.red
        } else if capacityPercentage >= 0.5 {
            return Color.orange
        } else {
            return Color.green
        }
    }
}

// Resource Card View
struct ResourceCardView: View {
    let resource: Resource
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Card Header
            HStack {
                Text(resource.title)
                    .font(.headline)
                    .foregroundColor(Color(UIColor(red: 0.11, green: 0.19, blue: 0.33, alpha: 1)))
                
                Spacer()
                
                Text(resource.isOpen ? "Open" : "Closed")
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(resource.isOpen ? Color.green : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
            if resource.isOpen {
                // Capacity Information
                VStack(spacing: 8) {
                    HStack {
                        Text("Current Capacity")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("\(resource.currentCount)/\(resource.maxCapacity)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(Color(UIColor(red: 0.11, green: 0.19, blue: 0.33, alpha: 1)))
                    }
                    
                    // Capacity Progress Bar
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: geometry.size.width, height: 6)
                                .foregroundColor(Color(UIColor.systemGray5))
                                .cornerRadius(3)
                            
                            Rectangle()
                                .frame(width: min(CGFloat(resource.capacityPercentage) * geometry.size.width, geometry.size.width), height: 6)
                                .foregroundColor(resource.statusColor)
                                .cornerRadius(3)
                        }
                    }
                    .frame(height: 6)
                }
                
                // Additional Information
                HStack {
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text("Open until \(resource.openUntil)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "chart.bar")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(resource.peakLevel == "high" ? "Peak hours" : "Normal hours")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

// Main Live Updates Screen
struct LiveUpdatesScreen: View {
    // Sample data - would come from your real-time backend
    let resources: [Resource] = [
        Resource(id: 1, title: "Main Library", currentCount: 145, maxCapacity: 200, isOpen: true, peakLevel: "high", openUntil: "10:00 PM"),
        Resource(id: 2, title: "Student Center Cafeteria", currentCount: 85, maxCapacity: 150, isOpen: true, peakLevel: "normal", openUntil: "8:00 PM"),
        Resource(id: 3, title: "Engineering Building Cafe", currentCount: 20, maxCapacity: 50, isOpen: true, peakLevel: "normal", openUntil: "6:00 PM"),
        Resource(id: 4, title: "Gym", currentCount: 45, maxCapacity: 60, isOpen: true, peakLevel: "high", openUntil: "11:00 PM"),
        Resource(id: 5, title: "Computer Lab", currentCount: 0, maxCapacity: 30, isOpen: false, peakLevel: "normal", openUntil: "Closed")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(resources) { resource in
                        ResourceCardView(resource: resource)
                            .onTapGesture {
                                // Handle tap if needed
                            }
                    }
                }
                .padding(16)
            }
            .background(Color(UIColor.systemGray6))
            .navigationTitle("Live Updates")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.clockwise")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Text("Last updated: Just now")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}


#Preview {
    LiveUpdatesScreen()
}

