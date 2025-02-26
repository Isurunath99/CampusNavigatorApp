//
//  Dashboard.swift
//  CampusNavigatorApp
//
//  Created by sasiri rukshan nanayakkara on 2/24/25.
//

import SwiftUI

// struct DashboardView: View {
//     var body: some View {
//         NavigationView {
//             ZStack {
//                 Color(UIColor.systemGray6)
//                     .ignoresSafeArea()

//                 VStack(spacing: 30) {
//                     Text("Square Game")
//                         .font(.largeTitle)
//                         .fontWeight(.bold)
//                         .foregroundColor(Color.primary)
//                         .padding(.bottom, 40)

//                     VStack(spacing: 20) {
//                         NavigationLink(destination: QAForumScreen()) {
//                             buttonStyle(text: "Start Game", backgroundColor: .blue)
//                         }
//                         NavigationLink(destination: EventsScreen()) {
//                             buttonStyle(text: "Start Game", backgroundColor: .blue)
//                         }
//                         NavigationLink(destination: LiveUpdatesScreen()) {
//                             buttonStyle(text: "Start Game", backgroundColor: .blue)
//                         }
//                     }

//                     Spacer()
//                 }
//                 .padding()
//             }
//         }
//     }

//     private func buttonStyle(text: String, backgroundColor: Color) -> some View {
//         Text(text)
//             .font(.headline)
//             .foregroundColor(.white)
//             .frame(maxWidth: .infinity, minHeight: 50)
//             .background(backgroundColor)
//             .cornerRadius(12)
//             .shadow(color: backgroundColor.opacity(0.4), radius: 8, x: 0, y: 4)
//             .padding(.horizontal, 16)
//     }
// }

struct DashboardView: View {
    @State private var showTourGuide = true
    @State private var userName = "Mahel Chandupa"
    
    var body: some View {
        ZStack {
            // Background
            BackgroundView()
            
            // Main content
            VStack(spacing: 0) {
                // Header
                HeaderView(userName: userName)
                
                // Main title
                MainTitleView()
                
                // Navigation buttons
                NavigationButtonsView()
                
                Spacer()
            }
            
            // Chatbot button (floating)
            ChatbotButtonView()
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 80)
            
            // Tour guide overlay
            if showTourGuide {
                TourGuideOverlayView(onComplete: {
                    showTourGuide = false
                })
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            checkFirstVisit()
        }
    }
    
    private func checkFirstVisit() {
        // Check UserDefaults to see if this is the first visit
        if UserDefaults.standard.object(forKey: "firstHomePageVisit") == nil {
            showTourGuide = true
        } else {
            showTourGuide = false
        }
    }
}

#Preview {
    DashboardView()
}
