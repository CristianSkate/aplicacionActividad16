//
//  InicioViewController.swift
//  Tarea.U3
//
//  Created by Cristian Martinez Toledo on 16-09-15.
//  Copyright (c) 2015 Cristian Martinez Toledo. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var sesion:Usuario!
    let listaUsuarios = Usuarios.sharedInstance.listarUsuarios()
    var listaOrdenadna:[Usuario]!
    
    @IBOutlet weak var lblBienvenida: UILabel!
    @IBOutlet weak var tblListaOrdenada: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblBienvenida.text =  "¡Bienvenido \(sesion.user)!"
        self.navigationController?.navigationBar.barTintColor =  UIColor.orangeColor()
        tblListaOrdenada.delegate = self
        tblListaOrdenada.dataSource = self
        tblListaOrdenada.rowHeight = UITableViewAutomaticDimension
        tblListaOrdenada.estimatedRowHeight =  50
        tblListaOrdenada.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Celda")
        listaOrdenadna = ordenar(listaUsuarios)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnVolver(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func ordenar(usuarios:[Usuario]) -> [Usuario]{
        let res = usuarios.sort() {$0.user < $1.user}
        return res
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaUsuarios.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath) as UITableViewCell
        let pe = listaOrdenadna[indexPath.row]
        cell.textLabel?.lineBreakMode = .ByWordWrapping
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = pe.user
        
        return cell

        
    }
    
}
