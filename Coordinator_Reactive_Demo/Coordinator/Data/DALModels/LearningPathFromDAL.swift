//
//  LearningPathFromDAL.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import Foundation

struct LearningPathFromDAL: Decodable {
    let name: String
    let subtitle: String
    let contentItems: [LearningPathItem]
}

struct LearningPathItem: Decodable {
    let type: String
    let description: String
}
