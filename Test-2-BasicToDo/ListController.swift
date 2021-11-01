//
//  SimpleListController.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 1/11/21.
//

import UIKit

class ListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let list = [1, 2, 3, 4, 5]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.register(MyPageCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    
    // list count
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    
    // line spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // cell frame
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 30)
    }
    
    
    // populate cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! MyPageCell
        
        cell.numberIndex = list[indexPath.item]
        
        return cell
    }
}



