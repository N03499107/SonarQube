//
//  LearnCodable.swift
//  CountryInformationJuly13
//
//  Created by Ritu Patel on 10/10/18.
//  Copyright © 2018 Ritu Patel. All rights reserved.
//

import Foundation

class Temp1 : Codable{
    var Response : [Temp]?
}

class Temp : Codable {
    var Name : String?
}


class FSTemp1 : Codable {
    var  response: Dictionary<String,Venue>?
}

class FSTemp: Codable {
    var venues : Array<Venue>?
}

class Venue : Codable {
    var name : String?
}
