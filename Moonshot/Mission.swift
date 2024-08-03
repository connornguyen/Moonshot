//
//  Mission.swift
//  Moonshot
//
//  Created by Apple on 02/08/2024.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let crew: [CrewRole]
    let launchDate: String?
    let description: String
}
