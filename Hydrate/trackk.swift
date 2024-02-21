//
//  trackk.swift
//  Hydrate
//
//  Created by fai alradhi on 10/08/1445 AH.
//

import SwiftUI

struct Track: View {
    @AppStorage("currentWaterIntake") private var currentWaterIntake: Double = 0
    @State private var progress: CGFloat = 0.1
    let userWeight: Double // Add userWeight as a parameter
    
    init(userWeight: Double) {
        self.userWeight = userWeight
    }

    private var dailyWaterIntakeGoal: Double {
        userWeight / 30.0
    }

    private var currentEmoji: String {
        if progress >= 1.0 {
            return "🥳"
        } else {
            let emojis = ["😴", "😃", "😁", "🥰"]
            if dailyWaterIntakeGoal > 0 {
                let progressPercentage = Int(progress * CGFloat(emojis.count))
                return emojis[min(progressPercentage, emojis.count - 1)]
            } else {
                return emojis.first!
            }
        }
    }

    private func updateWaterIntake(increment: Bool) {
        let incrementAmount: Double = 0.5
        if increment {
            currentWaterIntake += incrementAmount
        } else if currentWaterIntake > 0 {
            currentWaterIntake -= incrementAmount
        }
        let newProgress = max(CGFloat(currentWaterIntake / dailyWaterIntakeGoal), 0)
        withAnimation {
            progress = newProgress
        }
    }

    var body: some View {
        VStack {
            Text("Today's Water Intake")
                .foregroundColor(Color("grey2"))
                .offset(x: -90, y: 60)
                .padding(.leading)
            Text("\(String(format: "%.1f", currentWaterIntake)) liter / \(String(format: "%.1f", dailyWaterIntakeGoal)) liter")
                .font(.title)
                .bold()
                .foregroundColor(Color("Black1"))
                .foregroundColor(.black)
                .offset(x: -70, y: 65)
                .padding(.leading)

            Spacer()

            ZStack {
                Circle()
                    .stroke(lineWidth: 50.0)
                    .opacity(0.8)
                    .foregroundColor(Color.gray2)

                Circle()
                    .trim(from: 0.0, to: min(progress, 1.0))
                    .stroke(style: StrokeStyle(lineWidth: 50.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.colorbl) // Adjusted to use blue color
                    .rotationEffect(Angle(degrees: -90))

                Text(currentEmoji)
                    .font(.system(size: progress >= 1.0 ? 60 : 40))
                    .foregroundColor(Color.blue)
                    .offset(y: progress >= 1.0 ? 0 : -160)
                    .rotationEffect(Angle(degrees: progress < 1.0 ? Double(progress * 360) : 0))
            }
            .padding(40)

            Spacer()

            HStack(spacing: 90) {
                Button(action: {
                    updateWaterIntake(increment: false)
                }) {
                    ZStack {
                        Circle()
                            .fill(currentWaterIntake > 0 ? Color.gray3 : Color("gray1"))
                            .frame(width: 50, height: 50)
                            .overlay(Circle().stroke(Color.gray3, lineWidth: 0))

                        Image(systemName: "minus")
                            .font(.system(size: 35))
                            .foregroundColor(currentWaterIntake > 0 ? Color.colorbl : Color("gray2"))
                    }
                }.disabled(currentWaterIntake <= 0 && currentWaterIntake == 0)
                Text("\(String(format: "%.1f", currentWaterIntake))")
                    .font(.title)
                    .bold()

                Button(action: {
                    updateWaterIntake(increment: true)
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.gray3)
                            .frame(width: 50, height: 50)
                            .overlay(Circle().stroke(Color.gray3, lineWidth: 0))

                        Image(systemName: "plus")
                            .font(.system(size: 35))
                            .foregroundColor(Color.colorbl) // Adjusted to use blue color
                    }
                }
            }
            .padding()
            .offset(y: -75)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Track_Previews: PreviewProvider {
    static var previews: some View {
        Track(userWeight: 80)
    }
}
