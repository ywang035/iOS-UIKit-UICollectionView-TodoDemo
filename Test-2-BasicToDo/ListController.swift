//
//  SimpleListController.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 1/11/21.
//

import UIKit


class ListController: UICollectionViewController, UICollectionViewDelegateFlowLayout, EditTaskViewControllerDelegateProtocol {

    // mockup
    var taskList = [
        Task(title: "task 1", detail: "detail 1"),
        Task(title: "task 2"),
        Task(title: "task 3", detail: "detail 3")
    ]
    
    
    func sendEditTaskToMainViewController(data: Task, dataIndex: Int) {
        taskList[dataIndex] = data
        collectionView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(TaskCell.self, forCellWithReuseIdentifier: "cellID")
     
    }
    

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
        let vc = DetailTaskViewController()
        vc.selectedTask = taskList[indexPath.item]
        vc.selectedTaskIndex = indexPath.item
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



