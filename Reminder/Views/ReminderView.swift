//
//  ReminderView.swift
//  Reminder
//
//  Created by cm on 2022/3/31.
//

import SwiftUI

struct ReminderView : View{
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
    }
    @State var items = ReminderItems
    @State var newitem = ""
    @State var tag = ""
    @State var isedit : EditMode = .inactive
    @State var date = Date()
    @State var delete = false
    
    
    struct StaticButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
        }
    }
    
    var body: some View{
        VStack(spacing: 0){
            Text("Reminder")
            .font(.system(size: 25, weight: .heavy))
            .foregroundColor(.blue)
            .frame(width: UIScreen.main.bounds.width * 0.9, height: 28, alignment: .leading)
            
        List{
            ForEach(0...items.count - 1, id: \.self){i in
                if items[i].isfinished == false{
                    HStack{
                        Button(action: {
                            withAnimation(.easeIn){
                                items[i].flag.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    withAnimation(.spring()){
                                        items[i].isfinished.toggle()
                                    }
                                }
                            }
                            
                        }, label: {
                            Image(systemName: items[i].flag ? "circle.circle.fill" : "circle")
                                .foregroundColor(items[i].flag ? .orange : .secondary)
                        })
                            .buttonStyle(StaticButtonStyle())
                        VStack{
                            HStack{
                                Text(items[i].text)
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                            HStack(alignment: .top){
                                Text(items[i].createtime, style: .date)
                                    .font(.system(size:13))
                                    .foregroundColor(.gray)
                                ForEach(items[i].tags, id: \.self){
                                    i in Text("#\(i)")
                                        .font(.system(size:13))
                                        .foregroundColor(Color(hue: 0.613, saturation: 0.709, brightness: 0.893))
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                            }
                        }
//                        if delete == true {
//                            Button(action: {
//                                withAnimation(.spring()){
//                                    items[i].isfinished.toggle()
//                                }
//                            }, label: {
//                                Image(systemName: "minus.circle.fill")
//                                    .foregroundColor(.red)
//                            })
//                        }
                        
                            
                            
                        Button(action: {
                            withAnimation(.spring()){
                                items[i].isstared.toggle()
                            }
                        }, label: {
                            Image(systemName: items[i].isstared ? "flag.fill" : "flag")
                                .foregroundColor(items[i].isstared ? .orange : .gray)
                        })
                            .buttonStyle(StaticButtonStyle())
                    }
                    
                }
            }
            HStack{
                Button(action: {
                    if newitem != ""{
                        withAnimation(.easeIn){
                            items.append(item(text: newitem, isfinished: false, isstared: false, flag: false, createtime: date, tags: [tag]))
                        }
                        newitem = ""
                        tag = ""
                    }
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                })
                    .buttonStyle(StaticButtonStyle())
                VStack{
                    TextField("content", text: $newitem)
                        .keyboardType(.default)
                    HStack{
                        DatePicker.init(selection: $date, displayedComponents: .date) {
                            Text("")
                        }
                        .font(.system(size: 10))
                        .labelsHidden()
                        .transformEffect(.init(scaleX: 0.9, y: 0.9))
                        TextField("tags", text: $tag)
                        Spacer()
                    }
                }
            }
        }
        .toolbar{
            Button(action: {
                withAnimation(.spring()){
                    delete.toggle()
                }
            }, label: {
                Image(systemName: delete ? "pencil.circle.fill" : "pencil.circle")
                    .foregroundColor(.blue)
                    .font(.system(size: 14))
            })
            
        }
        .listStyle(GroupedListStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .environment(\.editMode, self.$isedit)
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
