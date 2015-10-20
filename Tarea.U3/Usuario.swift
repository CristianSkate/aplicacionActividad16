//
//  Usuario.swift
//  Tarea.U3
//
//  Created by Cristian Martinez Toledo on 16-09-15.
//  Copyright (c) 2015 Cristian Martinez Toledo. All rights reserved.
//

import Foundation

class Usuario: NSObject {
    
    var user:String
    var password:String
    
    init(user:String, password:String) {
        self.user = user
        self.password = password
    }
    
}
