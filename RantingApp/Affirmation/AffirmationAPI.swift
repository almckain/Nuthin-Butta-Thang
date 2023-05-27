//
//  AffirmationAPI.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/25/23.
//

import Foundation

struct Affirmation: Decodable {
    let affirmation: String
}

class AffirmationAPI {
    func fetchAffirmation(completion: @escaping (String) -> Void) {
        let url = URL(string: "https://www.affirmations.dev")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching affirmation: \(error)")
                completion("")
            } else if let data = data {
                let decoder = JSONDecoder()
                if let affirmation = try? decoder.decode(Affirmation.self, from: data) {
                    completion(affirmation.affirmation)
                } else {
                    print("Error decoding affirmation")
                    completion("")
                }
            }
        }
        task.resume()
    }
}
