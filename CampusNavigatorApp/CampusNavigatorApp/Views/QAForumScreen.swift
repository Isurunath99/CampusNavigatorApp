//
//  ContentView.swift
//  CampusNavigatorApp
//
//  Created by sasiri rukshan nanayakkara on 2/18/25.
//

import SwiftUI

struct QAForumScreen: View {
    @State private var selectedFilter = 0
    @State private var showingAskQuestion = false
    
    let questions: [Question] = [
        Question(
            id: 1,
            title: "Where is the fastest route from Engineering building to Library?",
            preview: "I have classes back to back and need the quickest path between these buildings. Are there any shortcuts?",
            tags: ["navigation", "routes"],
            userName: "John D.",
            timeAgo: "5m ago",
            answerCount: 3
        ),
        Question(
            id: 2,
            title: "Which cafeteria is open late during finals week?",
            preview: "Looking for food options after 8pm during finals week. Need to know which cafeterias extend their hours.",
            tags: ["cafeteria", "timings"],
            userName: "Sarah M.",
            timeAgo: "1h ago",
            answerCount: 5
        ),
        Question(
            id: 3,
            title: "Where can I find quiet study spaces in Science building?",
            preview: "Need recommendations for quiet study spots in the Science building. Preferably with power outlets.",
            tags: ["study-spaces", "facilities"],
            userName: "Alex K.",
            timeAgo: "2h ago",
            answerCount: 2
        )
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color(hex: "F5F5F5")
                    .ignoresSafeArea()
                
                // Shape image at the top
                Image("shape")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 500)
                    .edgesIgnoringSafeArea(.top)
                    .position(x: UIScreen.main.bounds.width / 2, y: 0)
                     
                VStack(spacing: 0) {
                    // Header
                    HStack {
                        Text("Campus Q&A")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(hex: "ECF0F1"))
                        
                        Spacer()
                        
                        Button(action: {
                            showingAskQuestion = true
                        }) {
                            HStack(spacing: 4) {
                                Image(systemName: "plus")
                                Text("Ask Question")
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color(hex: "16A085"))
                            .cornerRadius(8)
                        }
                    }
                    .padding(16)
                    
                    // Filter Tabs
                    HStack(spacing: 8) {
                        ForEach(["Recent", "Popular", "Unanswered"].indices, id: \.self) { index in
                            Button(action: {
                                selectedFilter = index
                            }) {
                                Text(["Recent", "Popular", "Unanswered"][index])
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(Color(hex: selectedFilter == index ? "2A9D8F" : "16A085"))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 6)
                                    .background(selectedFilter == index ? Color(hex: "E6F7F5") : Color.clear)
                                    .cornerRadius(16)
                            }
                        }
                        Spacer()
                    }
                    .padding(12)
                    
                    // Questions List
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(questions) { question in
                                QuestionCardView(question: question)
                                    .padding(.horizontal, 16)
                            }
                        }
                        .padding(.top, 16)
                    }
                }
            }
        }
        .sheet(isPresented: $showingAskQuestion) {
            AskQuestionModal(isPresented: $showingAskQuestion)
        }
    }
}

#Preview {
    QAForumScreen()
}
