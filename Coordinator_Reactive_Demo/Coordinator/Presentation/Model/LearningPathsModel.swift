//
//  LearningPathsModel.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 22/08/21.
//

import Foundation

final class LearningPathsModel: ObservableObject {

    @Published var allLearningPathName: [String]
    @Published var allContentItems: [SUIContentItem]
    @Published var learningPaths: [SUILearningPath]

    @Published var categoryTapActionHandler: ((Int) -> Void)?
    @Published var tapActionHandler: ((Int) -> Void)?

    init(allLearningPathName: [String],
         allContentItems: [SUIContentItem],
         learningPaths: [SUILearningPath],
         categoryTapActionHandler: ((Int) -> Void)? = nil,
         tapActionHandler: ((Int) -> Void)? = nil) {

        self.allLearningPathName = allLearningPathName
        self.allContentItems = allContentItems
        self.learningPaths = learningPaths
        self.categoryTapActionHandler = categoryTapActionHandler
        self.tapActionHandler = tapActionHandler
    }
}

struct SUILearningPath {
    let name: String
    let subtitle: String
    let contentItems: [SUIContentItem]
}

struct SUIAllLeaningPaths {
    let names: [String]
}

struct SUIContentItem {
    let type: ContentItemType?
    let description: String
}
