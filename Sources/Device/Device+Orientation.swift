import SwiftUI

public extension Device {

    // MARK: - Orientation Changes Notification

    #if os(iOS) || targetEnvironment(macCatalyst)
    func listenToOrientationChangeNotifications() {
        NotificationCenter.default
            .publisher(for: UIDevice.orientationDidChangeNotification)
            .handleEvents(receiveOutput: { [weak self] in self?.log(notification: $0) })
            .receive(on: DispatchQueue.main)
            .compactMap({ ($0.object as? UIDevice)?.orientation })
            .assign(to: \.orientation, on: self)
            .store(in: &cancellableNotifications)
    }
    #endif
}
