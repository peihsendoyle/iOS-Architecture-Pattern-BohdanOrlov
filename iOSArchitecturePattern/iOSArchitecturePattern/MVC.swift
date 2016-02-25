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

class GreetingView { // VIEW
    
    let showGreetingButton = UIButton()
    
    let greetingLabel = UILabel()
    
    func greetingSomeone(firstName: String, lastName: String) -> String {
        
        let greeting = "Hello" + " " + firstName + " " + lastName
        
        return greeting
    }
}

class GreetingController {
    
    private let model : Person!
    
    private let greetingView: GreetingView!
    
    init(model: Person, greetingView: GreetingView) {
        
        self.model = model
        
        self.greetingView = greetingView
    }
}

class MainViewController : UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let model = Person(firstName: "Nguyen", lastName: "Hieu Hiep")
        
        let greetingView = GreetingView()
        
        let greetingController = GreetingController(model: model, greetingView: greetingView)
        
        let greetingString = greetingController.greetingView.greetingSomeone(model.firstName, lastName: model.lastName)
        
        print(greetingString)
    }
}



// Assembling of MVC

