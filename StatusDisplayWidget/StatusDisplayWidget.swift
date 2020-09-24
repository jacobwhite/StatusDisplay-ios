//
//  StatusDisplayWidget.swift
//  StatusDisplayWidget
//
//  Created by Jacob White on 9/22/20.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        let entryDate = Calendar.current.date(byAdding: .minute , value: 0, to: currentDate)!
        let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

func getJSON() -> NSDictionary {
    let userDefaults = UserDefaults(suiteName: "group.jacobwhite.us.StatusDisplay")!

    let displayCode = userDefaults.string(forKey: "displayCode") ?? ""
    userDefaults.synchronize()
    print("DisplayCode: \(displayCode)")
    let d = NSData(contentsOf:URL(string:"http://statusdisplay.jacobwhite.us/?displayCode=\(displayCode)")!)
    do{
        let json = try JSONSerialization.jsonObject(with: d! as Data, options: .mutableContainers) as! NSDictionary
        if json["status"] as! String == "Off" {
            json.setValue("", forKey: "status")
        }
        return json
        
    } catch{
        
    }
    return [:]
}
struct SimpleEntry: TimelineEntry {
    let date: Date
    var status: String = getJSON()["status"] as! String

    var color:Color {
        get{
            let colorString = (getJSON()["color"] as! String).lowercased()
            
            if colorString == "green" {
                return Color.green
            }
            else if colorString == "black"{
                return Color.black
            }
            else if colorString == "blue"{
                return Color.blue
            }
            else if colorString == "yellow"{
                return Color.yellow
            }
            else if  colorString == "clear"{
                return Color.clear
            }
            return Color.red
        }
    }
    let configuration: ConfigurationIntent
}

struct StatusDisplayWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack{
            entry.color.edgesIgnoringSafeArea(.all)
            Text(entry.status).foregroundColor(.white)
        }
    }
}

@main
struct StatusDisplayWidget: Widget {
    let kind: String = "StatusDisplayWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            StatusDisplayWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("StatusDisplayWidget")
        .description("Displays Status")
    }
}

struct StatusDisplayWidget_Previews: PreviewProvider {
    static var previews: some View {
        StatusDisplayWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
