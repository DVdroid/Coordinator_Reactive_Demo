//
//  HomeDAL.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import Foundation

final class HomeDAL: NSObject {
    var observableHomeFromDAL = ObservableDAL<HomeFromDAL>()

    override init() {
        super.init()
        fetchLearningPaths()
    }

    func fetchLearningPaths() {
        ServiceManager.fetchLearningPaths { [weak self] parsedHomeFromDAL in
            guard let self = self else { return }
            self.observableHomeFromDAL.observedObject = parsedHomeFromDAL
            var homeFromDAL = self.observableHomeFromDAL.observedObject
            homeFromDAL?.learningPaths =  parsedHomeFromDAL.learningPaths
        }
    }
}
