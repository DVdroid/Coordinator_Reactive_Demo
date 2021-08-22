//
//  RootCoordinator.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import UIKit
import Combine

final class RootCoordinator: NSObject {

    //Setup
    var learningPathsDAL: LearningPathsDAL!
    var learningPathsBLL: LearningPathsBLL!
    var learningPathsVM: LearningPathsVM!

    var homeDAL: HomeDAL!
    var homeBLL: HomeBLL!
    var homeVM: HomeVM!

    private var cancellables = Set<AnyCancellable>()

    func start(rootViewcontroller: UIViewController) {

        learningPathsDAL = LearningPathsDAL()
        learningPathsBLL = LearningPathsBLL(learningPathsDAL: learningPathsDAL)
        learningPathsVM = LearningPathsVM(learningPathsBLL: learningPathsBLL)

        homeDAL = HomeDAL()
        homeBLL = HomeBLL(homeDAL: homeDAL)
        homeVM = HomeVM(homeBLL: homeBLL, learningPathsVM: learningPathsVM)

        homeDAL.observableHomeFromDAL.$observedObject.sink(receiveValue: self.apply)
            .store(in: &cancellables)
    }

    func apply(_ homeFromDAL: HomeFromDAL?) {
        guard let uwHomeFromDAL = homeFromDAL else { return }
        self.learningPathsDAL.observableLearningPathsFromDAL.observedObject = uwHomeFromDAL.learningPaths
        print(self.learningPathsDAL.observableLearningPathsFromDAL.observedObject ?? LearningPathsDAL())
    }
}
