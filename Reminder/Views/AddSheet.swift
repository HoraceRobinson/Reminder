//
//  AddSheet.swift
//  Reminder
//
//  Created by cm on 2022/3/31.
//

import SwiftUI

struct AddSheet : View{
    @Binding var lists : [list]
    @Binding var save : Bool
    @State var name = ""
    @State var icon = ""
    @State var color : Color = .blue
    var body : some View{
        List{
            HStack{
                Text("Name")
                TextField("name", text: $name)
            }
            HStack{
                Text("Icon")
                TextField("icon", text: $icon)
                    .autocapitalization(.none)
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.system(size: 20))
            }
            ColorPicker("Choose a color", selection: $color)
            Button(action: {
                if name != "" && icon != ""{
                    withAnimation(.easeIn){
                        lists.append(list(icon: icon, color: color, name: name, num: 0))
                        save.toggle()
                    }
                }
            }, label: {
                HStack{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                    Text("save")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                }
                
            })
                .buttonStyle(StaticButtonStyle())
        }
    }
}

