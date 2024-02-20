//
//  Cups view.swift
//  Hydrate
//
//  Created by zainab hawsa on 05/08/1445 AH.
//
import SwiftUI

struct Cups_view: View {
    @State var resultCups: [Int] = []
    @State var drunkCups: [Int] = []
    @State private var litersValue: Double = 0.0
    @State private var cups: Double = 0.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Today's Water Intake")
                .foregroundColor(.gray)
            Text("\(drunkCups.count) cups / \(resultCups.count) cups")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            
            VStack(spacing: 60){
                ForEach(0..<4) { row in
                    HStack(spacing: 20){
                        ForEach(0..<resultCups.count, id: \.self)  { i in
                            Image(drunkCups.contains(i) ? "fill" : "empty")
                                .font(.title)
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    toggleDrunkCup(index: i)
                                }
                        }
                    }
                }
            }
            Spacer()
        }
    }
    
    func toggleDrunkCup(index: Int) {
        if let idx = drunkCups.firstIndex(of: index) {
            drunkCups.remove(at: idx)
        } else {
            drunkCups.append(index)
        }
    }
}

// Preview
struct Cups_view_Previews: PreviewProvider {
    static var previews: some View {
        Cups_view(resultCups:[], drunkCups: [])
    }
}
