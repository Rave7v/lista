
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var alumnoSeleccionado : String?
    
    var alumnos = ["Fernando", "Jose", "Daniel", "Sahid", "Ulises", "Valentin"]
    
    @IBOutlet weak var tablaItems: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        tablaItems.delegate = self
        tablaItems.dataSource = self
    }
    
    @IBAction func agregarNuevoBtn(_ sender: UIBarButtonItem) {
        let alerta = UIAlertController(title: "Nuevo contacto", message: "Agregar", preferredStyle: .alert)
        
        //crear el textfield
        alerta.addTextField{nombreAlerta in
            nombreAlerta.placeholder = "Escribe un nuevo alumno"
        }
        //agregar otro text field para la calidficacion
        alerta.addTextField{ calificacionesAlerta in
            calificacionesAlerta.placeholder = "ingresar calificacion"
            calificacionesAlerta.keyboardType = .numberPad
        }
        let accionAceptar = UIAlertAction(title: "aceptar", style: .default){ _ in
            //guard let
            guard let nombreAlumno = alerta.textFields?.first?.text else{return}
            guard let calificacionAlumno = alerta.textFields?[1].text
            else{return}
            self.alumnos.append(nombreAlumno)
            
            //
            self.tablaItems.reloadData()
        }
        let accionCancelar = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        alerta.addAction(accionAceptar)
        alerta.addAction(accionCancelar)
        present(alerta, animated: true, completion: nil)
        
    }
    // MARK: Metodos de la uitableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //crear un objeto del tipo uitableview cell
        let celda = tablaItems.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = alumnos[indexPath.row]
        celda.detailTextLabel?.text = "14 marzo 2022"
        return celda
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            alumnos.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(alumnos[indexPath.row])
        alumnoSeleccionado = alumnos[indexPath.row]
        //mandar elemento seleccionado a 2 vc
        performSegue(withIdentifier: "enviarNombre", sender: alumnos[indexPath.row])
    }
    //let objDestino = segue.destination
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviarNombre"{
        let objDestino = segue.destination as! ListaDetalladaViewController
           objDestino.Recibirnombre = alumnoSeleccionado
    }
    }
}
//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
