//
//  Task.swift
//  Dayacademy
//
//  Created by Rido Hendrawan on 27/07/22.
//

import SwiftUI

// Task Model
struct Task: Identifiable{
    var id = UUID().uuidString
    var taskTitle: String
    var taskDescription: String
    var taskType: String
    var taskDate: Date
}
