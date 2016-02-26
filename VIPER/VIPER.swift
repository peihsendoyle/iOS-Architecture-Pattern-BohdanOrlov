//
//  VIPER.swift
//  VIPER
//
//  Created by Hiep Nguyen on 2/26/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import Foundation
import UIKit

struct Person { // ENTITY
    
    let firstName: String
    
    let lastName: String
}

struct GreetingData { // Transport data structure, not ENTITY
    
    let greeting: String
    
    let subject: String
}

protocol GreetingProvider {
    
    func provideGreetingData()
}

protocol GreetingOutput: class {
    
    func receiveGreetingData(greeting: GreetingData)
}

class GreetingInteractor: GreetingProvider { // INTERACTOR
    
    weak var output: GreetingOutput!
    
    func provideGreetingData() {
        
        let person = Person(firstName: "Nguyen", lastName: "Hieu Hiep")
        
        let subject = person.firstName + " " + person.lastName
        
        let greetingData = GreetingData(greeting: "Hello", subject: subject)
        
        self.output.receiveGreetingData(greetingData)
    }
}

protocol GreetingViewEventHandler {
    
    func didTapShowGreetingButton()
}

protocol GreetingView: class {
    
    func setGreeting(greeting: String)
}

class GreetingPresenter: GreetingOutput, GreetingViewEventHandler { // PRESENTER
    
    weak var view: GreetingView!
    
    var greetingProvider: GreetingProvider!
    
    func receiveGreetingData(greetingData: GreetingData) {
        
        let greeting = greetingData.greeting + " " + greetingData.subject
        
        self.view.setGreeting(greeting)
    }
    
    func didTapShowGreetingButton() {
        
        self.greetingProvider.provideGreetingData()
    }
}

class GreetingViewController: UIViewController, GreetingView { // VIEW
    
    var eventHandler : GreetingViewEventHandler!
    
    let showGreetingButton = UIButton()
    
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showGreetingButton.addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)
    }
    
    func setGreeting(greeting: String) {
        
        self.greetingLabel.text = greeting
    }
    
    func didTapButton(button: UIButton) {
        
        self.eventHandler.didTapShowGreetingButton()
    }
}

















