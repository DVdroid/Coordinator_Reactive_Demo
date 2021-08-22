//
//  ObservableLearningPathFromBLL.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import Foundation
import SwiftUI
import Combine

final class ObservableLearningPathsFromBLL: NSObject, ObservableObject {

    let objectWillChange = PassthroughSubject<Void, Never>()
    @Published var learningPathFromBLL: LearningPathsFromBLL = LearningPathsFromBLL(learningPaths: []) {
        willSet {
            self.objectWillChange.send()
        }
    }
}
