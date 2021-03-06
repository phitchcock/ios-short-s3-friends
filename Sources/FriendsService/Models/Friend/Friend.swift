import Foundation
import SwiftyJSON
import LoggerAPI

// MARK: - Friend

public struct Friend {
    public var id: Int?
    public var userID1: String?
    public var userID2: String?
    public var createdAt: Date?
    public var updatedAt: Date?
}

// MARK: - Friend: JSONAble

extension Friend: JSONAble {
    public func toJSON() -> JSON {
        var dict = [String: Any]()
        let nilValue: Any? = nil

        dict["friend_id"] = id != nil ? id : nilValue
        dict["user_id_1"] = userID1 != nil ? userID1 : nilValue
        dict["user_id_2"] = userID2 != nil ? userID2 : nilValue

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        dict["created_at"] = createdAt != nil ? dateFormatter.string(from: createdAt!) : nilValue
        dict["updated_at"] = updatedAt != nil ? dateFormatter.string(from: updatedAt!) : nilValue

        return JSON(dict)
    }
}
