@testable import ToyRobotChallenge
import XCTest

class RobotViewModelTests: XCTestCase {
    var viewModel: RobotViewModel!

    override func setUp() {
        viewModel = RobotViewModel()
    }

    func testRobotFacingNorth() {
        let expectedOutput = "2 3 NORTH"
        viewModel.setRobotPosition(xValue: 0,
                                   yValue: 2,
                                   direction: .north)

        viewModel.processRobotCommand(command: "LMMLMLMMLMM")
        XCTAssertEqual(expectedOutput, viewModel.convertRobotPositionToString())
    }

    func testRobotFacingEast() {
        let expectedOutput = "4 0 EAST"
        viewModel.setRobotPosition(xValue: 2,
                                   yValue: 1,
                                   direction: .east)

        viewModel.processRobotCommand(command: "MMRMMRMRRM")

        let robotCurrentPosition = viewModel.robotCurrentPosition
        print(robotCurrentPosition)
        XCTAssertEqual(expectedOutput, viewModel.convertRobotPositionToString())
    }

    func testRobotFacingWest() {
        let expectedOutput = "1 4 WEST"
        viewModel.setRobotPosition(xValue: 1,
                                   yValue: 4,
                                   direction: .south)

        viewModel.processRobotCommand(command: "LMLMLMLMR")
        let robotCurrentPosition = viewModel.robotCurrentPosition
        print(robotCurrentPosition)
        XCTAssertEqual(expectedOutput, viewModel.convertRobotPositionToString())
    }

    func testRobotFacingSouth() {
        let expectedOutput = "5 5 SOUTH"
        viewModel.setRobotPosition(xValue: 5,
                                   yValue: 4,
                                   direction: .east)

        viewModel.processRobotCommand(command: "LMLMLMLMLMMMRMR")
        let robotCurrentPosition = viewModel.robotCurrentPosition
        print(robotCurrentPosition)
        XCTAssertEqual(expectedOutput, viewModel.convertRobotPositionToString())
    }

    func testRobotAvoidFallingFromTable() {
        let expectedOutput = "4 1 EAST"
        viewModel.setRobotPosition(xValue: 0,
                                   yValue: 0, direction: .north)
        viewModel.processRobotCommand(command: "LMMLMLMMLMRMM")
        XCTAssertEqual(expectedOutput, viewModel.convertRobotPositionToString())
    }
}
