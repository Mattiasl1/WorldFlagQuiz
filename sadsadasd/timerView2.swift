//
//  timerView2.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-17.
//

import SwiftUI

struct timerView2: View {
    var body: some View {
        ZStack{
            VStack{
                Circle()
                    .fill(Color.clear)
                    .frame(width: 100, height: 100)
                    .overlay(
                        Circle().stroke(Color.blue, lineWidth: 10)
                )
                 
                Circle()
                    .fill(Color.clear)
                    .frame(width: 100, height: 100)
                    .overlay(
                        Circle().trim(from:0, to: progress())
                            .stroke(
                                style: StrokeStyle(
                                    lineWidth: 15,
                                    lineCap: .round,
                                    lineJoin:.round
                                )
                            )
                            .foregroundColor(
                                (completed() ? Color.orange : Color.red)
                            ).animation(
                                .easeInOut(duration: 0.2)
                            )
                    )
            }
        }
    }
}

struct timerView2_Previews: PreviewProvider {
    static var previews: some View {
        timerView2()
    }
}
