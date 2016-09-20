//
//  File.swift
//  ShoppingCart
//
//  Created by Nilesh Jarad on 15/09/16.
//  Copyright © 2016 Nilesh Jarad. All rights reserved.
//

import Foundation

protocol ShoppingCartView {
    func intializeViewAndDelegate()
    func renderCartItems(shoppingCartList : [ShoppingCartModel])
}


class ShoppingCartPresenter {
    var shoppingCartList : [ShoppingCartModel] = []
    
    var view : ShoppingCartView!
    
    func attachView(view : ShoppingCartView){
        self.view = view
//        startInitialization()
    }
    
    
    func startInitialization()  {
        self.view.intializeViewAndDelegate()
    }
    
    func prepareCartList() {
        let descriptionBudLight = "Part of Anheuser-Busch brewing company, Bud Light is the best selling beer in America. A 12-ounce serving contains 4.2% ABV and 110 calories. Recent advertisements by Anheuser-Busch claim \"The difference is drinkability\"."
        addBeerToList("Bud Light", imageName: "bud_light", rating: 5, price: 500, discountPer: 2,description: descriptionBudLight)
        
        let descriptionHeineken = "Heineken beer is brewed by 40 breweries in 39 countries around the world. In 2006, 250.8 million liters of Heineken were produced, and the consolidated beer production was 111.9 million hectoliters. Since 1975, most Heineken beer is brewed in the Heineken brewery in Zoeterwoude, located in the Netherlands."
        addBeerToList("Heineken", imageName: "heineken", rating: 5, price: 400, discountPer: 1, description: descriptionHeineken)
        
        let descriptionBudweiser = "Anheuser–Busch has been involved in a trademark dispute with European beer companies, in particular the Budweiser Budvar Brewery of České Budějovice, Czech Republic, over the trademark rights to the name \"Budweiser\". Beer has been brewed in České Budějovice (known as Budweis in German) since it was founded by king Ottokar II of Bohemia in 1245. The name Budweiser is a derivative adjective, meaning \"of Budweis\". In 1876, Adolphus Busch and his friend Carl Conrad, a liquor importer, developed a \"Bohemian-style\" lager, inspired after a trip to the region"
        addBeerToList("Budweiser", imageName: "budwiser", rating: 5, price: 250, discountPer: 5, description: descriptionBudweiser)
        
        let descriptionAsahi = "The Asahi Breweries aims to satisfy its customers with the highest levels of quality and integrity,while contributing to the promotion of healthy living and the enrichment of society worldwide."
        addBeerToList("Asahi", imageName: "asahi", rating: 5, price: 400, discountPer: 3, description: descriptionAsahi)
        
        let descriptionCoronaExtra = "Corona Extra is a pale lager produced by Grupo Modelo in Mexico. It is one of the top-selling beers worldwide, and in the United States it is the top-selling imported beer."
        addBeerToList("Corona Extra", imageName: "corona", rating: 5, price: 330, discountPer: 1, description: descriptionCoronaExtra)
        
        let descriptionTuborg = "Tuborg sell a variety of beers in over 31 countries including: Tuborg Green, Tuborg Lemon, Tuborg Christmas beer, Tuborg Gold, Tuborg Red, Tuborg Twist, Tuborg Black and the alcohol strong Tuborg Fine Festival.\nTuborg Gold is quite popular throughout Denmark and southern Sweden, in the latter being as easily found on store shelves as other Swedish brews, such as Pripps Blå or Falcon. Tuborg Green has been extremely successful in Eastern Europe, especially in Russia where the brand has seen double digit growth for a number of years and is now the largest premium international beer in the country."
        addBeerToList("Tuborg", imageName: "tuborg", rating: 5, price: 170, discountPer: 2,description: descriptionTuborg)
        
        let descriptionCarlsberg = "Carlsberg is a very successful beer brand, originating from Denmark, and is very popular in many different countries across the globe, espcially the U.K. There are also many stores called Carlsberg which sell Carlsberg, other beer brands, newspapers, magazines and confectionary. Carlsberg beers comes in cans and bottles. "
        addBeerToList("Carlsberg", imageName: "Carlsburg", rating: 5, price: 180, discountPer: 0, description: descriptionCarlsberg)
        
        let descriptionHoggard = "The village of Hoegaarden had been known for its witbieren (white beers) since the Middle Ages. In the nineteenth century, the village had thirteen breweries and 9 distilleries;[2] however, in 1957, the last local witbier brewery, Tomsin, closed its doors. Pierre Celis, a milkman who had grown up next to the brewery and sometimes helped with brewing, decided some ten years later to try to revive the style. He started a new brewery, called de Kluis, in his hay loft.[3] [4] Celis used the traditional ingredients of water, yeast, wheat, hops, coriander, and dried Curaçao orange peel known as Laraha."
        addBeerToList("Hoggard", imageName: "hogg", rating: 5, price: 400, discountPer: 3,description: descriptionHoggard)
        
        view.renderCartItems(shoppingCartList)
    }
    
    func addBeerToList(beerName : String ,imageName : String, rating : Float, price : Float, discountPer : Int, description : String) {
        let beer : ShoppingCartModel = ShoppingCartModel()
        beer.name = beerName
        beer.imageName = imageName
        beer.rating  = rating
        beer.price = price
        beer.itemDescription = description
        beer.discountPer  = discountPer
        beer.discountedPrice  = getDiscountedPrice(price,per: discountPer)
        shoppingCartList.append(beer)
    }
    
    func getDiscountedPrice(price : Float, per : Int) -> Float! {
        if per != 0{
            return price - (price * (Float(per)/100))
        }else{
            return price
        }
    }
    
}