//
//  ContentView.swift
//  Cribbage Counter WatchKit Extension
//
//  Created by Husayn Esmail on 2021-08-05.
//

import SwiftUI

struct ContentView: View {
    @State var blueScore: Int = 0;
    @State var redScore: Int = 0;
    var body: some View {
        VStack {
        HStack {
            Text("Red")
                .foregroundColor(.red)
                .padding(20)
            Text("Blue")
                .padding(20)
                .foregroundColor(.blue)
        }
            HStack {
                Button(action: {if self.redScore != 0 {self.redScore -= 1}}, label: {
            Text("-")
                .font(.system(size: 23))
        })
        .background(Color.red)
        .cornerRadius(20)
                Button(action: {if self.redScore != 121 {self.redScore += 1}}, label: {
            Text("+")
                .font(.system(size: 23))
        })
        .background(Color.red)
        .cornerRadius(20)
                Button(action: {if self.blueScore != 0 {self.blueScore -= 1}}, label: {
            Text("-")
                .font(.system(size: 23))
        })
        .background(Color.blue)
        .cornerRadius(20)
                Button(action: {if self.blueScore != 121 {self.blueScore += 1}}, label: {
            Text("+")
                .font(.system(size: 23))
        })
        .background(Color.blue)
        .cornerRadius(20)
        }
            HStack {
                Text("\(blueScore)")
                    .offset(x:54, y: 0)
                Text("\(redScore)")
                    .offset(x:-54, y: 0)
            }
            Button(action:{self.blueScore = 0; self.redScore = 0;}, label: {Text("Reset")
            })
            .background(Color.gray)
            .cornerRadius(10)
        }
// I want to build a winner screen and a separate screen for reset so that it's not accidentally tapped. perhaps reset can be on a different page. I could also create a screen to select a 61 point game or a 121 point game.
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
