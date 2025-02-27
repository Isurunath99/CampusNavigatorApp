//
//  QuestionCardView.swift
//  CampusNavigatorApp
//
//  Created by sasiri rukshan nanayakkara on 2/24/25.
//

import SwiftUI

struct QuestionCardView: View {
    let question: Question
    
    var body: some View {
        Button(action: {
            print("Navigate to question details")
        }) {
            VStack(alignment: .leading, spacing: 12) {
                // Question Header
                HStack(alignment: .top) {
                    Text(question.title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(hexString: "1B3054"))
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    VStack(alignment: .center) {
                        Text("\(question.answerCount)")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color(hexString: "2A9D8F"))
                        Text("answers")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                }
                
                // Question Preview
                Text(question.preview)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .lineLimit(2)
                
                // Tags
                FlowLayout(spacing: 8) {
                    ForEach(question.tags, id: \.self) { tag in
                        Text(tag)
                            .font(.system(size: 12))
                            .foregroundColor(Color(hexString: "2A9D8F"))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(hexString: "E6F7F5"))
                            .cornerRadius(4)
                    }
                }
                
                // Question Footer
                HStack {
                    Text(question.userName)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    Text(question.timeAgo)
                        .font(.system(size: 12))
                        .foregroundColor(.gray.opacity(0.6))
                }
            }
            .padding(16)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
