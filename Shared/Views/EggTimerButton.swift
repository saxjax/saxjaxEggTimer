//
//  EggTimerButton.swift
//  saxjaxEggTimer
//
//  Created by Jakob Skov Søndergård on 17/06/2022.
//

import SwiftUI

struct EggTimerButton: View {
    @Binding var timeLeft: Int
    @Binding var timer:Timer?
    @Binding var displayTimer: Bool
    var eggTime: EggTime

    var body: some View {

        Button(eggTime.id + ": \(eggTime.timer)"){
            if (!displayTimer){
                timeLeft = timeLeft == 0 ? eggTime.timer*60 : timeLeft
                displayTimer = true
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                    timeLeft -= 1
                    if timeLeft <= 0 {
                        timer?.invalidate()
                        displayTimer = false
                        timeLeft = 0
                    }
                })
            }
        }.padding()
    }
}

struct EggButton_Previews: PreviewProvider {
    @State static var timeLeft = 0
    @State static var timer:Timer? = Timer()
    @State static var displayTimer = true
    static var eggTime = EggTime(id: "Hard", timer: 10)

    static var previews: some View {
        EggTimerButton(timeLeft: $timeLeft, timer: $timer, displayTimer: $displayTimer, eggTime: eggTime)
    }
}
