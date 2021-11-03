//
//  AddTaskViewController.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 2/11/21.
//

import UIKit


class TaskChildViewController: UIViewController {
    
    
    var navBar: UINavigationBar = {
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        navBar.setItems([UINavigationItem(title: "Add Task")], animated: true)
        return navBar
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
        
        setupLayout()
    }
    
    
    
    // set up layout
    func setupLayout(){
        titleLabel.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 50).isActive = true
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
    }
}
