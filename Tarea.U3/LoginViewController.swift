//
//  ViewController.swift
//  Tarea.U3
//
//  Created by Cristian Martinez Toledo on 16-09-15.
//  Copyright (c) 2015 Cristian Martinez Toledo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    var sesion:Usuario!
    var usuarios = Usuarios.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarDatosUsuarios()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func btnIngresar(sender: AnyObject) {
        if txtUser.text!.isEmpty || txtPassword.text!.isEmpty {
            let alertController = UIAlertController(title: "¡Ups!", message: "Por favor rellene todos los campos", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        
        if validarUsuario() {
            sesion = Usuario(user: txtUser.text!, password: txtPassword.text!)
            limpiar()
            self.performSegueWithIdentifier("inicioSesion", sender: nil)
        }else{
            let alertController = UIAlertController(title: "¡Ups!", message: "Usuario o contraseña incorrectos", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "inicioSesion" {
            
            let nvc = segue.destinationViewController as! UINavigationController
            let svc = nvc.topViewController as! InicioViewController
            
            svc.sesion = sesion
        }
        
    }
    
    @IBAction func btnLimpiar(sender: AnyObject) {
        limpiar()
    }
    
    func limpiar(){
        txtUser.text =  ""
        txtPassword.text = ""
    }
    
    func validarUsuario() -> Bool {
        var resp:Bool = false
        for usuario in usuarios.listarUsuarios(){
            if txtUser.text == usuario.user && txtPassword.text == usuario.password {
                resp = true
            }
        }
        return resp
    }
    
    func cargarDatosUsuarios() {
        usuarios.agregarUsuario(Usuario(user: "jperez", password: "jperez"))
        usuarios.agregarUsuario(Usuario(user: "cmartinez", password: "cmartinez"))
        usuarios.agregarUsuario(Usuario(user: "lrojas", password: "cmartinez"))
        usuarios.agregarUsuario(Usuario(user: "gdiaz", password: "gdiaz"))
        usuarios.agregarUsuario(Usuario(user: "jlopez", password: "jlopez"))
        usuarios.agregarUsuario(Usuario(user: "lramirez", password: "lramirez"))
        usuarios.agregarUsuario(Usuario(user: "mperez", password: "lramirez"))
        usuarios.agregarUsuario(Usuario(user: "jcarrasco", password: "jcarrasco"))
        usuarios.agregarUsuario(Usuario(user: "amunoz", password: "amunoz"))
        usuarios.agregarUsuario(Usuario(user: "sbaeza", password: "sbaeza"))
        
    }
}

