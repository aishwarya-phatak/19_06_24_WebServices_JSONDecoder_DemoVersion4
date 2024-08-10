//
//  University.swift
//  19_06_24_WebServices_JSONDecoder_DemoVersion4
//
//  Created by Vishal Jagtap on 07/08/24.
//

import Foundation
struct University : Decodable{
    
    var alpha_two_code : String
    var web_pages : [String]
    var country : String
    var domains : [String]
    var name : String
    
    enum UniversityKeys: String,CodingKey{
        case alphaTwoCode = "alpha_two_code"
        case webPages = "web_pages"
        case country
        case domains
        case name
    }
    
    init(from decoder: any Decoder) throws {
        let mainContainer = try decoder.container(keyedBy: UniversityKeys.self)
        self.alpha_two_code = try mainContainer.decode(String.self, forKey: .alphaTwoCode)
        self.web_pages = try mainContainer.decode([String].self, forKey: .webPages)
        self.country = try mainContainer.decode(String.self, forKey: .country)
        self.domains = try mainContainer.decode([String].self, forKey: .domains)
        self.name = try mainContainer.decode(String.self, forKey: .name)
    }
}
