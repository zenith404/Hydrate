//
//  SwiftUIView.swift
//  Hydrate Watch App
//
//  Created by fai alradhi on 10/08/1445 AH.
//

import SwiftUI
import WatchConnectivity

class ResultCups: ObservableObject {
    @Published var clickCount: Int = 0
    var result: Double {
        Double(clickCount)
    }

    func updateWatch() {
        if WCSession.default.isReachable {
            let message = ["clickCount": clickCount]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: nil)
        }
    }
}

struct CupsView: View {
    @ObservedObject private var resultCups = ResultCups()
    @State private var filledStates = Array(repeating: false, count: 20)

    var body: some View {
        VStack(alignment: .leading) {
            Text("Today's Water Intake")
                .foregroundColor(.gray)
            Text("\(Int(resultCups.result)) cups /  cups")
                .font(.title)
                .fontWeight(.bold)

            VStack(spacing: 40) {
                ForEach(0..<5) { row in
                    HStack(spacing: 55) {
                        ForEach(0..<4) { column in
                            DropZoneView(filledState: $filledStates[row * 4 + column], resultCups: resultCups)
                        }
                    }
                }
            }
            .frame(maxHeight: .infinity)
            .padding(.top, 20)
        }
        .frame(width: 360, height: 700)
        .onAppear {
            resultCups.updateWatch()
        }
    }
}

struct DropZoneView: View {
    @Binding var filledState: Bool
    @ObservedObject var resultCups: ResultCups

    var body: some View {
        VStack {
            Button(action: {
                filledState.toggle()
                if filledState {
                    incrementClickCount()
                } else {
                    decrementClickCount()
                }
                resultCups.updateWatch()
            }) {
                Image(filledState ? "fill" : "empty")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
            }
            Text("1 cup")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }

    private func incrementClickCount() {
        resultCups.clickCount += 1
    }

    private func decrementClickCount() {
        resultCups.clickCount -= 1
    }
}

// Watch-specific code
struct CupsViewWatch: View {
    var body: some View {
        CupsView()
    }
}

// Preview
struct CupView_Previews: PreviewProvider {
    static var previews: some View {
        CupsViewWatch()
            .previewDevice("Apple Watch Series 7 - 45mm")
    }
}
