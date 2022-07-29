//
//  SplashScreen.swift
//  Dayacademy
//
//  Created by Rido Hendrawan on 29/07/22.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive{
            Onboarding()
        } else {
            VStack{
                VStack{
                    Image("appLogo")
                        .font(.system(size:80))
                        .foregroundColor(.red)
                    Text("DAYACADEMY")
                        .font(.system(size:26).bold())
                        .foregroundColor(.black.opacity(0.80))
                    
                    Text("Remind you of all your academy schedule")
                        .font(.system(size:16))
                        .frame(width: 250, height: 40)
                        .multilineTextAlignment(.center)
                        
                        
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
