//
//  HomeModel.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import SwiftUI

final class HomeScreenModel: ObservableObject {

    @Published var observableLearningPathsModel: ObservableLearningPathsModel!
    @Published var tapActionHandler: ((Int) -> Void)?

    init(observableLearningPathsModel: ObservableLearningPathsModel,
         tapActionHandler: ((Int) -> Void)? = nil) {
        self.observableLearningPathsModel = observableLearningPathsModel
        self.tapActionHandler = tapActionHandler
    }
}
