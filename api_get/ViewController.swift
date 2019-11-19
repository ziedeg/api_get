//
//  ViewController.swift
//  apiGet
//
//  Created by zied alghamdi on 11/7/19.
//  Copyright © 2019 zied alghamdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var field: UITextField!
    
    struct Whatever: Decodable{
        let Items: [Configuration]
        let Count: Int
        let ScannedCount: Int
    }
    
    struct Configuration: Decodable {
        let User: String
        let HumidityThreshold: Int
        let TemperatureThreshold: Int
        let AirQualityThreshold: Int
        let NotificationsEnabled: Bool
        let Email: String
      
        

       /* {"Items":[{"User":"Default","HumidityThreshold":100,"TemperatureThreshold":10,"AirQualityThreshold":200,"NotificationsEnabled":false,"Email":"cesardtamayo@gmail.com"}
           ],
           "Count":1,
           "ScannedCount":1}
        */
        
    }

    // when the button Get is pressed
    //@IBAction func get(_ sender: Any) {
        override func viewDidLoad() {
        super.viewDidLoad()
       
            
        let configurationUrl =  "https://l4gv9uqwpd.execute-api.us-west-1.amazonaws.com/prod/configuration"
        
         
       // https://api.letsbuildthatapp.com/jsondecodable/course
       
        //url constructor
        guard let url = URL(string: configurationUrl) else {return}
        
        //url session to fetch the data
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
        //get data from the url
        guard let data = data else{return}
        //print(data)
        
       //serilize the data
        do{
                
               let whatever = try JSONDecoder().decode(Whatever.self, from: data)
                print(whatever)
               // let name = course.name
                //self.field.text = name
 
                }catch let jsonErr{
                    print("error serializing json:", jsonErr)
                    }
            
         
        }.resume() //start the url session
        
        
        
   
    
    
    
    
        
    }

    
    
    
    
    

}

