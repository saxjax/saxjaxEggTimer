//
//  ContentView.swift
//  Shared
//
//  Created by Jakob Skov Søndergård on 17/06/2022.
//

import SwiftUI

struct ContentView: View {

    private let eggTimes:[EggTime] = [
        EggTime(id: "Soft", timer:5),
        EggTime(id:"Medium", timer:7),
        EggTime(id:"Hard",timer:10)
    ]
    @State var timeLeft = 0
    @State var displayTimer = false
    @State var timer: Timer?


    var body: some View {
        VStack {
            Button("reset", role: .destructive){timeLeft = 0}
            HStack {
                ForEach(eggTimes) {eggTime  in
                    VStack {
                        EggTimerButton(timeLeft: $timeLeft, timer: $timer, displayTimer: $displayTimer, eggTime: eggTime)
                    }
                }
            }
            Text(displayTimer ? "Seconds left: \(timeLeft)" : "")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

