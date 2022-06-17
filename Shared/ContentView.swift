//
//  ContentView.swift
//  Shared
//
//  Created by Jakob Skov Søndergård on 17/06/2022.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var vm = MainViewModel()
    @State var newValue = ""
    @State var editing = false


    var body: some View {
        VStack {
            HStack {

                Spacer()
                Button(editing ? "set": "edit a timer", role: .destructive){
                    if editing {
                        vm.changeEggTime(name: vm.selectedName, newValue: newValue)
                        newValue = ""
                    }
                    editing = !editing
                }.frame(width: 200, alignment: .center)
                .buttonStyle(.borderedProminent)

                HStack {
                    if(editing){
                        Text(vm.selectedName)
                        TextField("edit durations", text: $newValue)
                    }
                    else {
                        Spacer()
                    }
                }

            }
            HStack(alignment: .bottom, spacing:-30) {
                ForEach(vm.eggTimes.sorted(by: {$0.key > $1.key}), id: \.self.key) {eggTime  in
                    EggTimerButton(eggTime: eggTime.value, timerFnction: vm.startTimer, selectNameFunction: vm.selectedName , editing: editing).frame(maxHeight: 200, alignment: .bottom)
                }

            }
            Text(vm.displayTimer ? "Seconds left: \(vm.timeLeft)" : "")
            Button("reset", role: .destructive){vm.timeLeft = 0}

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

