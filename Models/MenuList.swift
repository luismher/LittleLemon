//
//  MenuList.swift
//  Restaurant App
//
//  Created by Luismi on 3/8/24.
//

import Foundation
import CoreData

struct MenuList: Decodable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey{
        case menu = "menu"
    }
    
    static func getMenuData(viewContext: NSManagedObjectContext) {
        PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json" )
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) {data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let fullMenu = try? decoder.decode(MenuList.self, from: data){
                    for dish in fullMenu.menu {
                        let newDish = Dish(context: viewContext)
                        newDish.title =  dish.title
                        newDish.image = dish.image
                        newDish.price = dish.price
                        newDish.descriptionDish = dish.descriptionDish
                        newDish.category = dish.category
                    }
                    try? viewContext.save()
                } else {
                    print(error.debugDescription.description)
                }
            } else {
                print(error.debugDescription.description)
            }
        }
        dataTask.resume()
    }
}
