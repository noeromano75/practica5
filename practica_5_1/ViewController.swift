//
//  ViewController.swift
//  practica_5_1
//
//  Created by Noe Romano Vazquez on 14/01/22.
//  Copyright © 2022 noeromano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tablaCobranza: UITableView!
    
    var empleados = [Cobranza]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tablaCobranza.dataSource =  self
        tablaCobranza.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
         var request = URLRequest(url: URL(string: "https://netec-swift.herokuapp.com/cobranza.php")!)
        request.httpMethod="GET"
        let task = URLSession.shared.dataTask(with: request){
            data,response,error in
            
            if error != nil {
            print("Error en al peticion\(String(describing: error))")
            }
            do {
                print(data!)
                let objs = try JSONDecoder().decode([Cobranza].self, from: data!)
                print(objs)
                
                
                objs.forEach { (emp) in
                    print(emp.name)
                }
                self.empleados = objs
            }catch{
            
            }
    }
    print(empleados.count)
    task.resume()
    
        DispatchQueue.main.async {
            print("Hola - \(self.empleados.count)")
        }
    }
    
    
    @IBAction func actualizarInfo(_ sender: Any) {
        self.tablaCobranza.reloadData();
    }
    
}

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("1 - \(empleados.count)");
        return empleados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "\(empleados[indexPath.row].employeeNumber!)"
        cell.detailTextLabel?.text = "\(empleados[indexPath.row].name!)"
        
        if empleados[indexPath.row].role=="Gerente de Cobranza"{
        cell.backgroundColor = UIColor.green
        }
        
        print("2 - \(empleados[indexPath.row].employeeNumber!) - \(empleados[indexPath.row].name!)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vcd = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC2") as? ViewController2{
            vcd.Empleado = empleados[indexPath.row]
            
            self.present(vcd, animated: true) {
                print("Done!")
            }
        }
    }
}
