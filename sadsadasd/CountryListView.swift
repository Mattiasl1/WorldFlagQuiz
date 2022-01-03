//
//  CountryListView.swift
//  sadsadasd
//
//  Created by Mattias Liljenberg on 2021-11-29.
//

import SwiftUI
import Firebase

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
    
    @State private var CountryNameEN = ["Albania", "Andorra", "Austria", "Belarus", "Belgium", "Bosnia", "Bulgaria", "Croatia", "Czechia", "Denmark", "Estonia", "France", "Finland", "Germany", "Greece", "Iceland", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Moldova", "Netherlands", "North Macedonia", "Norway", "Liechtenstein", "Malta", "Monaco", "Montenegro", "Poland", "Portugal", "Romania", "Russia", "SanMarino", "Schweiz", "Serbia", "Slovakia", "Slovenia", "Spain", "Sweden", "Ukraine", "Hungary", "United Kingdom", "Vatican City", "Armenia", "Azerbaijan", "Cambodia", "China", "Cyprus", "India", "Indonesia", "Iraq", "Japan", "Jordan", "Kazakhstan", "Kuwait", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Kyrgyzstan", "Lebanon", "Maldives", "Mongolia", "Nepal", "United Arab Emirates", "Israel", "Laos", "North Korea", "Oman", "Pakistan", "Palestine", "Philippines", "Saudi Arabia", "South Korea", "Syria", "Tajikistan", "Thailand", "Taiwan", "Timor-Leste", "Turkey", "Singapore", "Qatar", "Uzbekistan", "Vietnam", "Yemen", "Algeria", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "C.African Republic", "Cameroon", "Djibouti", "Cape Verde", "Chad", "Comoros", "DR Congo", "Egypt", "Equatorial Guinea", "Eritrea", "Eswatini", "Ethiopia", "Gabon", "Gambia", "Ghana", "Guinea", "GuineaBissau", "Ivory Coast", "Kenya", "Lesotho", "Liberia", "Libya", "Madagascar", "Malawi", "Mali", "Mauritania", "Mauritius", "Morocco", "Mozambique", "Namibia", "Niger", "Nigeria", "Republic of Congo", "Rwanda", "Sao Tome & Principe", "Senegal", "Seychelles", "SierraLeone", "Somalia", "South Africa", "South Sudan", "Sudan", "Tanzania", "Togo", "Tunisia", "Uganda", "Zambia", "Zimbabwe", "Antigua & Barbuda", "Argentina", "Bahamas", "Barbados", "Belize", "Bolivia", "Brazil", "Canada", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominica", "Dominican Republic", "Ecuador", "El Salvador", "Grenada", "Guatemala", "Guyana", "Haiti", "Honduras", "Jamaica", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Saint Kitts & Nevis", "Saint Lucia", "Saint Vincent", "Suriname", "Trinidad & Tobago", "Usa", "Uruguay", "Venezuela", "Australia", "Marshall Islands", "Micronesia", "New Zealand", "Papua New Guinea", "Solomon Islands", "Vanuatu", "Fiji", "Kiribati", "Nauru", "Palau", "Samoa", "Tonga", "Tuvalu", "Jemen", "Kambodja", "Jordanien"]
    
    
    /*
     "Australien", "Fiji", "Kiribati", "Marshallöarna", "Mikronesien", "Nauru", "Nya Zeeland", "Palau", "Papua Nya Guinea", "Salomonöarna", "Samoa", "Tonga", "Tuvalu", "Vanuatu"]
     */
    
    @State private var CountryNameSWE = ["Algeriet", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "C.Afrikanska republiken", "Djibouti", "Egypten", "Ekvatorialguinea", "Elfenbenskusten", "Eritrea", "Etiopien", "Gabon", "Gambia", "Japan", "Ghana", "Guinea", "GuineaBissau", "Kamerun", "Kap Verde", "Kenya", "KongoBrazzaville", "KongoKinshasa", "Lesotho", "Liberia", "Libyen", "Madagaskar", "Malawi", "Mali", "Marocko", "Mauretanien", "Mauritius", "Moçambique", "Namibia", "Niger", "Nigeria", "Rwanda", "São Tomé och Príncipe", "Senegal", "Seychellerna", "Sierraleone", "Somalia", "Sudan", "Swaziland", "Sydafrika", "Sydsudan", "Tanzania", "Tchad", "Togo", "Tunisien", "Uganda", "Zambia", "Zimbabwe", "Albanien", "Andorra", "Belarus", "Belgien", "Bosnien", "Bulgarien", "Danmark", "Estland", "Finland", "Frankrike", "Grekland", "Irland", "Island", "Italien", "Kroatien", "Lettland", "Liechtenstein", "Litauen", "Luxemburg", "Malta", "Moldavien", "Monaco", "Montenegro", "Nederländerna", "Nordmakedonien", "Norge", "Polen", "Portugal", "Rumänien", "Ryssland", "SanMarino", "Schweiz", "Serbien", "Slovakien", "Slovenien", "Spanien", "Storbritannien", "Sverige", "Tjeckien", "Tyskland", "Ukraina", "Ungern", "Vatikanstaten", "Österrike", "Afghanistan", "Armenien", "Azerbajdzjan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cypern", "Filippinerna", "F Arabemiraten", "Indien", "Indonesien", "Irak", "Iran", "Israel", "Jemen", "Jordanien", "Kambodja", "Kazakstan", "Kina", "Kirgizistan", "Kuwait","Komorerna", "Laos", "Libanon", "Malaysia", "Maldiverna", "Mongoliet", "Myanmar", "Nepal", "Nordkorea", "Oman", "Pakistan", "Qatar", "Saudiarabien", "Singapore", "Sri Lanka", "Sydkorea", "Syrien", "Tadzjikistan", "Taiwan", "Thailand", "Turkiet", "Turkmenistan", "Uzbekistan", "Vietnam", "Östtimor", "Antigua och Barbuda", "Argentina", "Bahamas", "Barbados", "Belize", "Bolivia", "Brasilien", "Chile", "Colombia", "Costa Rica", "Dominica", "Dominikanska republiken", "Ecuador", "El Salvador", "Grenada", "Guatemala", "Guyana", "Haiti", "Honduras", "Jamaica", "Kanada", "Kuba", "Mexiko", "Nicaragua", "Panama", "Paraguay", "Peru", "Saint Kitts och Nevis", "Saint Lucia", "Saint Vincent", "Surinam", "Trinidad och Tobago", "Uruguay", "Usa", "Venezuela", "Australien", "Fiji", "Kiribati", "Marshallöarna", "Mikronesien", "Nauru", "Nya Zeeland", "Palau", "Papua Nya Guinea", "Salomonöarna", "Samoa", "Tonga", "Tuvalu", "Vanuatu"]
    
    
    
    @State var titleCountries = "List of countries"
    
    var body: some View {
        
        
        
        
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.black, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text(titleCountries)
                    .font(.largeTitle)
                List(CountryNameSWE, id: \.self) { country in
                    HStack{
                        Image(country)
                            .resizable()
                            .frame(width: 50, height: 30)
                        Text(country)
                        
                        
                    }
                    
                    
                    
                    
                }
            }.onAppear(perform: {
                Analytics.logEvent(AnalyticsEventScreenView,
                                   parameters: [AnalyticsParameterScreenName: "Country list"])

                doLang()
                
        })
        }
        
        
                

        
    }
    
    
    func doLang()
    {
        var lang = UserDefaults.standard.string(forKey: "lang")
        if(lang == nil)
        {
            UserDefaults.standard.set("en", forKey: "lang")
            lang = "en"
        }
        
        if(lang == "en")
        {
            CountryNameSWE = CountryNameEN
            titleCountries = "List of countries"
        } else {
            titleCountries = "Lista över länder"
            CountryNameSWE = CountryNameSWE
        }
    }
    
    
    
    
    
    
    struct CountryListView_Previews: PreviewProvider {
        static var previews: some View {
            CountryListView()
                .previewLayout(.sizeThatFits)
        }
    }
}



