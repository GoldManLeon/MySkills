protocol WeatherViewControllerdelegate{
    func setName(name: String)
}

import UIKit
class WeatherViewController: UIViewController{
    var delegate: WeatherViewControllerdelegate?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityTempLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherForData(for: "Moscow")

    }

    @IBAction func getData(_ sender: Any){
        if let city = textField.text{
            getWeatherForData(for: city)
        }
    }

    func getWeatherForData(for city: String){

        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=b08d13d1e26ed6949a7d1be52b6ff39c"

        guard let url = URL(string: urlString) else {return}

        let task = URLSession.shared.dataTask(with: url){ data, response, error in

            if let data = data, error == nil{
                DispatchQueue.main.async {
                    self.setLabelsForData(for: data as NSData)
                }
            }

        }
        task.resume()

    }
    func setLabelsForData(for data: NSData){

        let json = try? JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary

        if let name = json?["name"] as? String{
            cityNameLabel.text = name
        }
        if let main = json?["main"] as? NSDictionary{
            if let temp = main["temp"] as? Double{
                cityTempLabel.text = String(format: "%.0f", temp - 272.15)

            }

    }

}
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
        delegate?.setName(name: " ")
    }
}
