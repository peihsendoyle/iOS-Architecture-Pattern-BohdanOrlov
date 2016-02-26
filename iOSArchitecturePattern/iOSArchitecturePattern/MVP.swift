//
//  MVP.swift
//  iOSArchitecturePattern
//
//  Created by Hiep Nguyen on 2/26/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import Foundation
import UIKit

struct People { // MODEL
    
    let firstName: String
    
    let lastName: String
}

protocol HelloView {
    
    func setGreetingView(greeting: String)
}

protocol HelloViewPresenter {
    
    init(view: HelloView, people: People)
    
    func showGreeting()
}

class HelloPresenter: HelloViewPresenter { // PRESENTER
    
    let view: HelloView
    
    let people: People
    
    required init(view: HelloView, people: People) {
        
        self.view = view
        
        self.people = people
    }
    
    func showGreeting() {
        
        let greeting = "Hello" + " " + self.people.firstName + " " + self.people.lastName
        
        self.view.setGreetingView(greeting)
    }
}

class HelloViewController: UIViewController, HelloView { // VIEW
    
    var presenter: HelloViewPresenter!
    
    var helloLabel = UILabel()
    
    var helloButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        helloButton.addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)
    }
    
    func didTapButton(button: UIButton) {
        
        presenter.showGreeting()
    }
    
    func setGreetingView(greeting: String) {
        
        helloLabel.text = greeting
    }
}

// Assembling of MVP

let model = People(firstName: "Nguyen", lastName: "Hieu Hiep")

let view = HelloViewController()

let presenter = HelloPresenter(view: view, people: model)

//view.presenter = presenter










