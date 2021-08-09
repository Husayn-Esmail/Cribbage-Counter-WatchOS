//
//  RedWinsView.swift
//  Cribbage Counter WatchKit Extension
//
//  Created by Husayn Esmail on 2021-08-08.
//

import SwiftUI

// if red wins
struct RedWinsView: View {
    @ObservedObject var scores = Counters.shared
    var body: some View {
        VStack {
            Text("Red Wins!")
                .foregroundColor(.red)
            Text("\(scores.scores.redScore)")
            Button(action:{scores.scores.blueScore = 0; scores.scores.redScore = 0;}, label: {Text("Reset")
            })
            .background(Color.gray)
            .cornerRadius(10)
        }
    }
}

struct RedWinsView_Previews: PreviewProvider {
    static var previews: some View {
        RedWinsView()
    }
}
