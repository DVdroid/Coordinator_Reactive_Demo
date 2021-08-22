//
//  ViewController.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //testJSONParsing()
        let rootCoordinator = RootCoordinator()
        rootCoordinator.start(rootViewcontroller: self)
    }

    func testJSONParsing() {
        let fileName = "response.json"
        let object: HomeFromDAL? = Bundle.main.decode(fileName)
        print(String(describing: object))
    }
}

