//
//  ServiceManager.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import Foundation

final class ServiceManager {

    class func fetchLearningPaths(_ completion: @escaping (HomeFromDAL) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let fileName = "response.json"
            completion(Bundle.main.decode(fileName))
        }
    }
}
