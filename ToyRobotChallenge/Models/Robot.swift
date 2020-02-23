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
    
    // MARK:- Private Variables
    private var xPoint: Int64 = 0
    private var yPoint: Int64 = 0
    private lazy var direction: Direction = {
        return .north
    }()
    
    // MARK:- Public Functions
    
    /*
     * setPosition is to set X, Y and direction of the Robot.
     * @param xPoint, yPoint, direction.
     */
    public func setPosition(xPoint:Int64, yPoint:Int64, direction:Direction){
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
    
    /*
     * processRobotCommand will return currentPosition of the Robot.
     * @param command which is an string for example "LMLMLMLMM"
     */
    public func processRobotCommand(command:String) {
        _ = command.map { processCommand(char: $0) }
    }
    
    // MARK:- Private Functions
    
    /*
     * processCommand will take each character(L, R, M) and performs Left, Right, Move.
     * @param char which is an character for example "L"
     */
    private func processCommand(char: Character) {
        switch char {
        case "L": turnLeftCommand()
        case "R": turnRightCommand()
        case "M": moveCommand()
        default:  print(RobotError.invalidCommand)
            
        }
    }
    
    // turnLeftCommand command will allow robot to left from it's current position.
    private func turnLeftCommand(){
        if (direction.rawValue - 1) < Direction.north.rawValue {
            direction = .west
        } else {
            guard let rawValueFacing = Direction(rawValue: direction.rawValue - 1) else { return }
            direction = rawValueFacing
        }
    }
    
    // turnRightCommand command will allow robot to right from it's current position.
    private func turnRightCommand(){
        if (direction.rawValue + 1) > Direction.west.rawValue {
            direction = .north
        } else {
            guard let rawValueFacing = Direction(rawValue: direction.rawValue + 1) else { return }
            direction = rawValueFacing
        }
    }
    
    // moveCommand will allow robot to move by 1 unit.
    private func moveCommand() {
        
        // Checks for maximum table bound before making move
        if (direction == .north && yPoint != Constants.maxTableSize && yPoint >= 0) {
            yPoint = yPoint + 1
        } else if (direction == .east && xPoint != Constants.maxTableSize && xPoint >= 0) {
            xPoint = xPoint + 1
        } else if (direction == .south && yPoint != 0 && yPoint >= 0) {
            yPoint = yPoint - 1
        } else if (direction == .west && xPoint != 0 && xPoint >= 0) {
            xPoint = xPoint - 1
        } else {
            // Ignore the command if command will move toy out of table
            print(RobotError.invalidRange)
        }
    }
    
    func convertRobotPositionToString() -> String {
        let facing: String
        
        switch currentPosition().direction {
        case .north:
            facing = "NORTH"
        case .east:
            facing = "EAST"
        case .west:
            facing = "WEST"
        case .south:
            facing = "SOUTH"
        }
        
        return String(format: "%@ %@ %@", arguments: [currentPosition().xValue.description,
                                                                     currentPosition().yValue.description,
                                                                     facing])
    }
}
