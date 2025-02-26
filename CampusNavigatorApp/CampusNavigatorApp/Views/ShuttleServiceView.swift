import SwiftUI
import AVKit

struct ShuttleServiceView: View {
    let updates = [
        (id: 1, route: "Shuttle is now heading to the lecture hall 11 to 21"),
        (id: 2, route: "Shuttle is next heading to the lecture hall 22 to main hall")
    ]
    
    @State private var player = AVPlayer(url: Bundle.main.url(forResource: "MapVideo", withExtension: "mp4") ?? URL(string: "about:blank")!)
    
    var body: some View {
        ZStack {
            // Background image
            Image("shape")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 500)
                .edgesIgnoringSafeArea(.top)
                .position(x: UIScreen.main.bounds.width / 2, y: 0)
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Text("Shuttle Service")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color(hexString: "ECF0F1"))
                    
                    Spacer()
                    
                    // Live indicator
                    HStack(spacing: 4) {
                        Circle()
                            .fill(Color(hexString: "FF4444"))
                            .frame(width: 6, height: 6)
                        
                        Text("LIVE")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color(hexString: "FF4444"))
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(Color(hexString: "FFE5E5"))
                    .cornerRadius(12)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .background(Color.clear)
                
                // Video Container
                ZStack(alignment: .bottom) {
                    VideoPlayer(player: player)
                        .onAppear {
                            player.play()
                            player.actionAtItemEnd = .none
                            
                            // Loop video
                            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
                                player.seek(to: CMTime.zero)
                                player.play()
                            }
                        }
                        .frame(height: 240)
                    
                    // Video overlay
                    VStack {
                        HStack {
                            Text("Live Shuttle Location")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .padding(16)
                        .background(Color.black.opacity(0.5))
                    }
                }
                .frame(height: 240)
                .padding(.top, 30)
                
                // Updates Section
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Live Updates")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color.accent)
                        
                        Spacer()
                        
                        Button(action: {
                            // Refresh action
                        }) {
                            Image(systemName: "arrow.clockwise")
                                .font(.system(size: 20))
                                .foregroundColor(Color.accent)
                                .padding(8)
                        }
                    }
                    
                    // Updates list
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(updates, id: \.id) { update in
                                ShuttleUpdateCardView(
                                    route: update.route,
                                    onRequest: {
                                        print("Request for: \(update.id)")
                                    },
                                    onDeny: {
                                        print("Deny for: \(update.id)")
                                    }
                                )
                            }
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 16)
                
                Spacer()
            }
        }
        .background(Color(hexString: "f5f5f5"))
        .edgesIgnoringSafeArea(.top)
    }
}

// Preview provider
struct ShuttleServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ShuttleServiceView()
    }
}