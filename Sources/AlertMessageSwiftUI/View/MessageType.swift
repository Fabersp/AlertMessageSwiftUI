//  MessageUIKit
//
//  Created by Fabricio Padua on 1/7/25.

import SwiftUI

/// Enum para os tipos de mensagens suportadas
public enum MessageType {
    case errorServer
    case noInternet
    case cameraPermission
    case notificationPermission
    case microphonePermission
    case askQuestion
    case completetion
    case qrCode
    case custom(image: String, title: String, description: String)
    
    /// Obtém a imagem associada ao tipo
    func image() -> String {
        switch self {
        case .errorServer: return "errorServer"
        case .noInternet: return "noInternet"
        case .cameraPermission: return "cameraPermission"
        case .notificationPermission: return "notificationPermission"
        case .microphonePermission: return "microphonePermission"
        case .askQuestion: return "askQuestion"
        case .completetion: return "completetion"
        case .qrCode: return "qrCode"
        case .custom(let image, _, _): return image
        }
    }
    
    /// Obtém o título associado ao tipo
    func title() -> String {
        switch self {
        case .errorServer: return "Opss..."
        case .noInternet: return "No Internet Connection"
        case .cameraPermission: return "Camera"
        case .notificationPermission: return "Notification"
        case .microphonePermission: return "Microphone"
        case .askQuestion: return "Do you want continue"
        case .completetion: return "Well done"
        case .qrCode: return "Camera time"
        case .custom(_, let title, _): return title
        }
    }
    
    /// Obtém a descrição associada ao tipo
    func description() -> String {
        switch self {
        case .errorServer: return "Something went wrong. Please try again later."
        case .noInternet: return "Please check your internet connection and reopen the app."
        case .cameraPermission: return "Please allow camera access."
        case .notificationPermission: return "Please allow notifications."
        case .microphonePermission: return "Please allow microphone access."
        case .askQuestion: return "This for questions."
        case .completetion: return "your requestion is done!"
        case .qrCode: return "Give us access to the camera, so we can scan QR-code."
        case .custom(_, _, let description): return description
        }
    }
}
