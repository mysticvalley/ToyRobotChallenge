import Foundation

struct Constants {
    struct RobotInputs {
        static let allowedRegx = "01234"
    }
    static let maxTableSize = 5
}

enum RobotError: Error {
    case invalidCommand
    case invalidRange
}
