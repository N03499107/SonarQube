
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    var countryArray : [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        temp()
        getCountryInfo()
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.tblView.reloadData()
        }
    }
    func temp() {
        
        let url1 = "https://api.foursquare.com/v2/venues/search?near=CHICAGO&query=in&client_id=TMFRZL5ES3ZDJI11LK5UC3LWYZXQY3SP0YXQ2BOXBG31HQTL&client_secret=ABTYRL0ZTBQJZTXKYFEREWLZXRYURFAHLTBCSIDAYIFCILU2&v=20180323"
        let urlApi = URL(string: url1)
        guard let url = urlApi else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error == nil {
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? Dictionary<String, Any> {
//                        print(json)
//                        print(type(of: json))
//                        if let response = json["Response"] as? Array<Dictionary<String,Any>> {
//                            for i in response{
//                                print(String(describing: i["Name"]))
//                            }
//                        }
//                    }
//                }catch {
//
//                }
//                let decoder = JSONDecoder()
//
//                do{
//                    let json = try decoder.decode(Temp1.self, from: data!)
//                    print(json.Response?.first?.Name)
//                }catch{
//
//                }
                
                let decoder = JSONDecoder()
                
                                do{
                                    let json = try decoder.decode(FSTemp1.self, from: data!)
                                    print(json.response["venues"])
                                }catch{
                
                                }
            }else{
                print(error?.localizedDescription)
            }
        }.resume()
    }
    func getCountryInfo(){
        WebServicesModel.sharedObject.getCountryList { (countryArr, error) in
            self.countryArray = countryArr
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country")
        let countryName = countryArray[indexPath.row].Name
        let countryRegion = countryArray[indexPath.row].Region
        
        cell?.textLabel?.text = countryName
        cell?.detailTextLabel?.text = countryRegion
        //print(countryArray[indexPath.row].area)
        return cell!
    }
    
}

