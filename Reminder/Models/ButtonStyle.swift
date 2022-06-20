//
//  ButtonStyle.swift
//  Reminder
//
//  Created by cm on 2022/3/31.
//

import Foundation
import SwiftUI

struct StaticButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
