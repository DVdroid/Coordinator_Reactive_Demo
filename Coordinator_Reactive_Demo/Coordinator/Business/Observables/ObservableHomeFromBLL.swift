//
//  ObservableHomeFromBLL.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import Foundation
import SwiftUI
import Combine

final class ObservableHomeFromBLL: NSObject, ObservableObject {

    let objectWillChange = PassthroughSubject<Void, Never>()
    @Published var homeFromBLL: HomeFromBLL = HomeFromBLL() {
        willSet {
            self.objectWillChange.send()
        }
    }
}
