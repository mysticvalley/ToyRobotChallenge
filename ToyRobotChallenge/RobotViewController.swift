import UIKit

final class RobotViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet private var textFieldXValue: UITextField!
    @IBOutlet private var textFieldYValue: UITextField!
    @IBOutlet private var segmentControlDirection: UISegmentedControl!
    @IBOutlet private var textFieldCommand: UITextField!
    @IBOutlet private var buttonLeft: UIButton!
    @IBOutlet private var buttonRight: UIButton!
    @IBOutlet private var buttonMove: UIButton!
    @IBOutlet private var buttonReport: UIButton!
    @IBOutlet private var buttonReset: UIButton!

    // MARK: - Private Variables

    private var viewModel = RobotViewModel()
    private var commandText = ""

    // MARK: - View Controller life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // Setup view and basic routine.
    private func setupView() {
        textFieldXValue.becomeFirstResponder()
        textFieldXValue.delegate = self
        textFieldYValue.delegate = self
        setupHideKeyboardOnTap()
    }

    // MARK: - Private Functions

    // Reset robot's input fields such as X, Y, Direction and Command.
    private func resetRobot() {
        textFieldCommand.text = ""
        commandText = ""
        segmentControlDirection.selectedSegmentIndex = 0
        textFieldXValue.text = ""
        textFieldYValue.text = ""
    }

    // shows alert to get the Robot location.
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
            self?.resetRobot()
        })

        alert.addAction(okButton)

        present(alert, animated: true, completion: nil)
    }

    // MARK: - Button actions

    // Done button action which shows Robot's current location for example (1 3 N)
    @IBAction func reportButtonAction(_: Any) {
        guard let xValue = textFieldXValue.text,
            let yValue = textFieldYValue.text,
            let rawValueDirection = Direction(rawValue: segmentControlDirection.selectedSegmentIndex + 1),
            let command = textFieldCommand?.text else { return }

        viewModel.setRobotPosition(
            xValue: Int64(xValue) ?? 0,
            yValue: Int64(yValue) ?? 0,
            direction: rawValueDirection
        )
        viewModel.processRobotCommand(command: command)

        showAlert(title: "Output:",
                  message: viewModel.convertRobotPositionToString())
    }

    // Left button action which performed move command for the Robot.
    @IBAction func leftButtonAction(_: Any) {
        commandText.append("L")
        textFieldCommand.text = commandText
    }

    // Right button action which performed move command for the Robot.
    @IBAction func rightButtonAction(_: Any) {
        commandText.append("R")
        textFieldCommand.text = commandText
    }

    // Move button action which performed move command for the Robot.
    @IBAction func moveButtonAction(_: Any) {
        commandText.append("M")
        textFieldCommand.text = commandText
    }

    // Reset button action which clears robot's input fields such as X, Y, Direction and Command.
    @IBAction func resetButtonAction(_: Any?) {
        resetRobot()
    }
}

extension RobotViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn _: NSRange,
                   replacementString string: String) -> Bool {
        let allowedCharSet = NSCharacterSet(charactersIn: viewModel.allowedRegx).inverted
        let compSepByCharInSet = string.components(separatedBy: allowedCharSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        if string == numberFiltered {
            textField.text = ""
        }
        return string == numberFiltered
    }
}

extension UIViewController {
    func setupHideKeyboardOnTap() {
        view.addGestureRecognizer(endEditingRecognizer())
        navigationController?.navigationBar.addGestureRecognizer(endEditingRecognizer())
    }

    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: view, action: #selector(view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}
