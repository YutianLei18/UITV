//
//  Replies.swift
//  UITV
//
//  Created by Colin on 11/7/22.
//

import Foundation

struct SearchResult : Codable, Identifiable, Hashable {
    let id : String
    let resultType : String
    let image : String
    let title : String
    let description : String
    
    init() {
        id = ""
        resultType = ""
        image = ""
        title = ""
        description = ""
    }
}
struct SearchReply : Codable {
    let searchType : String
    let expression : String
    let results : [SearchResult]
    let errorMessage : String
    
    init() {
        searchType = ""
        expression = ""
        results = []
        errorMessage = ""
    }
}

struct Actor : Codable, Identifiable, Hashable {
    let id : String
    let image : String
    let name : String
    let asCharacter : String
    
    init() {
        id = ""
        image = ""
        name = ""
        asCharacter = ""
    }
    
    init(withId id : String) {
        self.id = id
        image = ""
        name = ""
        asCharacter = ""
    }
}

struct SeriesData : Codable {
    let id : String
    let title : String
    let year : String
    let image : String
    let plot : String
    let actorList : [Actor]
    
    init() {
        id = ""
        title = ""
        year = ""
        image = ""
        plot = ""
        actorList = []
    }
}

struct Role : Codable, Hashable {
    let id : String
    let title : String
    let role : String
    
    init() {
        id = ""
        title = ""
        role = ""
    }
}

struct ActorBio : Codable {
    let id : String
    let name : String
    let image : String
    let summary : String
    let knownFor : [Role]
    
    init() {
        id = ""
        name = ""
        image = ""
        summary = ""
        knownFor = []
    }
}
