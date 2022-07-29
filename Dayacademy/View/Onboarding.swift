//
//  Onboarding.swift
//  Dayacademy
//
//  Created by Rido Hendrawan on 29/07/22.
//

import SwiftUI

struct OnBoardingStep {
    let image: String
    let title: String
}

private let onBoardingSteps = [
    OnBoardingStep(image: "onboardingImage1", title: "Have all the list of your academy Schedule and Event!"),
    OnBoardingStep(image: "onboardingImage2", title: "Live Track with your schedule at present time!"),
    OnBoardingStep(image:"onboardingImage3", title: "No worries of missing schedule. We always remind you!")
]

struct Onboarding: View {
    @State private var currentStep = 0
    
    init(){
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        VStack{
            
//            HStack{
//                Spacer()
//                Button(action: {
//                    self.currentStep = onBoardingSteps.count - 1
//                }){
//                    Text("Skip")
//                        .padding(16)
//                        .foregroundColor(.gray)
//                }
//            }
            
            TabView(selection: $currentStep){
                ForEach(0..<onBoardingSteps.count) { it in
                
                VStack{
                    Image(onBoardingSteps[it].image)
                        .resizable()
                        .frame(width: 280, height: 380)
                    
                    Text(onBoardingSteps[it].title)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(15)
                        .padding(.top, 16)
                }
                .tag(it)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack{
                ForEach(0..<onBoardingSteps.count) { it in
                    
                    if it == currentStep {
                        Rectangle()
                            .frame(width: 20, height: 10)
                            .cornerRadius(10)
                            .foregroundColor(.blue)
                    } else {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.bottom,25)
            
            Button(action: {
                if self.currentStep < onBoardingSteps.count - 1 {
                    self.currentStep += 1
                } else {
                    ContentView()
                }
            }) {
                Text(currentStep < onBoardingSteps.count - 1 ? "Next" : "Get Started")
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(50)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 50)
                    .foregroundColor(.white)
                    
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
