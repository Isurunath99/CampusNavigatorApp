import SwiftUI

struct NavButtonView: View {
    let item: NavItem
    
    var body: some View {
        NavigationLink(destination: destinationView(for: item)) {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 80, height: 80)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    
                    Image(item.iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
                
                Text(item.title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(hexString: "#222222"))
                    .padding(.top, 8)
            }
        }
    }
    
    // Function to return the destination view
    @ViewBuilder
    private func destinationView(for item: NavItem) -> some View {
        switch item.id {
        case 1: MapScreen()
        case 2: LiveUpdatesScreen()
        case 3: EventsScreen()
        case 4: QAForumScreen()
        case 5: ShuttleScreen()
        case 6: GuideScreen()
        default: Text("Unknown View")
        }
    }
}

