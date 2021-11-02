//
//  ViewController.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 1/11/21.
//

import UIKit

class MainViewController: UIViewController{
    
    var listView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigation()
        setupList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupList()
    }


    private func setupNavigation(){
        // build UI
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddView))
        self.navigationItem.title = "To-Do"
        self.navigationItem.rightBarButtonItem = plusButton
        self.navigationController?.navigationBar.tintColor = .black
        
    }
    
    
    @objc func showAddView(){
        let addTaskViewController = AddTaskViewController()
        self.present(addTaskViewController, animated: true)
    }
    
    
    // set up list view
    private func setupList(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let simpleListController = ListController(collectionViewLayout: layout)
        simpleListController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(simpleListController.view)
        self.addChild(simpleListController)
        
        
        // set constraint
        simpleListController.view.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        simpleListController.view.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        simpleListController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        simpleListController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    
}
