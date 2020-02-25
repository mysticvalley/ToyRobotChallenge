@testable import ToyRobotChallenge
import XCTest

class ToyRobotChallengeTests: XCTestCase {
    let robot = Robot()

    func testRobotFacingNorth() {
        let expectedOutput = "2 3 NORTH"
        let robot = Robot()
        robot.setPosition(xPoint: 0,
                          yPoint: 2,
                          direction: .north)

        robot.processRobotCommand(command: "LMMLMLMMLMM")
        XCTAssertEqual(expectedOutput, robot.convertRobotPositionToString())
    }

    func testRobotFacingEast() {
        let expectedOutput = "4 0 EAST"
        robot.setPosition(xPoint: 2,
                          yPoint: 1,
                          direction: .east)

        robot.processRobotCommand(command: "MMRMMRMRRM")

        let robotCurrentPosition = robot.currentPosition()
        print(robotCurrentPosition)
        XCTAssertEqual(expectedOutput, robot.convertRobotPositionToString())
    }

    func testRobotFacingWest() {
        let expectedOutput = "1 4 WEST"
        robot.setPosition(xPoint: 1,
                          yPoint: 4,
                          direction: .south)

        robot.processRobotCommand(command: "LMLMLMLMR")
        let robotCurrentPosition = robot.currentPosition()
        print(robotCurrentPosition)
        XCTAssertEqual(expectedOutput, robot.convertRobotPositionToString())
    }

    func testRobotFacingSouth() {
        let expectedOutput = "5 5 SOUTH"
        robot.setPosition(xPoint: 5,
                          yPoint: 4,
                          direction: .east)

        robot.processRobotCommand(command: "LMLMLMLMLMMMRMR")
        let robotCurrentPosition = robot.currentPosition()
        print(robotCurrentPosition)
        XCTAssertEqual(expectedOutput, robot.convertRobotPositionToString())
    }

    func testRobotAvoidFallingFromTable() {
        let expectedOutput = "4 1 EAST"
        robot.setPosition(xPoint: 0,
                          yPoint: 0, direction: .north)
        robot.processRobotCommand(command: "LMMLMLMMLMRMM")
        XCTAssertEqual(expectedOutput, robot.convertRobotPositionToString())
    }
}
