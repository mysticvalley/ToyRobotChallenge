import Foundation

public enum Direction: Int {
    case north = 1,
        east,
        south,
        west
}

struct RobotPosition {
    let xValue: Int64
    let yValue: Int64

    // direction is a direction of Robot for example (North, South, East, West).
    let direction: Direction

    init(xValue: Int64, yValue: Int64, direction: Direction) {
        self.xValue = xValue
        self.yValue = yValue
        self.direction = direction
    }
}

final class Robot {
    // MARK: - Private Variables

    var xPoint: Int64 = 0
    var yPoint: Int64 = 0
    private(set) lazy var direction: Direction = {
        .north
    }()

    // MARK: - Public Functions

    /*
     * setPosition is to set X, Y and direction of the Robot.
     * @param xPoint, yPoint, direction.
     */
    public func setPosition(xPoint: Int64, yPoint: Int64, direction: Direction) {
        self.xPoint = xPoint
        self.yPoint = yPoint
        self.direction = direction
    }

    /*
     * currentPosition will return currentPosition of the Robot.
     * returns RobotPosition which is struct.
     */
    @discardableResult public func currentPosition() -> RobotPosition {
        return RobotPosition(xValue: xPoint, yValue: yPoint, direction: direction)
    }

    // MARK: - Private Functions

    // turnLeftCommand command will allow robot to left from it's current position.
    func turnLeftCommand() {
        if (direction.rawValue - 1) < Direction.north.rawValue {
            direction = .west
        } else {
            guard let rawValueFacing = Direction(rawValue: direction.rawValue - 1) else { return }
            direction = rawValueFacing
        }
    }

    // turnRightCommand command will allow robot to right from it's current position.
    func turnRightCommand() {
        if (direction.rawValue + 1) > Direction.west.rawValue {
            direction = .north
        } else {
            guard let rawValueFacing = Direction(rawValue: direction.rawValue + 1) else { return }
            direction = rawValueFacing
        }
    }
}
