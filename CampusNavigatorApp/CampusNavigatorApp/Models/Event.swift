//
//  Event.swift
//  CampusNavigatorApp
//
//  Created by sasiri rukshan nanayakkara on 2/25/25.
//

import SwiftUI

struct Event: Identifiable {
    let id: Int
    let title: String
    let date: String
    let time: String
    let location: String
    let locationId: String
    let description: String
    let capacity: Int
    let registeredCount: Int
    let image: String
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: date) else {
            return ""
        }
        
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter.string(from: date)
    }
}