/*
 .onAppear(perform: {
     
     doLang()
     
 })
 */


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

/*
 Albania", "Andorra", "Belarus", "Belgium", "Bosnia", "Bulgaria", "Denmark", "Estonia", "Finland", "France", "Greece", "Ireland", "Iceland "," Italy","Croatia","Comoros", "Latvia","Liechtenstein"," Lithuania","Luxembourg","Malta"," Moldova ","Monaco","Montenegro "," Netherlands "," Northern Macedonia ", "Norway", "Poland", "Portugal", "Romania", "Russia", "SanMarino", "Switzerland", "Serbia", "Scotland", "Slovakia", "Slovenia", "Spain", "Great Britain "," Sweden "," Czech Republic "," Germany "," Ukraine "," Hungary "," Vatican City "," Austria ", "Afghanistan", "Armenia", "Azerbaijan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cyprus", "Philippines", "United Arab Emirates", "India", "Indonesia", "Iraq","Iran","Israel","Japan","Yemen","Jordan","Cambodia","Kazakhstan "," China ","Kyrgyzstan","Kuwait","Laos"," Lebanon " , "Malaysia", "Maldives", "Mongolia", "Myanmar", "Nepal", "North Korea", "Oman", "Pakistan", "Qatar", "Saudi Arabia", "Singapore", "Sri Lanka", "South Korea", "Syria", "Tajikistan", "Taiwan", "Thailand", "Turkey", "Turkmenistan", "Uzbekistan", "Vietnam", "East Timor", "Algeria", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "C.African Republic", "Djibouti", "Egypt", "Equatorial Guinea", "Ivory Coast", "Eritrea","Ethiopia "," Gabon ","Gambia","Ghana","Guinea"," GuineaBissau","Cameroon","Cape Verde","Kenya","CongoBrazzaville","CongoKinshasa"," Lesotho ", "Liberia", "Libya", "Madagascar", "Malawi", "Mali", "Morocco", "Mauritania", "Mauritius", "Mozambique", "Namibia", "Niger", "Nigeria", "Rwanda"," São Tomé and Príncipe "," Senegal "," Seychelles "," Sierraleone "," Somalia "," Sudan "," Swaziland "," South Africa "," South Sudan "," Tanzania "," Chad "," Togo "," Tunisia "," Uganda "," Zambia "," Zimbabwe", "Antigua and Barbuda", "Argentina", "Bahamas", "Barbados", "Belize", "Bolivia", "Brazil", "Chile", "Colombia", "Costa Rica", "Dominica", "Dominican Republic "," Ecuador "," El Salvador "," Grenada "," Guatemala "," Guyana "," Haiti "," Honduras "," Jamaica "," Canada "," Cuba "," Mexico "," Nicaragua " , "Panama", "Paraguay", "Peru", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent", "Suriname", "Trinidad and Tobago", "Uruguay", "Usa", "Venezuela
 */
