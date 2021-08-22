//
//  LearningPathsDAL.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import Foundation

final class LearningPathsDAL: NSObject {
    var observableLearningPathsFromDAL = ObservableDAL<[LearningPathFromDAL]>()

    override init() {
        super.init()
    }
}
