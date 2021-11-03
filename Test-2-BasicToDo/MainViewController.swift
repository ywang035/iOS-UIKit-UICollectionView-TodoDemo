//
//  ViewController.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 1/11/21.
//

/// weak delegae

/// reference type vs value type

/// inherit view instead of controller



import UIKit

protocol AddTaskViewControllerDelegateProtocol {
    func sendNewTaskToMainViewController(data: Task)
}


protocol EditTaskViewControllerDelegateProtocol {
    func sendEditTaskToMainViewController(data: Task, dataIndex: Int)
}



class MainViewController: UIViewController, AddTaskViewControllerDelegateProtocol{
    
    
    var simpleListController: ListController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigation()
        setupList()
    }


    // set up top navigation
    private func setupNavigation(){
        // build UI
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddTaskView))
        self.navigationItem.title = "To-Do"
        self.navigationItem.leftBarButtonItem = plusButton
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    
    // set up list view
    func setupList(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        simpleListController = ListController(collectionViewLayout: layout)
        simpleListController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(simpleListController.view)
        self.addChild(simpleListController)
        
        
        // set constraint
        simpleListController.view.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        simpleListController.view.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        simpleListController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        simpleListController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    
    @objc func showAddTaskView(){
        let addTaskViewController = AddTaskViewController()
        addTaskViewController.delegate = self
        self.present(addTaskViewController, animated: true)
    }
    
    
    // delegate method - new task
    func sendNewTaskToMainViewController(data: Task) {
        simpleListController.taskList.append(data)
        simpleListController.collectionView.reloadData()
    }
}
