//
//  SwiftUIView.swift
//  Hydrate
//
//  Created by fai alradhi on 09/08/1445 AH.
//
/*import Foundation

class User: ObservableObject {
    @Published var weight: Double {
        didSet {
            updateDailyWaterIntakeGoal()
            saveUserData()
        }
    }
    @Published var dailyWaterIntakeGoal: Double = 0
    @Published var currentWaterIntake: Double = 0
    
    init(weight: Double) {
        self.weight = weight
        loadUserData() //
    }
    
    private func updateDailyWaterIntakeGoal() {
        dailyWaterIntakeGoal = weight * 0.03
    }
    
    func addWaterIntake(amount: Double) {
        let newIntake = currentWaterIntake + amount
        currentWaterIntake = min(newIntake, dailyWaterIntakeGoal) // Prevent exceeding the goal
        saveUserData()
    }
}

private extension User {
    static let weightKey = "userWeight"
    static let dailyWaterIntakeGoalKey = "dailyWaterIntakeGoal"
    static let currentWaterIntakeKey = "currentWaterIntake"
    
    func saveUserData() {
        UserDefaults.standard.set(weight, forKey: Self.weightKey)
        UserDefaults.standard.set(dailyWaterIntakeGoal, forKey: Self.dailyWaterIntakeGoalKey)
        UserDefaults.standard.set(currentWaterIntake, forKey: Self.currentWaterIntakeKey)
    }
    
    func loadUserData() {
        weight = UserDefaults.standard.double(forKey: Self.weightKey)
        dailyWaterIntakeGoal = UserDefaults.standard.double(forKey: Self.dailyWaterIntakeGoalKey)
        currentWaterIntake = UserDefaults.standard.double(forKey: Self.currentWaterIntakeKey)
    }
}*/



