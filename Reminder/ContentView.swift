//
//  ContentView.swift
//  Reminder
//
//  Created by cm on 2022/3/28.
//

import SwiftUI

struct ContentView: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
        
    }
    
    @State var target = ""
    @State var addSheet = false
    @State var headers = Headers
    @State var lists = Lists

    var body: some View {
        NavigationView{
            VStack{
                TextField("search", text: $target)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: UIScreen.main.bounds.width*0.9)
                    
                ForEach(0...1, id: \.self){i in
                    HStack(spacing: UIScreen.main.bounds.width/20){
                        ForEach(0...1, id: \.self){j in
                            ZStack{
                                Color(.white)
                                HStack{
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Image(systemName: headers[i][j].icon)
                                                .font(.system(size: 22))
                                                .foregroundColor(headers[i][j].color)
                                            Spacer()
                                        }
                                        Spacer()
                                        HStack{
                                            Text(headers[i][j].name)
                                                .font(.system(size: 14))
                                                .foregroundColor(.secondary)
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                    .padding(.leading, 8.0)
                                    Spacer()
                                    VStack{
                                        Spacer()
                                        Text("\(headers[i][j].num)")
                                            .font(.system(size: 22, weight: .heavy))
                                        Spacer()
                                        Spacer()
                                    }
                                    .padding(.trailing, 8.0)
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width/2.4, height: 60)
                            .cornerRadius(10)
                        }
                    }
                }
                List{
                    Section(header: Text("My Lists")){
                        ForEach(0...lists.count - 1, id: \.self){i in
                            
                            HStack{
                                
                                Image(systemName: lists[i].icon)
                                    .foregroundColor(lists[i].color)
                                    .font(.system(size: 22, weight: .regular))
                                NavigationLink(destination: ReminderView()){
                                    Text(lists[i].name)
                                        .font(.system(size: 14))
                                    Spacer()
                                    Text("\(lists[i].num)")
                                        .foregroundColor(.secondary)
                                        .font(.system(size: 13))
                                }
                            }
                        }
                        Button(action: {
                            addSheet.toggle()
                        }, label: {
                            HStack{
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 22))
                                Text("Add List")
                                    .font(.system(size: 14))
                                    .foregroundColor(.blue)
                            }
                            
                        })
                    }
                    .headerProminence(.increased)
                }
                    
            }
            
            .background(.ultraThinMaterial)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .sheet(isPresented: $addSheet){
                AddSheet(lists: $lists, save: $addSheet)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
