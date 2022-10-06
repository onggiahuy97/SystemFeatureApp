//
//  Feature.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/2/22.
//

import SwiftUI

struct HelloWorld: View {
    var body: some View {
        Text("Hello World")
    }
}

struct Outline: Identifiable {
    var id: String { title }
    var title: String
    var systemImage: String?
    var foregroundColor: String?
    var hashtags: [String]?
    var outlineType: OutlineType
    
    enum OutlineType {
        case outlineView(AnyView)
        case subOutlines([Outline])
    }
}

extension Outline {
    static var examples: [Outline] {
        [
            .init(title: "Sample1", outlineType: .outlineView(AnyView(HelloWorld.init()))),
            .init(title: "Sample2", outlineType: .subOutlines([
                .init(title: "Sample3", outlineType: .outlineView(AnyView(HelloWorld.init()))),
                .init(title: "Sample4", outlineType: .subOutlines([
                    .init(title: "Sample5", outlineType: .outlineView(AnyView(HelloWorld.init())))
                ]))
            ])),
            .init(title: "Sample6", outlineType: .outlineView(AnyView(HelloWorld.init()))),
            .init(title: "Sample7", outlineType: .subOutlines([
                .init(title: "Sample8", outlineType: .outlineView(AnyView(HelloWorld.init()))),
                .init(title: "Sample9", outlineType: .subOutlines([
                    .init(title: "Sample10", outlineType: .outlineView(AnyView(HelloWorld.init())))
                ]))
            ]))
        ]
    }
}
