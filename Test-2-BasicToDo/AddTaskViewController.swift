//
//  AddTaskViewController.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 2/11/21.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 64.0))
        self.view.addSubview(navBar)
        let navItem = UINavigationItem(title: "Add Task")
        navBar.setItems([navItem], animated: true)
    }
}
