//
//  ContentView.swift
//  Hydrate
//
//  Created by zainab hawsa on 03/08/1445 AH.
//

import SwiftUI

struct weightIn: View {
    @State private var weight: String = ""
    @State private var liters: String = "0.0"
    
    var body: some View {
 
          
        NavigationView{
            VStack(spacing: 30) {
                
                VStack (spacing: 10){
                    Image("droplet")
                        .resizable()
                        .frame(width: 45, height: 68)
                        .foregroundColor(Color("PrimaryColor"))
                        .padding(.trailing, 280)
                    
                    Text("iHydrate") //should be bold
                        .font(Font.custom("SF Pro", size: 22))
                        .fontWeight(.bold) //the weight should be thicker?
                        .foregroundColor(Color("PrimaryText"))
                        .padding(.trailing, 250)
                    
                    
                    Text("Start with iHydrate to record and track your water intake daily based on your needs and stay hydrated")
                        .font(Font.custom("SF Pro", size: 17))
                        .foregroundColor(Color("SecondaryText"))
                        .frame(width: 349, height: 66)
                        .multilineTextAlignment(.leading)
                }
                
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 358, height: 44)
                        .foregroundColor(.square)
                    
                    HStack {
                        Text("Body weight")
                            .font(Font.custom("SF Pro", size: 17))
                            .foregroundColor(Color("PrimaryText"))
                            .padding(.leading)
                        
                        HStack{ //this should be [weight kg] the space is too far
                            TextField("weight", text: $weight)
                                .keyboardType(.numberPad)
                                .padding(.horizontal)
                            
                            
                            Text("Kg")
                                .font(Font.custom("SF Pro", size: 17))
                                .foregroundColor(Color("PrimaryText"))
                                .padding(.trailing, 90)
                        }
                        
                    }
                }
                .padding()
                
                
                Spacer()
//                
//                Button(action: {
//                    // action to go the notification View
//                }) {
//                    
//            }
           
            NavigationLink(destination: Onboarding_2(resultLiters: calculateLiters(), resultCups: calculateCups())) {
                   Text("Calculate")
                .font(Font.custom("SF Pro", size: 17))
                .foregroundColor(weight.isEmpty ? Color(.gray) : .white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(weight.isEmpty ? Color("SecondaryText") : Color(.accent))
                .cornerRadius(10)
        }
        .padding()
        .padding(.bottom, 70)
                
                  }
            .padding(.top, 150)
        }
        .onChange(of: weight) { _ in
                    liters = calculateLiters()
                }
        
    }
    func calculateLiters() -> String {
          // Convert weight to Double and calculate liters
          if let weightInKg = Double(weight) {
              let liters = weightInKg * 0.03
              return String(format: "%.2f", liters) // Format the result if necessary
          } else {
              return "0.0" // Default value if weight cannot be parsed
          }
      }
      
      func calculateCups() -> String {
          // Convert liters to Double and calculate cups
          if let litersValue = Double(liters) {
              let cups = litersValue * 0.24
              return String(format: "%.2f", cups) // Convert cups to string
          } else {
              return "0" // Default value if liters cannot be parsed
          }
      }
    
}


//should find a way to remmove padding
#Preview {
    weightIn()
}
//
//func waterNeedsCalculator(weight: Double)-> Double{
//    var result: Double
//    result = weight * 0.03
//    return result
//}
