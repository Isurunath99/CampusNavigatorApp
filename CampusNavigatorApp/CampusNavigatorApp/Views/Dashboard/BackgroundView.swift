import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Color(hexString: "#1a2a3a") // Dark blue background
                .edgesIgnoringSafeArea(.all)
            
            Image("Pattern")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
}