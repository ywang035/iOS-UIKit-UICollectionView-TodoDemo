//
//  AddTaskViewController.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 3/11/21.
//

import UIKit



class AddTaskViewController: UIViewController {
    
    var delegate: AddTaskViewControllerDelegateProtocol?
    
    var taskView: TaskCommonView = {
        let view = TaskCommonView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("ADD TASK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(sendData), for: .touchUpInside)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        

        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        navBar.setItems([UINavigationItem(title: "Add Task")], animated: true)
        
        view.addSubview(navBar)
        view.addSubview(taskView)
        view.addSubview(doneButton)
        
        taskView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 10).isActive = true
        taskView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        taskView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        taskView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        doneButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func sendData(_ sender: Any){
        
        guard let unwrappedTitleTextFeild = taskView.titleTextField.text else { return }
        
        if unwrappedTitleTextFeild.isEmpty {
            
            // create alert
            let alert = UIAlertController(title: "Oops", message: "Task title cannot be empty.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            
            // send data to main view controller
            let newTask = Task(title: unwrappedTitleTextFeild, detail: taskView.detailTextField.text)
            self.delegate?.sendNewTaskToMainViewController(data: newTask)
            dismiss(animated: true, completion: nil)
        }
    }
}
