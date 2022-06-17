//
//  EggTimerModel.swift
//  saxjaxEggTimer
//
//  Created by Jakob Skov Søndergård on 17/06/2022.
//

import Foundation
import SwiftUI

class EggTimerModel {
     var eggTimes = [
        "Soft": EggTime(id: "Soft" , timer:5, color: .yellow ),
        "Medium": EggTime(id:"Medium", timer:7, color: .orange),
        "Hard": EggTime(id:"Hard",timer:10, color: .green)
    ]

}
