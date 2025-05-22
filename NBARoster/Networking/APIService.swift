
import Foundation

final class APIService {
    
    let apiKey = "c9ef0beb-182f-4c53-981b-5bbe83749eee"
    private let baseURL = "https://api.balldontlie.io/nba/v1/players"
    private let session = URLSession.shared
    
    func fetchPlayers() async throws -> [Player] {
        var urlComponents = URLComponents(string: baseURL)!
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "per_page", value: "25")
        ]
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await session.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let responseObj = try decoder.decode(PlayerResponse.self, from: data)
        return responseObj.data
    }
    
}
