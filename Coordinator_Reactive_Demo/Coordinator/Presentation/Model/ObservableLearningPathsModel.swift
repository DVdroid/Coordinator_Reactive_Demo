//
//  ObservableLearningPathsModel.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 22/08/21.
//

import Foundation
import Combine
import SwiftUI

final class ObservableLearningPathsModel: NSObject, ObservableObject {

    let objectWillChange = PassthroughSubject<Void, Never>()
    @Published var learningPathsModel: LearningPathsModel? {
        willSet {
            self.objectWillChange.send()
        }
    }

    init(_ learningPathsModel: LearningPathsModel) {
        self.learningPathsModel = learningPathsModel
        super.init()
    }

    override init() {
        super.init()
    }
}
