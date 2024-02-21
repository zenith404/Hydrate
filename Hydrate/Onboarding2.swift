
import SwiftUI

struct Onboarding2: View {
    @AppStorage("userWeight") private var userWeight: Double = 0.0
    @State var resultLiters: String
    @State var resultCups: String
    @State var mugs = false
    @State var liters = false
    
    var body: some View {
        Spacer().frame(height: 120)
        VStack(alignment: .leading) {
            Text("The needed water intake")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            
            Text("Your body needs \(resultLiters) liters of hydration, which is equivalent to \(resultCups) cups")
                .font(Font.custom("SF Pro", size: 17))
                .foregroundColor(.gray)
                .frame(width: 355, height: 66, alignment: .topLeading)
                .padding(.leading)
            
            HStack() {
                ZStack {
                    Button(action: {
                        self.mugs.toggle()
                    }, label: {
                        if !mugs {
                            VStack {
                                Image("cups")
                                WaterMetricView(metricValue: "\(resultCups)", metricUnit: "cups", imageName: "cups")
                            }
                            .frame(width: 171, height: 159.9353)
                            .foregroundColor(.black)
                            .background(Color(Color.square))
                            .cornerRadius(8.04706)
                        } else {
                            VStack {
                                Image("cups")
                                WaterMetricView(metricValue: "\(resultCups)", metricUnit: "cups", imageName: "cups")
                            }
                            .frame(width: 171, height: 159.9353)
                            .foregroundColor(.white)
                            .background(Color(Color.accent))
                            .cornerRadius(8.04706)
                        }
                    })
                }
                .padding()
                Spacer().frame(width: 0)
                ZStack {
                    Button(action: {}, label: {
                        if !liters {
                            VStack {
                                Image("Bottle")
                                WaterMetricView(metricValue: "\(resultLiters)", metricUnit: "L", imageName: "Bottle")
                            }
                            .frame(width: 171, height: 159.9353)
                            .foregroundColor(.black)
                            .background(Color(Color.square))
                            .cornerRadius(8.04706)
                        } else {
                            VStack {
                                Image("Bottle")
                                WaterMetricView(metricValue: "\(resultLiters)", metricUnit: "L", imageName: "Bottle")
                            }
                            .frame(width: 171, height: 159.9353)
                            .foregroundColor(.black)
                            .background(Color(Color.red))
                            .cornerRadius(8.04706)
                        }
                    })
                }
            }
            Spacer().frame(height: 150)
            
            NavigationLink(destination: Onboarding3()) {
                HStack {
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
            HStack(spacing: 5) {
                Text(metricValue)
                    .font(.title2)
                    .bold()
                
                Text(metricUnit)
                    .font(.caption)
            }
        }
    }
}

struct Onboarding2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding2(resultLiters: "", resultCups: "")
    }
}

        
