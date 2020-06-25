//
//  RootViewController.swift
//  CompletionHandlersExample
//
//  Created by Alex Nagy on 07/02/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import UIKit
import TinyConstraints

class RootViewController: UIViewController {

    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Fetch data from server", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let label: UILabel = {
       let label = UILabel()
        label.text = "Waiting for result..."
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupViews()
    }

    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(button)
        view.addSubview(label)
        button.centerInSuperview()
        label.topToSuperview(offset: 24, usingSafeArea: true)
        label.centerXToSuperview()
    }

    @objc fileprivate func buttonTapped() {    
        Service.grabDataFromDatabase { (result) in
            guard let result = result else { print("Failed to fetch result."); return }
            self.label.text = "Result \(result)"
        }
    }
}

