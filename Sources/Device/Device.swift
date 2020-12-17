import SwiftUI
import Combine

/// Retrieves information about a host device.
public class Device {

    // MARK: - Properties

    #if os(iOS) || targetEnvironment(macCatalyst)
    /// Subscribe to this variable to keep track of the orientation changes of the device.
    @Published public var orientation: UIDeviceOrientation = UIDevice.current.orientation
    #endif

    // MARK: Internal Properties

    /// Enables / disables logging output to both *Xcode's Console* and the macOS *Console app*. `true` by default.
    internal var isLoggingEnabled: Bool = true

    internal var cancellableNotifications = Set<AnyCancellable>()

    // MARK: - Lifecycle

    public init() {
        #if os(iOS) || targetEnvironment(macCatalyst)
        listenToOrientationChangeNotifications()
        #endif
    }
}
