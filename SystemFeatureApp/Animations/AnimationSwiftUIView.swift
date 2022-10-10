//
//  AnimationSwiftUIView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/9/22.
//

import SwiftUI

struct AnimationSwiftUIView: View {
    @State private var animated = false
    @State private var animationType: AnimationType = .default
    @State private var scale = 1.0
    @Namespace private var namespace
    
    var animationTypePickerView: some View {
        Picker(selection: $animationType) {
            ForEach(AnimationType.allCases) { type in
                Text(type.rawValue)
                    .tag(type)
            }
        } label: {
            Text("Pick animation type")
        }
        .pickerStyle(.segmented)
    }
    
    var objectView: some View {
        Rectangle()
            .frame(width: 50, height: 50)
            .cornerRadius(12)
            .foregroundStyle(
                .linearGradient(colors: [.yellow, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .padding()
            .scaleEffect(scale)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                        .frame(maxWidth: animated ? .infinity : 0)
                    objectView
                }
                .onChange(of: animationType) { _ in
                    withAnimation(self.animationType.animation) {
                        animated.toggle()
                    }
                }
                
                ScrollView {
                    animationTypePickerView
                }
                .padding()
            }
        }
    }
}

extension AnimationSwiftUIView {
    enum AnimationType: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        
        case `default`, spring, linear, inOut
        
        var animation: Animation {
            var animation: Animation
            
            switch self {
            case .default:
                animation = Animation.default
            case .spring:
                animation = Animation.spring()
            case .linear:
                animation = Animation.linear
            case .inOut:
                animation = Animation.easeInOut
            }
            
            return animation.speed(0.3).repeatForever(autoreverses: true)
        }
    }
}

struct AnimationSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationSwiftUIView()
    }
}
