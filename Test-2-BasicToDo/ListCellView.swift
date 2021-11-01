//
//  ListCellView.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 1/11/21.
//

import UIKit

class MyPageCell: UICollectionViewCell {
    
    var numberIndex: Int? {
        didSet{
            guard let unwrappedNumberIndex = numberIndex else { return }
            headerText.text = "task \(unwrappedNumberIndex)"
            headerText.textColor = .black
        }
    }
    
    
    private let headerText: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout(){
        
        addSubview(headerText)

        NSLayoutConstraint.activate([
            
            headerText.heightAnchor.constraint(equalToConstant: 20),
            headerText.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            headerText.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            headerText.topAnchor.constraint(equalTo: topAnchor)
        ])
    }

}
