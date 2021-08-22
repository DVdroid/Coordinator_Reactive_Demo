//
//  HomeBLL.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import UIKit
import SwiftUI
import Combine

final class HomeBLL: NSObject {

    @ObservedObject var observableHomeFromDAL = ObservableDAL<HomeFromDAL>()
    @ObservedObject var observableHomeFromBLL = ObservableHomeFromBLL()

    var vc: UIViewController = UIViewController()

    private var cancellable: AnyCancellable?

    var homeDAL: HomeDAL
    init(homeDAL: HomeDAL) {
        self.homeDAL = homeDAL
        self.observableHomeFromDAL = homeDAL.observableHomeFromDAL
        super.init()

        self.cancellable = observableHomeFromDAL.$observedObject.sink(receiveValue: { [weak self] homeFromDAL in
            guard let self = self,
                  let uwHomeFromDAL = homeFromDAL else { return }
            self.observableHomeFromBLL.homeFromBLL = self.mapHomeFromDALToBLL(uwHomeFromDAL)
        })
    }

    func mapHomeFromDALToBLL(_ homeFromDAL: HomeFromDAL) -> HomeFromBLL {
        return HomeFromBLL()
    }

}
