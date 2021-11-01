//
//  ViewController.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 1/11/21.
//

import UIKit

class MainViewController: UIViewController {
    
    var navBar: UINavigationBar!
    var listView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigation()
        setupList()
    }


    private func setupNavigation(){
        
        navBar = UINavigationBar()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBar)
        
        // build UI
        let navItem = UINavigationItem(title: "To-Do")
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddView))
        navItem.rightBarButtonItem = plusButton
        
        navBar.setItems([navItem], animated: false)
        navBar.tintColor = .black
        navBar.barTintColor = .white
        
        // set constraint
        navBar.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true   
    }
    
    
    @objc func showAddView(){
        
    }
    
    
    private func setupList(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let simpleListController = ListController(collectionViewLayout: layout)
        simpleListController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(simpleListController.view)
        self.addChild(simpleListController)
        
        
        // set constraint
        simpleListController.view.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        simpleListController.view.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        simpleListController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        simpleListController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

