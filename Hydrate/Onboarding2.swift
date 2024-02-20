

import SwiftUI

struct Onboarding_2: View {
//    let litersOfWaterNeeded: Double = 2.4
//    let cupsOfWaterNeeded: Int = 12
//    @State var resultL : Double
    
    @State var resultLiters: String
    @State var resultCups: String
    @State var mugs  = false
    @State var liters  = false

    
    
    var body: some View {
        
        Spacer().frame(height:120)
        VStack(alignment:.leading){
            Text("The needed water intake")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            
            Text("Your body needs \(resultLiters) liters of hydration, which is equivalent to \(resultCups) cups")
                .font(Font.custom("SF Pro", size: 17))
                .foregroundColor(.gray)
                .frame(width: 355, height: 66, alignment: .topLeading)
                .padding(.leading)
            
            HStack(){
                ZStack{
                    Button(action: {
                        self.mugs.toggle()
                    }, label: {
                        if !mugs{
                            VStack{
                                Image("cups")
                                WaterMetricView(metricValue: "\(resultCups)", metricUnit: "cups", imageName: "cups")
                            }.frame(width: 171, height: 159.9353)
                                .foregroundColor(.black)
                                .background(Color(Color.square))
                                .cornerRadius(8.04706)
                        }else {
                            VStack{
                                Image("cups")
                                WaterMetricView(metricValue: "\(resultCups)", metricUnit: "cups", imageName: "cups")
                            }.frame(width: 171, height: 159.9353)
                                .foregroundColor(.white)
                                .background(Color(Color.accent))
                                .cornerRadius(8.04706)
                               
                
                        
                        }
                        
                    })
//
                }
                .padding()
                Spacer().frame(width:0)
                ZStack{
//
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        if !liters{
                            VStack{
                                Image("Bottle")
                                WaterMetricView(metricValue:  "\(resultLiters)", metricUnit: "L", imageName: "Bottle")
                                
                            }.frame(width: 171, height: 159.9353)
                                .foregroundColor(.black)
                                .background(Color(Color.square))
                                .cornerRadius(8.04706)
                        }
                        else {
                            VStack{
                                Image("Bottle")
                                WaterMetricView(metricValue: "\(resultLiters)", metricUnit: "L", imageName: "Bottle")
                            }.frame(width: 171, height: 159.9353)
                                .foregroundColor(.black)
                                .background(Color(Color.red))
                                .cornerRadius(8.04706)
                               
                        }
                        
                    })
                  
                }
            }
            Spacer().frame(height:150)
            
           NavigationLink(destination: Onboarding_3()){
                HStack{
                    Spacer()
                    Text("Set the notification")
                    Spacer()
                }
                .frame(width: 358, height: 50, alignment: .center)
                .fixedSize()
                .background(Color.accentColor)
                .cornerRadius(12)
                .foregroundColor(.white)
            }
            .padding()
            
        }
        
    }
    
}

struct WaterMetricView: View {
    let metricValue: String
    let metricUnit: String
    let imageName: String
    
    var body: some View {
        VStack {
//            Image(systemName: imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 50, height: 50)
//                .foregroundColor(Color.blue)
            
            HStack(spacing:5){
                Text(metricValue)
                    .font(.title2)
                    .bold()
                
                Text(metricUnit)
                    .font(.caption)
            }
        }
//        .padding()
//        .frame(minWidth: 0, maxWidth: .infinity)
//        .background(Color(.systemGray6))
//        .cornerRadius(8)
    }
}
//func waterNeedsCalculator(weight: Double)-> Double{
//    var result: Double
//    result = weight * 0.03
//    return result
//}

#Preview {
    Onboarding_2(resultLiters: "", resultCups: "")
    }




              
        
