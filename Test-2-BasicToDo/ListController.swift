//
//  SimpleListController.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 1/11/21.
//

import UIKit

protocol ListControllerDelegateProtocol {
    func sendDataToMainViewController(listData: Task)
}

class ListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
        
    var delegate: ListControllerDelegateProtocol? = nil
    
    var taskList = [Task]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(TaskCell.self, forCellWithReuseIdentifier: "cellID")
        
    }
    
//    override func setEditing(_ editing: Bool, animated: Bool) {
//        super.setEditing(editing, animated: animated)
//        self.collectionView.isEditing = editing
//        print("edit tapped")
//    }
    
    //    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
    //        return true
    //    }
    
    // list count
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskList.count
    }
    
    
    // line spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // cell frame
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    

    // populate cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! TaskCell
        
        cell.task = taskList[indexPath.item]
        
        return cell
    }
    
    
    // push to detail child view
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = DetailViewController()
        vc.selectedTask = taskList[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



