//
//  DetailViewController.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 1/11/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedTask: Task?
    
    var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
//        setupNavigation()
        
        
        let button = UIButton()
        button.backgroundColor = .red
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.addTarget(self, action: #selector(pushView), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    @objc func pushView(){
        let vc = UIViewController()
        vc.view.backgroundColor = .yellow
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func setupNavigation(){
        
        navBar = UINavigationBar()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBar)
        
        // build UI
        let navItem = UINavigationItem()
        let backButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissNavigation))
    
        navItem.backBarButtonItem = backButton
        
        
        navBar.setItems([navItem], animated: false)
        navBar.tintColor = .black
        
        
        // set constraint
        navBar.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    
    @objc func dismissNavigation(){
//        navigationController?.popViewController(animated: true)
    }
    
    
    
}
