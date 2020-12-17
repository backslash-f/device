import SwiftUI

/// Stores the operating system version.
public struct OSVersion {

    /// And example would be "Version 10.15.3 (Build 19D76)".
    public let description: String

    /// In a "10.15.3", this would be `10`.
    public let major: Int

    /// In a "10.15.3", this would be `15`.
    public let minor: Int

    /// In a "10.15.3", this would be `3`.
    public let patch: Int
}

public extension Device {

    /// Returns the operating system version (`OSVersion`) based on `-[NSProcessInfo operatingSystemVersionString]` and
    /// `-[NSProcessInfo operatingSystemVersion]`.
    func os() -> OSVersion {
        let process = ProcessInfo()
        let osVersion = OSVersion(
            description: process.operatingSystemVersionString,
            major: process.operatingSystemVersion.majorVersion,
            minor: process.operatingSystemVersion.minorVersion,
            patch: process.operatingSystemVersion.patchVersion
        )
        log(information: "Device version: \(osVersion)", category: .os)
        return osVersion
    }
}
