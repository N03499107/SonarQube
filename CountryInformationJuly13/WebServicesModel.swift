
let apiStr = "http://countryapi.gear.host/v1/Country/getCountries"

typealias  completionHandler = ([Country],Error?) -> ()

import Foundation

class WebServicesModel: NSObject{
    
    //create singleton object
    private override init() {}
    static let sharedObject = WebServicesModel()
    
//    func getCountryInfo(completion:@escaping completionHandler){
//        //Convert apiStr to URL
//        let urlAPI = URL(string: apiStr)
//        if let url = urlAPI{
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//                    if error == nil{
//                        if let data = data{
//                            do{
//                                // parse the json data
//                                if let jsondata = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String,Any>{
//                                    guard let array = jsondata["Response"] as? Array<Dictionary<String,Any>> else{return}
//                                    var countryArr : Array<Country> = []
//                                    for item in array{
//
//                                        let countryDict = Country(
//                                                                  name: item["Name"] as! String,
//                                                                  alpha2Code: item["Alpha2Code"] as! String,
//                                                                  alpha3Code: item["Alpha3Code"] as! String,
//                                                                  nativeName: item["NativeName"] as! String,
//                                                                  region: item["Region"] as! String,
//                                                                  subRegion: item["SubRegion"] as! String,
//                                                                  latitude: item["Latitude"] as! String,
//                                                                  longitude: item["Longitude"] as! String,
//                                                                  area: "\(item["Area"])",
//                                                                  numericCode: "\(item["NumericCode"])",
//                                                                  nativeLanguage: item["NativeLanguage"] as! String,
//                                                                  currencyCode: item["CurrencyCode"] as! String,
//                                                                  currencyName: item["CurrencyName"] as! String,
//                                                                  currencySymbol: item["CurrencySymbol"] as! String,
//                                                                  flag: item["Flag"] as! String,
//                                                                  flagPng: item["FlagPng"] as! String)
//
//                                        countryArr.append(countryDict)
//                                    }
//                                    completion(countryArr,nil)
//                                }
//                            }catch{}
//                        }
//                    }else{
//                        completion([],nil)
//                    }
//            }.resume()
//        }
//    }
    
    func getCountryList(completion: @escaping completionHandler) {
        
        let urlApi = URL(string: apiStr)
        URLSession.shared.dataTask(with: urlApi!) { (data, response, error) in

            if error == nil{
                let decoder = JSONDecoder()
                do{
                    let country = try decoder.decode(JSONData.self, from: data!)
                    completion(country.Response,nil)
                }
                catch{
                    print("Catch")
                    print(error)
                }
            }
            else{
                completion([],error)
            }
            }.resume()
        
    }
    
    
    
}
