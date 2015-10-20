//
//  Tarea_U3Tests.swift
//  Tarea.U3Tests
//
//  Created by Cristian Martinez Toledo on 16-09-15.
//  Copyright (c) 2015 Cristian Martinez Toledo. All rights reserved.
//

import UIKit
import XCTest

class Tarea_U3Tests: XCTestCase {
    
    struct Usuario{
        var user:String
        var password:String
    }
    var listaUsuarios: [Usuario] = []
    var listaOrdenada: [Usuario] =  []
    var user = "lrojas"
    var pass = "lrojas"
    
    override func setUp() {
        super.setUp()
        listaUsuarios = self.cargarDatosUsuarios()
        ///testOrdenar()
        //print(listaOrdenada)
        
    }
    func cargarDatosUsuarios() -> [Usuario] {
        var usuarios:[Usuario] = []
        usuarios.append(Usuario(user: "jperez", password: "jperez"))
        usuarios.append(Usuario(user: "cmartinez", password: "cmartinez"))
        usuarios.append(Usuario(user: "lrojas", password: "lrojas"))
        usuarios.append(Usuario(user: "gdiaz", password: "gdiaz"))
        usuarios.append(Usuario(user: "jlopez", password: "jlopez"))
        usuarios.append(Usuario(user: "lramirez", password: "lramirez"))
        usuarios.append(Usuario(user: "mperez", password: "mperez"))
        usuarios.append(Usuario(user: "jcarrasco", password: "jcarrasco"))
        usuarios.append(Usuario(user: "amunoz", password: "amunoz"))
        usuarios.append(Usuario(user: "sbaeza", password: "sbaeza"))
        usuarios.append(Usuario(user: "pfuenzalida", password: "pfuenzalida"))
       return usuarios
    }
    
    func testOrdenar(){
        //Mide el tiempo que se demora en ordenar
        self.measureBlock(){
            self.listaOrdenada = self.Ordenar(self.listaUsuarios)
        }
        
    }
    
    func Ordenar(usuarios:[Usuario]) -> [Usuario]{
        var res:[Usuario]!
        res = usuarios.sort() {$0.user < $1.user}
        return res
    }
    
    func testLogin() {
        // Test funcional de login, usa usuario y password declarados al inicio en la clase
        XCTAssert(self.validarUsuario(), "Pass")
    }
    
    func validarUsuario() -> Bool {
        var resp:Bool = false
        for usuario in self.listaUsuarios{
            if self.user == usuario.user && self.pass == usuario.password {
                resp = true
            }
        }
        return resp
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
}
