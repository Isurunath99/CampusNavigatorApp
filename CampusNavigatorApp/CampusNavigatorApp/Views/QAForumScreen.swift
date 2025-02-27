import SwiftUI

struct QAForumScreen: View {
    @State private var selectedFilter = 0
    @State private var showingAskQuestion = false
    
    let filterOptions = ["Recent", "Popular", "Unanswered"]
    
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
                Color(hexString: "F5F5F5")
                    .ignoresSafeArea()
                
                Image("shape")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 500)
                    .edgesIgnoringSafeArea(.top)
                    .position(x: UIScreen.main.bounds.width / 2, y: 0)
                
                VStack(spacing: 0) {
                    // Header
                    headerView()
                    
                    // Filter Tabs
                    filterTabs()
                    
                    // Questions List
                    questionsList()
                }
            }
        }
        .sheet(isPresented: $showingAskQuestion) {
            AskQuestionModal(isPresented: $showingAskQuestion)
        }
    }
    
    /// Header View
    private func headerView() -> some View {
        HStack {
            Text("Campus Q&A")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color(hexString: "ECF0F1"))
            
            Spacer()
            
            Button(action: { showingAskQuestion = true }) {
                HStack(spacing: 4) {
                    Image(systemName: "plus")
                    Text("Ask Question")
                }
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color(hexString: "16A085"))
                .cornerRadius(8)
            }
        }
        .padding(16)
    }
    
    /// Filter Tabs View
    private func filterTabs() -> some View {
        HStack(spacing: 8) {
            ForEach(filterOptions.indices, id: \.self) { index in
                let option = filterOptions[index]
                Button(action: {
                    selectedFilter = index
                }) {
                    Text(option)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(hexString: selectedFilter == index ? "2A9D8F" : "16A085"))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(selectedFilter == index ? Color(hexString: "E6F7F5") : Color.clear)
                        .cornerRadius(16)
                }
            }
            Spacer()
        }
        .padding(12)
    }
    
    /// Questions List View
    private func questionsList() -> some View {
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

#Preview {
    QAForumScreen()
}

