//
//  ObservableHomeScreenModel.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import Foundation
import Combine
import SwiftUI

final class ObservableHomeScreenModel: NSObject, ObservableObject {

    let objectWillChange = PassthroughSubject<Void, Never>()
    @Published var homeScreenModel: HomeScreenModel? {
        willSet {
            self.objectWillChange.send()
        }
    }

    init(_ homeScreenModel: HomeScreenModel) {
        self.homeScreenModel = homeScreenModel
        super.init()
    }

    override init() {
        super.init()
    }
}
