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

        NavigationView{
            VStack {
                Spacer().frame(height:10) .navigationBarTitle("Saxjax Egg Timer")


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
                Button("reset", role: .destructive){vm.timeLeft = 0}
                Text(vm.displayTimer ? "Seconds left:" : "")
                    .multilineTextAlignment(.center)
                Text(vm.displayTimer ? "\(vm.timeLeft)" : "")
                    .font(.custom("Georgia", size: 70, relativeTo: .headline))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(idealHeight:.infinity)
                Spacer()



            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)

        ContentView().preferredColorScheme(.dark).previewInterfaceOrientation(.landscapeLeft)


    }
}

