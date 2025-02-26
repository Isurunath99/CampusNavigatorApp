import SwiftUI

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