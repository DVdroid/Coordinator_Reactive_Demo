//
//  LearningPathsVM.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 22/08/21.
//

import Foundation
import SwiftUI
import Combine

final class LearningPathsVM: NSObject {
    @ObservedObject var observableLearningPathsModel = ObservableLearningPathsModel()
    @ObservedObject var observableLearningPathsFromBLL: ObservableLearningPathsFromBLL

    var learningPathsBLL: LearningPathsBLL
    var categorySelectionHandleTap:((Int) -> Void)
    var handleTap:((Int) -> Void)
    private var cancellable: AnyCancellable?

    init(learningPathsBLL: LearningPathsBLL) {
        self.learningPathsBLL = learningPathsBLL
        self.observableLearningPathsFromBLL = learningPathsBLL.observableLearningPathsFromBLL

        categorySelectionHandleTap = { _ in
        }

        handleTap = { _ in
        }

        super.init()
        self.cancellable = self.observableLearningPathsFromBLL.$learningPathFromBLL.sink(receiveValue: { [weak self] learningPathFromBLL in
            guard let self = self else { return }
            var _learningPathFromBLL = learningPathFromBLL
            self.observableLearningPathsModel.learningPathsModel = LearningPathsModel (
                allLearningPathName: _learningPathFromBLL.allLearningPathName,
                allContentItems: _learningPathFromBLL.allContentItems.map { SUIContentItem(type: $0.type, description: $0.description) },
                learningPaths: _learningPathFromBLL.learningPaths.map { SUILearningPath(name: $0.name, subtitle: $0.subtitle, contentItems: $0.contentItems.map { SUIContentItem(type: $0.type, description: $0.description) })},
                categoryTapActionHandler: self.categorySelectionHandleTap,
                tapActionHandler: self.handleTap
            )
        })

        categorySelectionHandleTap = { selectedIndex in
        }

        handleTap = { selectedIndex in
        }
    }
}

