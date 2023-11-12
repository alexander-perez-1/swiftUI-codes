//
//  GuessTheNumber.swift
//  midtermExam
//
//  Created by Alexander Perez on 2023/11/8.
//

import SwiftUI

struct GuessTheNumber: View {
    
    @State var failedCount = 0
    @State var target = Int.random(in: 0...9)
    @State var guessedInt : Int?
    @State var isCorrect = false
    @State var isLow = false
    @State var isHigh = false
    
    
    var body: some View {
        VStack{
            HeaderView()
            TextField("Guess...", value: $guessedInt, format: .number)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300, height: 200)
            Button{
                checkGuess()
                
            } label: {
                Text("Confirm")
                    .frame(width: 120, height: 50)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                    .background(.gray)
                    .cornerRadius(10)
            }
            //Text("The num in my head was: \(target)")
            
            if isCorrect == true {
                Text("Correct (fails == \(failedCount))")
                    .font(.system(size: 20))
                    .foregroundStyle(.red)
                Button{
                    restartGuess()
                } label: {
                    Text("Restart")
                        .frame(width: 120, height: 50)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
            } else if isLow == true {
                Text("Too small (fails == \(failedCount))")
                    .font(.system(size: 20))
                    .foregroundStyle(.red)
            } else if isHigh == true {
                Text("Too high (fails == \(failedCount))")
                    .font(.system(size: 20))
                    .foregroundStyle(.red)
            }

            if failedCount > 4 {
                Button{
                    restartGuess()
                } label: {
                    Text("Restart")
                        .frame(width: 120, height: 50)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
            
        }
    }
    
    func restartGuess(){
        target = Int.random(in: 0...9)
        guessedInt = nil
        isCorrect = false
        isHigh = false
        isLow = false
        failedCount = 0
    }
    func checkGuess(){
        if let guessedCorrect = guessedInt {
            if guessedCorrect == target{
                isCorrect = true
                isHigh = false
                isLow = false
            } else if guessedCorrect < target {
                isLow = true
                isHigh = false
                isCorrect = false
                failedCount += 1
            } else if guessedCorrect > target {
                isHigh = true
                isLow = false
                isCorrect = false
                failedCount += 1
            }
        }
    }
    
}

#Preview {
    GuessTheNumber()
}

struct HeaderView : View {
    var body: some View {
        VStack{
           Text("Guess the Number")
                .font(.system(size: 40, weight: .medium))
            Text("My ID: 410921323")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.blue)
                .padding(3)
        }
    }
}

struct showGuess : View {
    
    var body: some View {
        Text("")
    }
}
