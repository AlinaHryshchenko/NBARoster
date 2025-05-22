
import Foundation

struct PlayerResponse: Codable {
    let data: [Player]
}

struct Player: Identifiable, Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let position: String
    let height: String?
    let weight: String?
    
    var fullName: String {
        return "\(first_name) \(last_name)"
    }
}
