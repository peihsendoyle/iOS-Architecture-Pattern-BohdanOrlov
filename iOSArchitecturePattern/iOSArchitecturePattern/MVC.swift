//
//  MVC.swift
//  iOSArchitecturePattern
//
//  Created by Hiep Nguyen on 2/25/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import Foundation

import UIKit

struct Person { // MODEL
    
    let firstName: String
    
    let lastName: String
    
    init(firstName:String, lastName: String) {
        
        self.firstName = firstName
        
        self.lastName = lastName
    }
}

class GreetingView : UIView { // VIEW
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    let greetingLabel = UILabel()
    
}


class GreetingController {
    
    private let model : Person
    
    private let greetingView: GreetingView
    
    init(model: Person, greetingView: GreetingView) {
        
        self.model = model
        
        self.greetingView = greetingView
    }
    
    
    func greetingSomeone() -> String {
        
        let greeting = "Hello" + " " + model.firstName + " " + model.lastName
        
        return greeting
    }
}

class MainViewController : UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let model = Person(firstName: "Nguyen", lastName: "Hieu Hiep")
        
        let greetingView = GreetingView()
        
        let greetingController = GreetingController(model: model, greetingView: greetingView)
        
        let greetingString = greetingController.greetingSomeone()
        
        greetingController.greetingView.greetingLabel.text = greetingString
    
    }
}

// Assembling of MVC

let modelOfMVC = Person(firstName: "Nguyen", lastName: "Hieu Hiep")

let viewOfMVC = GreetingView()

let controllerOfMVC = GreetingController(model: modelOfMVC, greetingView: viewOfMVC)




