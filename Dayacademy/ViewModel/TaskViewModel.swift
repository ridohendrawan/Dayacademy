//
//  TaskViewModel.swift
//  Dayacademy
//
//  Created by Rido Hendrawan on 27/07/22.
//

import SwiftUI

class TaskViewModel: ObservableObject{
    
    // Academy Task
    
    @Published var storedTasks: [Task] = [
        
        
        Task(taskTitle: "Check asset", taskDescription: "Start checking the assets", taskType: "ACTIVITY", taskDate: .init(timeIntervalSince1970: 1659030218)),
    ]
    
    // MARK: Current Week Days
    @Published var currentWeek: [Date] = []
    
    // MARK: Current Day
    @Published var currentDay: Date = Date()
    
    // MARK: Filtering TOday Tasks
    @Published var filteredTasks: [Task]?
    
    // MARK: Intializing
    init(){
        fetchCurrentWeek()
        filterTodayTasks()
    }
    
    // MARK: FIlter TOday Tasks
    func filterTodayTasks(){
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            let calender = Calendar.current
            
            let filtered = self.storedTasks.filter{
                return calender.isDate($0.taskDate, inSameDayAs: self.currentDay)
            }
                .sorted { task1, task2 in
                    return task2.taskDate < task1.taskDate
                }
            DispatchQueue.main.async {
                withAnimation{
                    self.filteredTasks = filtered
                }
            }
        }
    }
    
    func fetchCurrentWeek(){
        
        let today = Date()
        let calender = Calendar.current
        
        let week = calender.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else{
            return
        }
        
        (1...7).forEach{ day in
            
            if let weekday = calender.date(byAdding:.day, value: day, to: firstWeekDay){
                currentWeek.append(weekday)
            }
        }
    }
    
    // MARK: Extracting Date (A simply function which will return date as a String with user defined Date Format)
    func extractDate(date: Date,format: String) -> String{
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    // MARK: Checking if current Date is Today(When the app is opened need to highlight the currentDay in Wek Days ScrollView with function which will vertify if the week day is Today)
    func isToday(date: Date)->Bool{
        
        let calender = Calendar.current
        
        return calender.isDate(currentDay, inSameDayAs: date)
    }
    
    // MARK: Checking if the currentHour is task Hour(Vertify whether the given task date and time is same as current date and time (To highlight the current hour tasks))
    func isCurrentHour(date: Date)->Bool{
        
        let calender = Calendar.current
        
        let hour = calender.component(.hour, from: date)
        let currentHour = calender.component(.hour, from: Date())
        
        return hour == currentHour
    }
}

