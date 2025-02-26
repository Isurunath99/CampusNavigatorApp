//
//  Question.swift
//  CampusNavigatorApp
//
//  Created by sasiri rukshan nanayakkara on 2/24/25.
//

struct Question: Identifiable {
    let id: Int
    let title: String
    let preview: String
    let tags: [String]
    let userName: String
    let timeAgo: String
    let answerCount: Int
}
