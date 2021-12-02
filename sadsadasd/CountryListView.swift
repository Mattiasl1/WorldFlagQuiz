//
//  CountryListView.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-29.
//

import SwiftUI

struct AllImageList: View {
    
    var imageName: String
    
    
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 50, height: 30)
    }
}

struct CountryListView: View {
    @State private var correctIndexAnswer = 0
    
    @State private var CountryName = ["Algeriet", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "C.Afrikanska republiken", "Djibouti", "Egypten", "Ekvatorialguinea", "Elfenbenskusten", "Eritrea", "Etiopien", "Gabon", "Gambia", "Japan", "Jemen", "Jordanien", "Kambodja", "Ghana", "Guinea", "GuineaBissau", "Kamerun", "Kapverde", "Kenya", "KongoBrazzaville", "KongoKinshasa", "Lesotho", "Liberia", "Libyen", "Madagaskar", "Malawi", "Mali", "Marocko", "Mauretanien", "Mauritius", "Moçambique", "Namibia", "Niger", "Nigeria", "Rwanda", "São Tomé och Príncipe", "Senegal", "Seychellerna", "Sierraleone", "Somalia", "Sudan", "Swaziland", "Sydafrika", "Sydsudan", "Tanzania", "Tchad", "Togo", "Tunisien", "Uganda", "Zambia", "Zimbabwe", "Albanien", "Andorra", "Belarus", "Belgien", "Bosnien", "Bulgarien", "Danmark", "Estland", "Finland", "Frankrike", "Grekland", "Irland", "Island", "Italien", "Kroatien", "Lettland", "Liechtenstein", "Litauen", "Luxemburg", "Malta", "Moldavien", "Monaco", "Montenegro", "Nederländerna", "Nordmakedonien", "Norge", "Polen", "Portugal", "Rumänien", "Ryssland", "SanMarino", "Schweiz", "Serbien", "Skottland", "Slovakien", "Slovenien", "Spanien", "Storbritannien", "Sverige", "Tjeckien", "Tyskland", "Ukraina", "Ungern", "Vatikanstaten", "Wales", "Österrike", "Afghanistan", "Armenien", "Azerbajdzjan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cypern", "Filippinerna", "Förenade Arabemiraten", "Indien", "Indonesien", "Irak", "Iran", "Israel", "Japan", "Jemen", "Jordanien", "Kambodja", "Kazakstan", "Kina", "Kirgizistan", "Kuwait", "Laos", "Libanon", "Malaysia", "Maldiverna", "Mongoliet", "Myanmar", "Nepal", "Nordkorea", "Oman", "Pakistan", "Qatar", "Saudiarabien", "Singapore", "Sri Lanka", "Sydkorea", "Syrien", "Tadjikistan", "Taiwan", "Thailand", "Turkiet", "Turkmenistan", "Uzbekistan", "Vietnam", "Östtimor", "Antigua och Barbuda", "Argentina", "Bahamas", "Barbados", "Belize", "Bolivia", "Brasilien", "Chile", "Colombia", "Costa Rica", "Dominica", "Dominikanska republiken", "Ecuador", "El Salvador", "Grenada", "Guatemala", "Guyana", "Haiti", "Honduras", "Jamaica", "Kanada", "Kuba", "Mexiko", "Nicaragua", "Panama", "Paraguay", "Peru", "Saint Kitts och Nevis", "Saint Lucia", "Saint Vincent", "Surinam", "Trinidad och Tobago", "Uruguay", "Usa", "Venezuela"]
    
    var body: some View {
        
        
        VStack{
            Text("Lista över länder")
                .font(.largeTitle)
            List(CountryName, id: \.self) { country in
                HStack{
                    Image(country)
                        .resizable()
                        .frame(width: 50, height: 30)
                    Text(country)
                    
                    
                }
                
                
                
                
            }
        }
        /*
         EuropeImageQuiz(imageName: CountryName[correctIndexAnswer])
         .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 4)
         */
        
        
        /*
         HStack{
         Image("Sverige")
         .resizable()
         .frame(width: 50, height: 30)
         Text("Sverige")
         }
         
         */
        
    }
    
    struct CountryListView_Previews: PreviewProvider {
        static var previews: some View {
            CountryListView()
        }
    }
}
