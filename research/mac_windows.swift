import Foundation
import CoreGraphics

guard CommandLine.arguments.count == 2,
      let targetPID = Int(CommandLine.arguments[1]) else {
    fputs("Usage: swift mac_windows.swift <PID>\n", stderr)
    exit(2)
}

let windows = CGWindowListCopyWindowInfo(
    [.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID
) as? [[String: Any]] ?? []

var rows: [(id: Int, area: Int, width: Int, height: Int, layer: Int, name: String)] = []
for window in windows {
    guard let ownerPID = window[kCGWindowOwnerPID as String] as? Int,
          ownerPID == targetPID,
          let windowID = window[kCGWindowNumber as String] as? Int else { continue }
    let bounds = window[kCGWindowBounds as String] as? [String: Any] ?? [:]
    let width = (bounds["Width"] as? NSNumber)?.intValue ?? 0
    let height = (bounds["Height"] as? NSNumber)?.intValue ?? 0
    guard width > 40, height > 40 else { continue }
    let layer = window[kCGWindowLayer as String] as? Int ?? 0
    let name = window[kCGWindowName as String] as? String ?? ""
    rows.append((windowID, width * height, width, height, layer, name))
}
for row in rows.sorted(by: { $0.area > $1.area }) {
    print("\(row.id)\t\(row.width)x\(row.height)\t(layer \(row.layer))\t\(row.name)")
}
