//
//  HomeData.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 08/12/2023.
//

import UIKit

struct NotificationDataModel: Decodable {
    let id: String
    let image: String?
    let title: String
    let body: String
    let time: String
    let url: String
    let read: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, image, title, body, time, url, read
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        image = try container.decodeIfPresent(String.self, forKey: .image)
        title = try container.decode(String.self, forKey: .title)
        body = try container.decode(String.self, forKey: .body)
        time = try container.decode(String.self, forKey: .time)
        url = try container.decode(String.self, forKey: .url)
        read = try container.decode(Bool.self, forKey: .read)
    }
}

extension NotificationDataModel: Equatable {
    static func == (lhs: NotificationDataModel, rhs: NotificationDataModel) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title
    }
}
