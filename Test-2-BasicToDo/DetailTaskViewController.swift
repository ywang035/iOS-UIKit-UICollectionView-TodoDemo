//
//  DetailViewController.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 1/11/21.
//

import UIKit

protocol EditTaskViewControllerDelegateProtocol: AnyObject {
    func sendEditTaskToMainViewController(data: Task, dataIndex: Int)
}


class DetailTaskViewController: UIViewController {
    
    weak var delegate: EditTaskViewControllerDelegateProtocol?
    
    var selectedTask: Task?
    var selectedTaskIndex: Int!
    
    var taskView: TaskCommonView = {
        let view = TaskCommonView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("SAVE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(sendData), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(taskView)
        view.addSubview(saveButton)
        
        taskView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        taskView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        taskView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        taskView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        saveButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        if let unwrappedSelectedTask = selectedTask {
            taskView.titleTextField.text = unwrappedSelectedTask.title
            taskView.detailTextField.text = unwrappedSelectedTask.detail
        }
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
            let editTask = Task(title: unwrappedTitleTextFeild, detail: taskView.detailTextField.text)
            self.delegate?.sendEditTaskToMainViewController(data: editTask, dataIndex: selectedTaskIndex)
            navigationController?.popViewController(animated: true)
            
        }
    }
}
