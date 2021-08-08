//
//  ContentView.swift
//  Cribbage Counter WatchKit Extension
//
//  Created by Husayn Esmail on 2021-08-05.
//

import SwiftUI

// Creating an observable object so that data can be passed around efficiently.
class Counters: ObservableObject {
    struct blueAndRed {
        var blueScore: Int!
        var redScore: Int!
    }
    @Published var scores = blueAndRed()
    init() {
        scores.blueScore = 0
        scores.redScore = 0
    }
    static var shared = Counters()
}

struct ContentView: View {
    @ObservedObject var scores = Counters.shared;
    @State var resetRequest: Bool = false;
    
    var body: some View {
        return Group  {
            if scores.scores.redScore == 121 {
                RedWinsView()
            } else if scores.scores.blueScore == 121 {
                BlueWinsView()
            } else {
                VStack {
                    HStack {
                        // display score labels
                        Text("Red")
                            .foregroundColor(.red)
                            .padding(20)
                        Text("Blue")
                            .padding(20)
                            .foregroundColor(.blue)
                    }
                    HStack {
                        // decrease score for red
                        Button(action: {if scores.scores.redScore != 0 {scores.scores.redScore -= 1}}, label: {
                            Text("-")
                                .font(.system(size: 23))
                        })
                        .background(Color.red)
                        .cornerRadius(20)
                        // increase score for red
                        Button(action: {if scores.scores.redScore != 121 {scores.scores.redScore += 1}}, label: {
                            Text("+")
                                .font(.system(size: 23))
                        })
                        .background(Color.red)
                        .cornerRadius(20)
                            // decrease score for blue
                        Button(action: {if scores.scores.blueScore != 0 {scores.scores.blueScore -= 1}}, label: {
                            Text("-")
                                .font(.system(size: 23))
                        })
                        .background(Color.blue)
                        .cornerRadius(20)
                        // increase score for blue
                        Button(action: {if scores.scores.blueScore != 121 {scores.scores.blueScore += 1}}, label: {
                            Text("+")
                                .font(.system(size: 23))
                        })
                        .background(Color.blue)
                        .cornerRadius(20)
                    }
                    // display scores
                    HStack {
                        Text("\(scores.scores.blueScore)")
                            .offset(x:54, y: 0)
                        Text("\(scores.scores.redScore)")
                            .offset(x:-54, y: 0)
                    }
                
                }
            }
        }
// I want to build a winner screen and a separate screen for reset so that it's not accidentally tapped. perhaps reset can be on a different page. I could also create a screen to select a 61 point game or a 121 point game.
        
}
 
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
    
// if blue wins
struct BlueWinsView: View{
    @ObservedObject var scores = Counters.shared
    var body: some View {
        VStack {
        Text("Blue Wins!")
            .foregroundColor(.blue)
            Text("\(scores.scores.blueScore)")
        Button(action:{scores.scores.blueScore = 0; scores.scores.redScore = 0;}, label: {Text("Reset")
        })
        .background(Color.gray)
        .cornerRadius(10)
        }
    }
}
    
// Reset confirmation view for ContentView screen
struct ResetView: View {
    var body: some View {
        Text("Are you sure you want to reset?")
    }
}

//struct SixtyOnePointView: View {
//    var body: some View {
//        Text("61 point view")
//    }
//}
    
    

    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
