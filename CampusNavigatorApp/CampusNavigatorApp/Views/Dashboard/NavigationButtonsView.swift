import SwiftUI

struct NavigationButtonsView: View {
    let navigationItems: [[NavItem]] = [
        [
            NavItem(id: 1, title: "Map", iconName: "Map"),
            NavItem(id: 2, title: "Live", iconName: "Live"),
            NavItem(id: 3, title: "Events", iconName: "Events")
        ],
        [
            NavItem(id: 4, title: "Discussion", iconName: "Discussion"),
            NavItem(id: 5, title: "Shuttle", iconName: "Shuttle"),
            NavItem(id: 6, title: "Guide", iconName: "Guide")
        ]
    ]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.white)
                .frame(height: 400)
            
            VStack(spacing: 20) {
                ForEach(navigationItems, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(row, id: \.id) { item in
                            NavButtonView(item: item)
                                .frame(width: UIScreen.main.bounds.width / 3)
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.top, 40)
        }
    }
}