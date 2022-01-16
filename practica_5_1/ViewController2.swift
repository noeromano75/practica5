//
//  ViewController2.swift
//  practica_5_1
//
//  Created by Noe Romano Vazquez on 14/01/22.
//  Copyright © 2022 noeromano. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var Empleado = Cobranza()
    @IBOutlet weak var tablaRutas: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaRutas.delegate=self
        tablaRutas.dataSource=self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController2: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return Empleado.routes!.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "\(Empleado.routes![indexPath.row].personaVisita!)"
        cell.detailTextLabel?.text = "\(Empleado.routes![indexPath.row].adeudo!)"
        print("\(Empleado.routes![indexPath.row])")*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "Las Americas"
        cell.detailTextLabel?.text = "Plaza comercial"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vcd = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(identifier: "VC3") as?
            ViewController3{
            /*vcd.latitud = Empleado.routes![indexPath.row].latitude!
            vcd.longitud = Empleado.routes![indexPath.row].longitude!
            vcd.notas = Empleado.routes![indexPath.row].notas!
            vcd.direccion = Empleado.routes![indexPath.row].direccion!
            */
            vcd.latitud = 19.587209
            vcd.longitud = -99.024258
            vcd.notas = "Centro comercial con más de 200 tiendas minoristas, restaurantes informales, tiendas departamentales y cine."
            vcd.direccion = "Av. Central S/N, Fraccionamiento Las Americas, Las Américas, 55075 Ecatepec de Morelos, Méx."
            self.present(vcd, animated: true) {
                print("Done!")
            }
        }
    }
    
    
}

