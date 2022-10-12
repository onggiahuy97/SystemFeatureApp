//
//  AnimationSwiftUIView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/9/22.
//

import SwiftUI

struct AnimationSwiftUIView: View {
    @State private var activeAnimation = false
    
    var objectView: some View {
        Rectangle()
            .frame(width: 50, height: 50)
            .cornerRadius(12)
            .foregroundStyle(
                .linearGradient(colors: [.yellow, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .padding()
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(AnimationSwiftUIView.AnimationType.allCases) { animation in
                            Text(animation.rawValue).bold()
                            objectView
                                .offset(x: activeAnimation ? proxy.size.width - 100 : 0)
                                .animation(animation.animation, value: activeAnimation)
                            Divider()
                        }
                    }
                    .padding()
                    .onAppear {
                        activeAnimation = true
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("Animations")
        }
    }
}

extension AnimationSwiftUIView {
    enum AnimationType: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        
        case `default`, inOut, linear, spring
        
        var animation: Animation {
            var animation: Animation
            
            switch self {
            case .default:
                animation = Animation.default
            case .linear:
                animation = Animation.linear
            case .inOut:
                animation = Animation.easeInOut
            case .spring:
                animation = Animation.spring()
            }
            
            return animation.speed(0.65).repeatForever(autoreverses: true)
        }
    }
}

struct AnimationSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationSwiftUIView()
    }
}
