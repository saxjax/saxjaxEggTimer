//
//  EggTimerButton.swift
//  saxjaxEggTimer
//
//  Created by Jakob Skov Søndergård on 17/06/2022.
//

import SwiftUI

struct EggTimerButton: View {
    var eggTime: EggTime
    var timerFnction: (Int)->()
    var selectNameFunction:(String)->()
    var editing: Bool

    var body: some View {

        Button(){
            editing ? selectNameFunction(eggTime.id) : timerFnction(eggTime.timer*60)
        } label:{

            ZStack {

                ZStack {
                    Image("Egg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Circle().frame(width: 40, height: 50, alignment: .center).foregroundColor(eggTime.color).opacity(0.4)
                }.frame(width: 100, height: 120)

                VStack() {
                    Spacer().frame( height: 70)
                    Text(eggTime.id + ": \(eggTime.timer)")
                        .font(.callout)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.white)
                        .shadow(radius: /*@START_MENU_TOKEN@*/7/*@END_MENU_TOKEN@*/)
                        .blendMode(/*@START_MENU_TOKEN@*/.screen/*@END_MENU_TOKEN@*/)
                    .frame(alignment: .bottom)
                }




            }


        }.padding()
            .contentShape(Rectangle())
            .buttonStyle(.borderedProminent )
            .background(editing ? .red : .clear)
    }
}

struct EggButton_Previews: PreviewProvider {
    static var vm = MainViewModel()
    static var eggTime = EggTime.example

    static var previews: some View {

        HStack(spacing:0) {
            EggTimerButton(eggTime: eggTime, timerFnction: vm.startTimer, selectNameFunction: vm.selectedName, editing: false)
            
        }
    }
}


