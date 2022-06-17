//
//  Models.swift
//  saxjaxEggTimer
//
//  Created by Jakob Skov Søndergård on 17/06/2022.
//

import Foundation
import SwiftUI


    struct EggTime:Identifiable {
        let id:String
        var timer:Int
        var color:Color
        }


//struct EggTimesModel: Codable  {
//    var eggTimes: [String:EggTime]?
//}

//MARK: example
#if DEBUG

extension EggTime {
    static var example: EggTime {
        EggTime(id: "Soft" , timer:5, color: .yellow )

    }
}
#endif

    

