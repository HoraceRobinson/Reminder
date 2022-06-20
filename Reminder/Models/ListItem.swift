//
//  ListItem.swift
//  Reminder
//
//  Created by cm on 2022/3/30.
//

import Foundation
import SwiftUI

struct item{
    var id = UUID()
    var text: String
    var isfinished: Bool
    var isstared: Bool
    var flag: Bool
    var createtime: Date
    var tags : [String]
}

