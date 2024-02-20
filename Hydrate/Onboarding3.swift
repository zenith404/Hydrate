//
//  Onboarding 3.swift
//  Hydrate
//
//  Created by zainab hawsa on 04/08/1445 AH.
//

import SwiftUI
import UserNotifications

struct Onboarding_3: View {
    @State private var selectedTime = Date()
    @State private var time: Date = Date()
    @State private var notificationStartTime = Date()
    @State private var notificationEndTime = Date()
    @State private var notificationIntervalHours: Int = 1 // Hours
    @State private var notificationCount = 3

    
    
   
    
    var body: some View {
        
        VStack(alignment:.leading){
            Text("Notification Preferences")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            Spacer().frame(height:50)
            Text("The start and end hour")
                .font(.title3)
                .fontWeight(.medium)
                .padding(.horizontal)
            Text("Specify the start and end date to receive the notifications ")
                .fontWeight(.regular)
                .font(.system(size: 13))
                .foregroundColor(.gray)
                .padding(.horizontal)
//            Spacer().frame(height:50)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 358, height: 44)
                    .foregroundColor(.square)
                
                HStack {
                    Text("Start hour")
                        .font(Font.custom("SF Pro", size: 17))
                        .foregroundColor(.black)
                        .padding(.leading)
//                    Spacer()
                    DatePicker("Select Time", selection: $notificationStartTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
//                        .padding()
//                    
                    Spacer()
                    
                   
                            
                        
                }
            }
            .padding()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 358, height: 44)
                    .foregroundColor(.square)
                
                HStack {
                    Text("End hour")
                        .font(Font.custom("SF Pro", size: 17))
                        .foregroundColor(.black)
                        .padding(.leading)
//                    Spacer()
                    DatePicker("Select Time", selection: $notificationEndTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
//                        .padding()
//
                    Spacer()
                    
                   
                            
                        
                }
            }
            .padding()
            
            Spacer()/*.frame(height:50)*/
            
            Text("Notification interval")
                .font(.title3)
                .fontWeight(.medium)
                .padding(.horizontal)
            Text("How often would you like to receive notifications within the specified time interval")
                .font(.system(size:13))
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            NotiInterval()
//
            .padding()
            
//
            Spacer()
            
            NavigationLink(destination: CupsView()) {
                Button(action: {
                    scheduleNotifs(from: notificationStartTime, to: notificationEndTime, with: TimeInterval(notificationIntervalHours))
                }) {
                    HStack {
                        Text("Start")
                    }
                    .frame(width: 358, height: 50, alignment: .center)
                    .fixedSize()
                    .background(Color.accentColor)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    Spacer()
                }
                .padding()
            }
           

        }
    }
    
    
    
    func formattedTime(_ time: Date) -> String {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: time)
        }
        
        func scheduleNotifs(from startDate: Date, to endDate: Date, with interval: TimeInterval) {
            var curDate = startDate
            var count = 0
            while curDate.compare(endDate) != .orderedDescending {
                scheduleNotif(at: curDate)
                curDate = curDate.addingTimeInterval(interval)
                count += 1
            }
        }
        
        private func scheduleNotif(at date: Date) {
            let content = UNMutableNotificationContent()
            content.title = "Water Reminder"
            content.body = " "

            let triggerTime = Calendar.current.dateComponents([.year, .day, .hour, .minute, .second], from: date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerTime, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

            let center = UNUserNotificationCenter.current()
            center.add(request) { (error : Error?) in
                if let theError = error {
                    print(theError.localizedDescription)
                }
            }
        }
    }

struct NotiInterval: View{
    @State private var isTimePickerVisible = false
    @State private var selectedButtonIndex: Int?
 
 let buttons = [("15", "Mins"), ("30", "Mins"), ("60", "Mins"), ("90", "Mins"), ("2", "Hours"), ("3", "Hours"), ("4", "Hours"), ("5", "Hours")]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(0..<2) { row in
                HStack(spacing: 8) {
                    ForEach(0..<4) { column in
                        let index = row * 4 + column
                        RectangleButton(number: buttons[index].0, text: buttons[index].1, isSelected: Binding(
                            get: { selectedButtonIndex == index },
                            set: { newValue in
                                selectedButtonIndex = newValue ? index : nil
                            }
                        ))
                    }
                }
            }
        }
    }
}

struct RectangleButton: View {
    let number: String
    let text: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            VStack(spacing: 4) {
                Text(number)
                    .font(.system(size: 22))
                    .fontWeight(.heavy)
                    .foregroundColor(isSelected ? .white : Color("AccentColor"))
                Text(text)
                    .font(.system(size: 13))
                    .foregroundColor(isSelected ? .white : .black)
            }
            .frame(width: 78, height: 74)
            .background(isSelected ? Color("AccentColor") : Color("Square"))
            .cornerRadius(8)
            .padding(4)
        }
    }
}



#Preview {
    Onboarding_3()
}
