import SwiftUI

struct ChatbotButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 140, height: 140)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
            
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 100, height: 100)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                
                Image("Robot")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }
        }
    }
}
