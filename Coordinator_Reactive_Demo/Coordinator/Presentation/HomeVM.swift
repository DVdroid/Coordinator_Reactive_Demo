//
//  HomeVM.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import Foundation
import SwiftUI
import Combine

final class HomeVM: NSObject {
    @ObservedObject var observableHomeModel = ObservableHomeScreenModel()
    @ObservedObject var observableHomeFromBLL: ObservableHomeFromBLL

    var homeBLL: HomeBLL
    var handleTap:((Int) -> Void)
    private var cancellable: AnyCancellable?

    init(homeBLL: HomeBLL, learningPathsVM: LearningPathsVM) {
        self.homeBLL = homeBLL
        self.observableHomeFromBLL = homeBLL.observableHomeFromBLL
        handleTap = { _ in
        }

        super.init()
        self.cancellable = self.observableHomeFromBLL.$homeFromBLL.sink(receiveValue: { [weak self] homeFromBLL in
            guard let self = self else { return }
            self.observableHomeModel.homeScreenModel = HomeScreenModel(
                observableLearningPathsModel: learningPathsVM.observableLearningPathsModel,
                tapActionHandler: self.handleTap
            )
        })

        handleTap = { selectedIndex in
        }
    }
}
