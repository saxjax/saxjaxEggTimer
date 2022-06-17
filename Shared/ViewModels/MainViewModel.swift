//
//  MainViewModel.swift
//  saxjaxEggTimer
//
//  Created by Jakob Skov Søndergård on 17/06/2022.
//

import Foundation

class MainViewModel: ObservableObject {
// MARK: static values
//    private var model = EggTimesModel()
//    @Published var eggTimer = EggTimesModel(eggTimes: EggTimerModel().eggTimes)
    @Published var eggTimes = EggTimerModel().eggTimes

// MARK: State values
    @Published var timeLeft = 0
    @Published var displayTimer = false
    @Published var timer: Timer?
    @Published var selectedName: String = ""


//  MARK: functions
    func startTimer(duration: Int){
        timeLeft = timeLeft == 0 ? duration : timeLeft

        if (!displayTimer){
            displayTimer = true
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self]_ in
                timeLeft -= 1
                if self.timeLeft <= 0 {
                    self.timer?.invalidate()
                    self.displayTimer = false
                    self.timeLeft = 0
                }
            })
        }

    }

    func selectedName(name:String){
        selectedName = name
    }

    func changeEggTime(name: String, newValue:String){
        if let intVal = Int(newValue){
        eggTimes[name]?.timer = intVal
        }
        selectedName(name: "")
    }
    
}
