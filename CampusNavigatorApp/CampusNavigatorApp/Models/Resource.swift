import SwiftUI

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