//
//  Usuarios.swift
//  Tarea.U3
//
//  Created by Cristian Martinez Toledo on 16-09-15.
//  Copyright (c) 2015 Cristian Martinez Toledo. All rights reserved.
//

import Foundation

class Usuarios {
    
    class var sharedInstance: Usuarios{
        struct Static{
            static var instance: Usuarios?
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = Usuarios()
        }
        return Static.instance!
    }
    
    private var listaDeUsuarios = [Usuario]()
    
    func agregarUsuario(usuario: Usuario){
        listaDeUsuarios.append(usuario)
    }
    
        func listarUsuarios() -> [Usuario]{
        return listaDeUsuarios
    }

    
}
