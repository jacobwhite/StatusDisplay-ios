//
//  ContentView.swift
//  StatusDisplay
//
//  Created by Jacob White on 9/22/20.
//

import SwiftUI
import WidgetKit
let userDefaults = UserDefaults(suiteName: "group.jacobwhite.us.StatusDisplay")!
struct ContentView: View {

    @State private var displayCode = userDefaults.string(forKey: "displayCode") ?? "not set"
    @State private var status =      userDefaults.string(forKey: "status")      ?? "not set"
    @State private var color = "green"
    
    var body: some View {
        ZStack(content: {
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack(content:{
                Text("Status Display Console")
                    .padding()
                
                HStack(content: {
                    Text("Status")
                        .frame(width: 120, height: 25, alignment: .leading)
                    TextField(status,
                              text: $status,
                              onCommit:{
                                userDefaults.set(status, forKey: "status")
                                userDefaults.synchronize()

                                _ = NSData(contentsOf:URL(string:"http://statusdisplay.jacobwhite.us/?displayCode=\(displayCode)&status=\(status)&color=\(color)")!)
                                    WidgetCenter.shared.reloadTimelines(ofKind: "StatusDisplayWidget")
                              })
                        .border(Color.black)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .frame(width: 200, height: 25, alignment: .trailing)
                })
                
                HStack(content: {
                    Text("Display Code")
                        .frame(width: 120, height: 25, alignment: .leading)
                    TextField(displayCode,
                              text: $displayCode,
                              onCommit:{
                                userDefaults.set(displayCode, forKey: "displayCode")
                                userDefaults.synchronize()

                                
                              })
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .frame(width: 200, height: 25, alignment: .trailing)
                })
                HStack(content: {
                        
                    Button("     ", action:{
                        color = "green"
                        _ = NSData(contentsOf:URL(string:"http://statusdisplay.jacobwhite.us/?displayCode=\(displayCode)&status=\(status)&color=\(color)")!)
                            WidgetCenter.shared.reloadTimelines(ofKind: "StatusDisplayWidget")
                    })
                        .frame(width: 50, height: 25, alignment: .center)
                        .background(Color.green)
                    
                    
                    Button("     ", action:{
                        color = "blue"
                        _ = NSData(contentsOf:URL(string:"http://statusdisplay.jacobwhite.us/?displayCode=\(displayCode)&status=\(status)&color=\(color)")!)
                            WidgetCenter.shared.reloadTimelines(ofKind: "StatusDisplayWidget")
                    })
                        .frame(width: 50, height: 25, alignment: .center)
                        .background(Color.blue)

                    Button("     ", action:{
                        color = "yellow"
                        _ = NSData(contentsOf:URL(string:"http://statusdisplay.jacobwhite.us/?displayCode=\(displayCode)&status=\(status)&color=\(color)")!)
                            WidgetCenter.shared.reloadTimelines(ofKind: "StatusDisplayWidget")
                    })
                        .frame(width: 50, height: 25, alignment: .center)
                        .background(Color.yellow)

                    Button("     ", action:{
                        color = "black"
                        _ = NSData(contentsOf:URL(string:"http://statusdisplay.jacobwhite.us/?displayCode=\(displayCode)&status=\(status)&color=\(color)")!)
                            WidgetCenter.shared.reloadTimelines(ofKind: "StatusDisplayWidget")
                    })
                        .frame(width: 50, height: 25, alignment: .center)
                        .background(Color.black)

                    Button("     ", action:{
                        color = "red"
                        _ = NSData(contentsOf:URL(string:"http://statusdisplay.jacobwhite.us/?displayCode=\(displayCode)&status=\(status)&color=\(color)")!)
                            WidgetCenter.shared.reloadTimelines(ofKind: "StatusDisplayWidget")
                    })
                        .frame(width: 50, height: 25, alignment: .center)
                        .background(Color.red)
                    
                    Button("     ", action:{
                        color = "purple"
                        _ = NSData(contentsOf:URL(string:"http://statusdisplay.jacobwhite.us/?displayCode=\(displayCode)&status=\(status)&color=\(color)")!)
                            WidgetCenter.shared.reloadTimelines(ofKind: "StatusDisplayWidget")
                    })
                        .frame(width: 50, height: 25, alignment: .center)
                        .background(Color.purple)
                    
                    Button("     ", action:{
                        color = "orange"
                        _ = NSData(contentsOf:URL(string:"http://statusdisplay.jacobwhite.us/?displayCode=\(displayCode)&status=\(status)&color=\(color)")!)
                            WidgetCenter.shared.reloadTimelines(ofKind: "StatusDisplayWidget")
                    })
                        .frame(width: 50, height: 25, alignment: .center)
                        .background(Color.orange)
                })

                Button("     ", action:{
                    color = "brown"
                    _ = NSData(contentsOf:URL(string:"http://statusdisplay.jacobwhite.us/?displayCode=\(displayCode)&status=\(status)&color=\(color)")!)
                        WidgetCenter.shared.reloadTimelines(ofKind: "StatusDisplayWidget")
                })
                    .frame(width: 50, height: 25, alignment: .center)
                    .background(Color.init(.sRGB, red: 0.7, green: 0.4, blue: 0.0, opacity: 1.0))
                
                
                Button("Free", action: { _ = NSData(contentsOf:URL(string:"http://statusdisplay.jacobwhite.us/?displayCode=\(displayCode)&status=Free&color=green")!)
                    WidgetCenter.shared.reloadTimelines(ofKind: "StatusDisplayWidget")
                })
                    .accentColor(.white)
                    .frame(width: 150, height: 50, alignment: .center)
                    .padding(10)
                    .background(Color.green)
                
                Button("On Call", action: { _ = NSData(contentsOf:URL(string:"http://statusdisplay.jacobwhite.us/?displayCode=\(displayCode)&status=On%20Call&color=red")!)
                    WidgetCenter.shared.reloadTimelines(ofKind: "StatusDisplayWidget")
                })
                    .accentColor(.white)
                    .frame(width: 150, height: 50, alignment: .center)
                    .padding(10)
                    .background(Color.red)
                
                Button("Off", action: { _ = NSData(contentsOf:URL(string:"http://statusdisplay.jacobwhite.us/?displayCode=\(displayCode)&status=Off&color=black")!)
                    WidgetCenter.shared.reloadTimelines(ofKind: "StatusDisplayWidget")
                })
                    .accentColor(.white)
                    .frame(width: 150, height: 50, alignment: .center)
                    .padding(10)
                    .background(Color.black)
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
