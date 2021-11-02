//
//  AddTaskViewController.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 2/11/21.
//

import UIKit

protocol AddTaskViewControllerDelegateProtocol {
    func sendDataToMainViewController(myData: Task)
}


class AddTaskViewController: UIViewController {
    
    var delegate: AddTaskViewControllerDelegateProtocol?
    
    
    var navBar: UINavigationBar = {
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        navBar.setItems([UINavigationItem(title: "Add Task")], animated: true)
        return navBar
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
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Task Title"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.alpha = 0.75
        
        return label
    }()
    
    
    var titleTextField: UITextField = {
        let textField = UITextField()
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "add your task title ..."
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.contentHorizontalAlignment = .leading
        
        textField.textColor = .black
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.tintColor = .black
        
        return textField
    }()
    
    
    var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Task Detail"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.alpha = 0.75
        
        return label
    }()
    
    
    var detailTextField: UITextField = {
        let textField = UITextField()
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "add your task detail ..."
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.contentHorizontalAlignment = .leading
        
        textField.textColor = .black
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.tintColor = .black
        
        return textField
    }()
    
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        
        
        view.addSubview(navBar)
        
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        
        view.addSubview(detailLabel)
        view.addSubview(detailTextField)
        
        view.addSubview(doneButton)
        
        
        setupLayout()
    }
    
    
    
    // set up layout
    func setupLayout(){
        titleLabel.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        
        titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        detailLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 30).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        
        detailTextField.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 20).isActive = true
        detailTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        detailTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        detailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        doneButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    
    @objc func sendData(_ sender: Any){
        
        guard let unwrappedTitleTextFeild = titleTextField.text else { return }
        
        if unwrappedTitleTextFeild.isEmpty {
            
            // create alert
            let alert = UIAlertController(title: "Oops", message: "Task title cannot be empty.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            
            // send data to main view controller
            let newTask = Task(title: unwrappedTitleTextFeild, detail: detailTextField.text)
            self.delegate?.sendDataToMainViewController(myData: newTask)
            dismiss(animated: true, completion: nil)
            
        }
    }
    
}
