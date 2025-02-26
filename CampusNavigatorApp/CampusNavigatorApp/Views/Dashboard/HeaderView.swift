import SwiftUI

struct HeaderView: View {
    var userName: String
    
    var body: some View {
        HStack {
            Spacer()
            
            HStack {
                Image("Profile")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text("Hi, \(userName)!")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
            }
            
            Spacer()
        }
        .padding(.top, 50)
        .padding(.bottom, 10)
    }
}