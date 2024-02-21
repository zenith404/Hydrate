//
//  watchview.swift
//  Hydrate Watch App
//
//  Created by fai alradhi on 10/08/1445 AH.
//

import SwiftUI
import WatchConnectivity

class User: NSObject, ObservableObject {
    @Published var currentWaterIntake: Double = 0
    var dailyWaterIntakeGoal: Double

    init(weight: Double) {
        self.dailyWaterIntakeGoal = weight / 30.0 // Adjust this as needed
        super.init()
        setupWatchConnectivity()
    }

    func addWaterIntake(amount: Double) {
        currentWaterIntake += amount
        updateWatch()
        updateSharedUserDefaults()
        // Additional logic if needed
    }

    func setupWatchConnectivity() {
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }

    func updateWatch() {
        if WCSession.default.isReachable {
            let message = ["currentWaterIntake": currentWaterIntake]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: nil)
        }
    }

    func updateSharedUserDefaults() {
        if let sharedDefaults = UserDefaults(suiteName: "group.com.yourcompany.yourapp") {
            sharedDefaults.set(currentWaterIntake, forKey: "sharedWaterIntake")
        }
    }
}

extension User: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // Handle WCSession activation completion
    }

    // Implement other WCSessionDelegate methods as needed
}

struct Track: View {
    @EnvironmentObject var user: User
    @State private var progress: CGFloat = 0

    private var currentEmoji: String {
        if progress >= 1.0 {
            return "🥳"
        } else {
            let emojis = ["😴", "😃", "😁", "🥰"]
            if user.dailyWaterIntakeGoal > 0 {
                let progressPercentage = Int(progress * CGFloat(emojis.count))
                return emojis[min(progressPercentage, emojis.count - 1)]
            } else {
                return emojis.first!
            }
        }
    }

    func updateWaterIntake(increment: Bool) {
        withAnimation {
            let incrementAmount: Double = 0.5
            if increment {
                user.addWaterIntake(amount: incrementAmount)
            } else if user.currentWaterIntake > 0 {
                user.addWaterIntake(amount: -incrementAmount)
            }
            let newProgress = max(CGFloat(user.currentWaterIntake / user.dailyWaterIntakeGoal), 0)
            progress = newProgress
        }
    }

    var body: some View {
        VStack {
            Text("Today's Water Intake")
                .foregroundColor(Color("grey2"))
                .offset(x: -90, y: 60)
                .padding(.leading)
            Text("\(String(format: "%.1f", user.currentWaterIntake)) liter / \(String(format: "%.1f", user.dailyWaterIntakeGoal)) liter")
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
                    .foregroundColor(Color.blue) // Use your desired color
                    .rotationEffect(Angle(degrees: -90))

                Text(currentEmoji)
                    .font(.system(size: progress >= 1.0 ? 60 : 40))
                    .foregroundColor(Color.blue) // Use your desired color
                    .offset(y: progress >= 1.0 ? 0 : -160)
                    .rotationEffect(Angle(degrees: progress < 1.0 ? Double(progress * 360) : 0))
            }
            .padding(40)

            Spacer()

            HStack(spacing: 90) {
                Button(action: {
                    withAnimation {
                        updateWaterIntake(increment: false)
                    }
                }) {
                    ZStack {
                        Circle()
                            .fill(user.currentWaterIntake > 0 ? Color.gray3 : Color("gray1"))
                            .frame(width: 50, height: 50)
                            .overlay(Circle().stroke(Color.gray3, lineWidth: 0))

                        Image(systemName: "minus")
                            .font(.system(size: 35))
                            .foregroundColor(user.currentWaterIntake > 0 ? Color.blue : Color("gray2"))
                    }
                }.disabled(user.currentWaterIntake <= 0 && user.currentWaterIntake == 0)
                Text("\(String(format: "%.1f", user.currentWaterIntake))")
                    .font(.title)
                    .bold()

                Button(action: {
                    withAnimation {
                        updateWaterIntake(increment: true)
                    }
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.gray3)
                            .frame(width: 50, height: 50)
                            .overlay(Circle().stroke(Color.gray3, lineWidth: 0))

                        Image(systemName: "plus")
                            .font(.system(size: 35))
                            .foregroundColor(.blue) // Use your desired color
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
        let userSample = User(weight: 80)
        Track().environmentObject(userSample)
    }
}
