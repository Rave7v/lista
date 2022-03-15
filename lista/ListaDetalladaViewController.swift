
import UIKit

class ListaDetalladaViewController: UIViewController {
    
    var Recibirnombre: String?
    var recibirCalificacion: Int?
    @IBOutlet weak var nombreAlumno: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreAlumno.text = Recibirnombre ?? ""
        // Do any additional setup after loading the view.
    }

    @IBAction func regresar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
