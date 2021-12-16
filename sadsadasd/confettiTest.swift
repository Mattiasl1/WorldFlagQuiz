//
//  confettiTest.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-12-06.
//

import SwiftUI

struct Movement{
    var x: CGFloat
    var y: CGFloat
    var z: CGFloat
    var opacity: Double
}

struct confettiTest: View {
    @State var animate = [false]
    @State var finishedAnimationCouter = 0
    @State var counter = 0
    
    var body: some View {
        VStack{
            ZStack{
                ForEach(finishedAnimationCouter...counter, id:\.self){ i in
                    ConfettiContainer(animate:$animate[i], finishedAnimationCouter:$finishedAnimationCouter, num:1)
                }
            }
            
            Button("Confetti"){
                animate[counter].toggle()
                animate.append(false)
                counter+=1
            }
        }
    }
}

struct ConfettiContainer: View {
    @Binding var animate:Bool
    @Binding var finishedAnimationCouter:Int

    var num:Int
    
    var body: some View{
        ZStack{
            ForEach(0...num-1, id:\.self){ _ in
                Confetti(animate: $animate, finishedAnimationCouter:$finishedAnimationCouter)
            }
        }
        .onChange(of: animate){_ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                finishedAnimationCouter+=1
            }
        }
    }
}

struct Confetti: View{
    @Binding var animate:Bool
    @Binding var finishedAnimationCouter:Int
    @State var movement = Movement(x: 0, y: 0, z: 1, opacity: 0)
    

    var body: some View{
        Text("+25")
            .font(.system(size: 50))
            .foregroundColor(.white)
            .frame(width: 50, height: 50, alignment: .center)
            .offset(x: movement.x, y: movement.y)
            .scaleEffect(movement.z)
            .opacity(movement.opacity)
            .onChange(of: animate) { _ in
                withAnimation(Animation.easeOut(duration: 0.4)) {
                    movement.opacity = 1
                    movement.x = CGFloat.random(in: -150...150)
                    movement.y = -300 * CGFloat.random(in: 0.7...1)
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    withAnimation(Animation.easeIn(duration: 3)) {
                        movement.y = 200
                        movement.opacity = 0.0
                    }
                }
        }
    }
}

struct confettiTest_Previews: PreviewProvider {
    static var previews: some View {
        confettiTest()
    }
}
