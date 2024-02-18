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
    
       @State private var isTimePickerVisible = false
    let items: [String] = ["15", "30", "45", "90", "2", "4", "8", "10"]
   
    
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
                    DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
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
                    DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
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
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 10) {
                ForEach(items, id: \.self) { item in
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .foregroundColor(.square)
//                        .background(Color.blue)
                        .cornerRadius(8)
                        .overlay(
                            Text(item)
                            .foregroundColor(.accent)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                            .onTapGesture {
                                // state var =
                            }
                        )
                }
                
            }
                        .padding()
            Spacer()/*.frame(height:250)*/
            Button(){
                // Action
            } label: {
                HStack {
                    Text("Start")
                }
               
                .frame(width: 358, height: 50, alignment: .center)
                .fixedSize()

                .background(.accent)
                .cornerRadius(12)
                .foregroundColor(.white)

                Spacer()
            }
            .padding()
//           buttonStart

        }
    }
    
//    var buttonStart: some View {
//        HStack{
//            Spacer()
//
//            HStack {
//                Text("Start")
//            }
//           
//            .frame(width: 358, height: 50, alignment: .center)
//            .fixedSize()
//
//            .background(.accent)
//            .cornerRadius(12)
//            .foregroundColor(.white)
//
//            Spacer()
//            
//
//        
//        }
//    }
    func formattedTime(_ time: Date) -> String {
          let formatter = DateFormatter()
          formatter.timeStyle = .short
          return formatter.string(from: time)
      }
}



#Preview {
    Onboarding_3()
}
