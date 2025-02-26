import SwiftUI

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