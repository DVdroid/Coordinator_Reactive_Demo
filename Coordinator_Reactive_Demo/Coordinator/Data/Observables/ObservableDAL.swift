//
//  ObservableDAL.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import Foundation
import Combine
import SwiftUI

final class ObservableDAL<T: Decodable>: NSObject, ObservableObject {

    let objectWillChange = PassthroughSubject<Void, Never>()
    @Published var observedObject: T? {
        willSet {
            self.objectWillChange.send()
        }
    }

    override init() {
        super.init()
    }
}
