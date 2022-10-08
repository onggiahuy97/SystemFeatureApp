import Foundation
import SwiftUI

let sfSymbolsSectionOutline: SectionOutline = {
    let view = AnyView(SFSymbolsView())
    var outline = Outline(title: "SF Symbols", outlineType: .outlineView(view))
    let section = SectionOutline(title: "SF Symbols", outlines: [outline])
    return section
}()

class SFSymbolsViewModel {
    static let SFSymbols: [SFSymbol] = {
        var sfSymbols = [SFSymbol]()
        
        for type in SFType.allCases {
            if let path = Bundle.main.path(forResource: type.forResource, ofType: "txt") {
                if let data = try? String(contentsOfFile: path, encoding: .utf8) {
                    let s = data.split(whereSeparator: \.isNewline).map { String($0) }
                    sfSymbols.append(.init(type: type, symbols: s))
                }
            }
        }
        
        return sfSymbols
    }()
    
    struct SFSymbol {
        let type: SFType
        let symbols: [String]
    }
}

extension SFSymbolsViewModel {
    enum SFType: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        
        case whatNew, multiColor, variables, communication, whether, objects, devices, cameraPhoto
        
        var forResource: String {
            switch self {
            case .whatNew:
                return "SFWhatNew"
            case .multiColor:
                return "SFMultiColors"
            case .variables:
                return "SFVariables"
            case .communication:
                return "SFCommunication"
            case .whether:
                return "SFWhether"
            case .objects:
                return "SFObjects"
            case .devices:
                return "SFDevices"
            case .cameraPhoto:
                return "SFCameraPhoto"
            }
        }
        
        var typeSystemImage: String {
            switch self {
            case .whatNew:
                return "star"
            case .multiColor:
                return "paintpalette"
            case .variables:
                return "slider.horizontal.below.square.and.square.filled"
            case .communication:
                return "bubble.left"
            case .whether:
                return "cloud.sun"
            case .objects:
                return "folder"
            case .devices:
                return "iphone.rear.camera"
            case .cameraPhoto:
                return "camera"
            }
        }
    }
}
