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
    
//    public init(taskList: [Task]) {
//
//        self.taskList = taskList
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(TaskCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    
    // list count
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        guard let unwrappedListCount = taskList?.count else { return 0}
        
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



