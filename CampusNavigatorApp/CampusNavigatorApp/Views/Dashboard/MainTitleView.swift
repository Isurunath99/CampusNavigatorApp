import SwiftUI

struct MainTitleView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Campus")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.white)
                .lineLimit(1)
            
            Text("Navigator")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.white)
                .lineLimit(1)
        }
        .padding(.top, 10)
        .padding(.bottom, 30)
    }
}
