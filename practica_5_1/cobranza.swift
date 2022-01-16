//
//  cobranza.swift
//  practica_5_1
//
//  Created by Noe Romano Vazquez on 14/01/22.
//  Copyright © 2022 noeromano. All rights reserved.
//

import Foundation

class Cobranza:Decodable{
    var name:String?
    var email:String?
    var pass:String?
    var employeeNumber:String?
    var birthDate:String?
    var phoneNumber:String?
    var role:String?
    //var routes:[Rute]?
}

class Rute:Decodable{
    var direccion:String?
    var personaVisita:String?
    var adeudo:String?
    var notas:String?
    var latitude:String?
    var longitude:String?
}
