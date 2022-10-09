import Foundation
import SwiftUI

let sfSymbolsSectionOutline: SectionOutline = {
    let view = AnyView(SFSymbolsView())
    var outline = Outline(title: "SF Symbols", outlineType: .outlineView(view))
    outline.systemImage = "star"
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
        
        var allString = [String]()
        sfSymbols.forEach { symbol in
            symbol.symbols.forEach { str in
                allString.append(str)
            }
        }
        
        let all = SFSymbol(type: .all, symbols: allString)
        sfSymbols.insert(all, at: 0)
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
        
        case all
        case whatNew, multiColor, variables, communication, whether, objects, devices, cameraPhoto
        case gaming, connectivity, transportation, accessibility, privacy, human, home, fitness, nature
        case editing, textFormat, media, keyboard, commerce, time, heath, shapes, arrows, indices, math
        
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
            case .gaming:
                return "SFGaming"
            case .connectivity:
                return "SFConnectivity"
            case .transportation:
                return "SFTransportation"
            case .accessibility:
                return "SFAccessibility"
            case .privacy:
                return "SFPrivacy & Security"
            case .human:
                return "SFHuman"
            case .home:
                return "SFHome"
            case .fitness:
                return "SFFitness"
            case .nature:
                return "SF Nature"
            case .editing:
                return "SFEditing"
            case .textFormat:
                return "SFTextFormatting"
            case .media:
                return "SFMedia"
            case .keyboard:
                return "SFKeyboards"
            case .commerce:
                return "SFCommerce"
            case .time:
                return "SFTime"
            case .heath:
                return "SFHealth"
            case .shapes:
                return "SFShapes"
            case .arrows:
                return "SFArrows"
            case .indices:
                return "SFIndices"
            case .math:
                return "SFMath"
            case .all:
                return "SFAll"
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
            case .gaming:
                return "gamecontroller"
            case .connectivity:
                return "antenna.radiowaves.left.and.right"
            case .transportation:
                return "car"
            case .accessibility:
                return "person.crop.circle"
            case .privacy:
                return "lock.circle"
            case .human:
                return "person"
            case .home:
                return "house"
            case .fitness:
                return "figure.walk"
            case .nature:
                return "leaf"
            case .editing:
                return "slider.horizontal.3"
            case .textFormat:
                return "textformat"
            case .media:
                return "play.circle"
            case .keyboard:
                return "keyboard"
            case .commerce:
                return "cart"
            case .time:
                return "clock"
            case .heath:
                return "heart"
            case .shapes:
                return "app"
            case .arrows:
                return "arrow.right"
            case .indices:
                return "a.circle"
            case .math:
                return "x.squareroot"
            case .all:
                return "square.stack"
            }
        }
    }
}
