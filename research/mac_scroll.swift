import Cocoa

guard CommandLine.arguments.count == 4,
      let x = Double(CommandLine.arguments[1]),
      let y = Double(CommandLine.arguments[2]),
      let amount = Int32(CommandLine.arguments[3]) else {
    fputs("Usage: mac_scroll <x> <y> <pixels>\n", stderr)
    exit(2)
}

CGWarpMouseCursorPosition(CGPoint(x: x, y: y))
let source = CGEventSource(stateID: .hidSystemState)
CGEvent(scrollWheelEvent2Source: source,
        units: .pixel,
        wheelCount: 1,
        wheel1: amount,
        wheel2: 0,
        wheel3: 0)?.post(tap: .cghidEventTap)
