//
//  Lists.swift
//  Reminder
//
//  Created by cm on 2022/3/31.
//

import Foundation

var Lists = [
    list(icon: "list.bullet.circle.fill", color: .blue, name: "Reminders", num: 20),
    list(icon: "heart.circle.fill", color: .orange, name: "Tagged Lists", num: 11),
    list(icon: "car.circle.fill", color: .green, name: "Camping Trip To-Do", num: 10),
    list(icon: "house.circle.fill", color: .cyan, name: "Home To-Do", num: 3),
    list(icon: "doc.circle.fill", color: .red, name: "Work To-Do", num: 8)
]

var Headers = [[
    list(icon: "calendar.circle.fill", color: .blue, name: "Today", num: 4),
    list(icon: "calendar.circle.fill", color: .red, name: "Scheduled", num: 18)
], [
    list(icon: "flag.circle.fill", color: .orange, name: "Flagged", num: 4),
    list(icon: "person.circle.fill", color: .green, name: "Assigned", num: 1)
]]
