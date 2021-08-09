//
//  GameModeView.swift
//  Cribbage Counter WatchKit Extension
//
//  Created by Husayn Esmail on 2021-08-08.
//

import SwiftUI

struct GameModeView: View {
    @State var points121 = false
    @State var points61 = false
    var body: some View {
        VStack {
            Text("Game Mode:")
            NavigationLink(destination: o21PointView(), isActive: $points121){
                Button(action: {self.points121 = true}, label: {
                    Text("121 Points")
                })
            }
            NavigationLink(destination: s1PointView(), isActive: $points61){
                Button(action: {self.points61 = true}, label: {
                    Text("61 Points")
                })
            }
        }
    }
}

struct GameModeView_Previews: PreviewProvider {
    static var previews: some View {
        GameModeView()
    }
}
