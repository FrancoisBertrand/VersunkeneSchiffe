//
//  Model.swift
//  Schiffeversenken
//
//  Created by Francois Bertrand on 07.01.18.
//  Copyright © 2018 Francois Bertrand. All rights reserved.
//

import Foundation
import UIKit

class Model: NSObject {
    
    func getShip(fileName: String) -> [String]?{
        let components = fileName.components(separatedBy: ".")
        let bundle = Bundle.main
        if let fileURL = bundle.url(forResource: components[0], withExtension: components[1]){
            if let content = try? String(contentsOf: fileURL, encoding: String.Encoding.utf8){
                let contentArray = content.components(separatedBy: "|")
                return contentArray
            }
        }
        return nil
    }
    
    
    
    func getDictionary () -> [String: String] {
        let contentArray=getShip(fileName: "Ship.txt")
        var shipDict = [String : String]()
        for ships in contentArray!{
            let components = ships.components(separatedBy: ":")
            
            shipDict[components[0]]=components[1]
        }
        
        return shipDict
    }
    func getLabel()->[String]?{
        var keyName = [String]()
        let content = getShip(fileName: "Ship.txt")
        
        for key in content!{
            let keyArray = key.components(separatedBy: ":")
            keyName.append(keyArray[0])
        }
        return keyName
    }
}
