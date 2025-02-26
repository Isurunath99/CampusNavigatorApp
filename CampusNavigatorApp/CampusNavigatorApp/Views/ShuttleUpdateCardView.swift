import SwiftUI

struct ShuttleUpdateCardView: View {
    let route: String
    let onRequest: () -> Void
    let onDeny: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Text(route)
                .font(.system(size: 13))
                .foregroundColor(Color(hexString: "1B3054"))
                .multilineTextAlignment(.center)
            
            HStack(spacing: 12) {
                Button(action: onRequest) {
                    Text("Request")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color.accent)
                        .cornerRadius(8)
                }
                
                Button(action: onDeny) {
                    Text("Deny")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color(hexString: "D84E3E"))
                        .cornerRadius(8)
                }
            }
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}
