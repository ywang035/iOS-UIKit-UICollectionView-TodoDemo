//
//  ListCellView.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 1/11/21.
//

import UIKit

class TaskCell: UICollectionViewCell {

    var task: Task? {
        didSet {
            guard let unwrappedTask = task else { return }
            
            titleText.text = unwrappedTask.title
            
            guard let unwrappedDetail = unwrappedTask.detail else { return }
            
            detailText.text = unwrappedDetail
            
        }
    }

    private let titleText: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.numberOfLines = 1
        return textView
    }()

    
    private let detailText: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .gray
        textView.numberOfLines = 1
        return textView
    }()
    
    private let arrowButton: UIButton = {
        let arrowButton = UIButton(type: .system)
        arrowButton.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
        arrowButton.tintColor = .black
        arrowButton.setImage(buttonImage, for: .normal)
        
        return arrowButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout(){
        
        addSubview(titleText)
        addSubview(detailText)
        addSubview(arrowButton)
        

        NSLayoutConstraint.activate([
            titleText.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            titleText.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            titleText.topAnchor.constraint(equalTo: topAnchor),
            
            detailText.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            detailText.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            detailText.topAnchor.constraint(equalTo: titleText.topAnchor, constant: 20),
            
            arrowButton.topAnchor.constraint(equalTo: topAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            arrowButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}


