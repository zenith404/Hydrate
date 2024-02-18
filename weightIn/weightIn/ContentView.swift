//
//  SwiftUIView.swift
//  Hydrate
//
//  Created by AlAnoud on 14/02/2024.
//

import SwiftUI

struct weightIn: View {
    @State private var weight: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            
            VStack (spacing: 10){
                Image(systemName: "drop.fill")
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
                    .foregroundColor(Color("PrimaryBG"))
                
                HStack {
                    Text("Body weight")
                        .font(Font.custom("SF Pro", size: 17))
                        .foregroundColor(Color("PrimaryText"))
                        .padding(.leading)
                    
                    HStack{ //this should be [weight kg] the space is too far
                        TextField("weight", text: $weight)
                            . keyboardType(.numberPad)
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
            
            Button(action: {
                            // action to go the notification View
                        }) {
                            Text("Calculate")
                                .font(Font.custom("SF Pro", size: 17))
                                .foregroundColor(weight.isEmpty ? Color("SecondaryText") : .white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(weight.isEmpty ? Color("TertiaryText") : Color("PrimaryColor"))
                                .cornerRadius(10)
                        }
            .padding()
            .padding(.bottom, 70)
        }
        .padding(.top, 150)
    }
    
}

//should find a way to remmove padding
#Preview {
    weightIn()
}
