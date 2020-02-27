import Foundation

final class RobotViewModel: NSObject {
    private var robot: Robot
    private var board: Board

    var allowedRegx: String {
        return board.allowedRegx
    }

    var robotCurrentPosition: RobotPosition {
        return robot.currentPosition()
    }

    init(with robot: Robot, board: Board) {
        self.robot = robot
        self.board = board
        super.init()
    }

    convenience override init() {
        self.init(with: Robot(), board: Board(with: 5))
    }

    func setRobotPosition(xValue: Int64, yValue: Int64, direction: Direction) {
        robot.setPosition(
            xPoint: xValue,
            yPoint: yValue,
            direction: direction
        )
    }

    /*
     * processRobotCommand will return currentPosition of the Robot.
     * @param command which is an string for example "LMLMLMLMM"
     */

    public func processRobotCommand(command: String) {
        _ = command.map { processCommand(char: $0) }
    }

    // moveCommand will allow robot to move by 1 unit.

    private func moveCommand() {
        // Checks for maximum table bound before making move
        if robot.direction == .north, robot.yPoint != board.size, robot.yPoint >= 0 {
            robot.yPoint = robot.yPoint + 1
        } else if robot.direction == .east, robot.xPoint != board.size, robot.xPoint >= 0 {
            robot.xPoint = robot.xPoint + 1
        } else if robot.direction == .south, robot.yPoint != 0, robot.yPoint >= 0 {
            robot.yPoint = robot.yPoint - 1
        } else if robot.direction == .west, robot.xPoint != 0, robot.xPoint >= 0 {
            robot.xPoint = robot.xPoint - 1
        }
    }

    /*
     * processCommand will take each character(L, R, M) and performs Left, Right, Move.
     * @param char which is an character for example "L"
     */

    private func processCommand(char: Character) {
        switch char {
        case "L": robot.turnLeftCommand()
        case "R": robot.turnRightCommand()
        case "M": moveCommand()
        default: print(RobotError.invalidCommand)
        }
    }

    func convertRobotPositionToString() -> String {
        let facing: String

        switch robot.currentPosition().direction {
        case .north:
            facing = "NORTH"
        case .east:
            facing = "EAST"
        case .west:
            facing = "WEST"
        case .south:
            facing = "SOUTH"
        }

        return String(format: "%@ %@ %@", arguments: [robot.currentPosition().xValue.description,
                                                      robot.currentPosition().yValue.description,
                                                      facing])
    }
}
