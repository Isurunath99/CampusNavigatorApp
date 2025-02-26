//
//  AskQuestionModal.swift
//  CampusNavigatorApp
//
//  Created by sasiri rukshan nanayakkara on 2/24/25.
//

import SwiftUI

struct AskQuestionModal: View {
    @Binding var isPresented: Bool
    @State private var questionTitle: String = ""
    @State private var questionBody: String = ""
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Ask a Question")
                .font(.system(size: 20, weight: .bold))
            
            TextField("Enter your question title", text: $questionTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextEditor(text: $questionBody)
                .frame(height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            
            HStack(spacing: 10) {
                Button("Cancel") {
                    isPresented = false
                }
                .foregroundColor(Color(hex: "333333"))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                
                Button("Submit") {
                    print("Question Submitted:", questionTitle, questionBody)
                    isPresented = false
                }
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color(hex: "16A085"))
                .cornerRadius(5)
            }
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 20)
    }
}
