//
//  MVVM.swift
//  iOSArchitecturePattern
//
//  Created by Hiep Nguyen on 2/26/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import Foundation
import UIKit

struct Personal { // MODEL
    
    let firstName: String
    
    let lastName: String
}

protocol HiViewModelProtocol: class {
    
    var greeting: String? { get }
    
    var greetingDidChange: ((HiViewModelProtocol) -> ())? { get set }
    
    init(personal: Personal)
    
    func showGreeting()
}

class HiViewModel: HiViewModelProtocol {
    
    let personal: Personal
    
    var greeting: String? {
        
        didSet {
            
            self.greetingDidChange?(self)
        }
    }
    
    var greetingDidChange: ((HiViewModelProtocol) -> ())?
    
    required init(personal: Personal) {
        
        self.personal = personal
    }
    
    func showGreeting() {
        
        self.greeting = "Hi" + " " + personal.firstName + " " + personal.lastName
    }
}

class HiViewController: UIViewController {
    
    var viewModel: HiViewModelProtocol! {
        
        didSet {
            
            self.viewModel.greetingDidChange = {
                
                [unowned self] viewModel in
                
                self.hiLabel.text = viewModel.greeting
            }
        }
    }
    
    let showHiButton = UIButton()
    
    let hiLabel = UILabel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showHiButton.addTarget(self.viewModel, action: "showGreeting", forControlEvents: .TouchUpInside)
    }
    
    // layout code goes here
}

// Assembling of MVVM

let modelOfMVVM = Personal(firstName: "Nguyen", lastName: "Hieu Hiep")

let viewOfMVVM = HiViewController()

let viewModelOfMVVM = HiViewModel(personal: modelOfMVVM)

//viewOfMVVM.viewModel = viewModelOfMVVM





















