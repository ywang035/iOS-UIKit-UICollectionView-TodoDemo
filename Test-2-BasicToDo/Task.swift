//
//  Task.swift
//  Test-2-BasicToDo
//
//  Created by Yang W on 1/11/21.
//

import Foundation

struct Task: Hashable {
    var id = UUID()
    var title: String
    var detail: String?
}
