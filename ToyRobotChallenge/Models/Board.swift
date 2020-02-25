import Foundation

final class Board {
    let size: Int

    var allowedRegx: String {
        var regex = ""
        for i in 0 ..< size {
            regex.append(String(i))
        }
        return regex
    }

    init(with size: Int) {
        self.size = size
    }
}
