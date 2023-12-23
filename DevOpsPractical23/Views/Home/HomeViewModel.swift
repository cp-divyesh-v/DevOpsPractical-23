//
//  HomeViewModel.swift
//  DevOpsPractical23
//
//  Created by Divyesh on 23/12/23.
//

import Foundation

class HomeViewModel: ObservableObject {

    private let webService: WebServiceProtocol
    @Published var selectedCountryIndex: Int = 0
    @Published var university: [University] = []

    var countries = ["India", "Switzerland", "Indonesia", "Germany", "Nigeria", "Brazil", "Bangladesh", "Russia", "Mexico", "Spain", "Japan", "Australia", "Egypt", "Vietnam", "Canada", "Colombia"] // "Germany", "Thailand", "United", "Tanzania", "France", "South", "Italy", "Kenya", "Myanmar", "Colombia", "South", "Uganda", "Sudan", "Spain", "Argentina", "Algeria", "Iraq", "Afghanistan", "Poland", "Canada", "Morocco", "Saudi", "Ukraine", "Angola", "Uzbekistan", "Yemen", "Peru", "Malaysia", "Ghana", "Mozambique", "Nepal", "Madagascar", "Côte", "Venezuela", "Cameroon", "Niger", "Australia", "North", "Mali", "Burkina", "Syria", "Sri", "Malawi", "Zambia", "Romania", "Chile", "Kazakhstan", "Chad", "Ecuador", "Somalia", "Guatemala", "Senegal", "Netherlands", "Cambodia", "Zimbabwe", "Guinea", "Rwanda", "Benin", "Burundi", "Tunisia", "Bolivia", "Haiti", "Belgium", "Jordan", "Dominican", "Cuba", "South", "Sweden", "Honduras", "Czech", "Azerbaijan", "Greece", "Papua", "Portugal", "Hungary", "Tajikistan", "United", "Belarus", "Israel", "Togo", "Austria", "Switzerland", "Sierra", "Laos", "Serbia", "Nicaragua", "Libya", "Paraguay", "Kuwait", "Croatia", "Eritrea", "Georgia", "Mongolia", "Moldova", "Uruguay", "Bosnia", "Albania", "Jamaica", "Armenia", "Gambia", "Lithuania", "Qatar", "Botswana", "Namibia", "Gabon", "Lesotho", "Guinea-Bissau", "Slovenia", "North", "Latvia", "Equatorial", "Trinidad", "Bahrain", "Timor-Leste", "Estonia", "Mauritius", "Cyprus", "Eswatini", "Djibouti", "Fiji", "Comoros", "Guyana", "Bhutan", "Solomon", "Luxembourg", "Montenegro", "Suriname", "Cabo", "Micronesia", "Malta", "Maldives", "Brunei", "Bahamas", "Belize", "Iceland", "Vanuatu", "Barbados", "Sao", "Samoa", "Saint", "Kiribati", "Grenada", "Tonga", "Seychelles", "St.", "Antigua", "Andorra", "Dominica", "Saint", "Marshall", "Liechtenstein", "Monaco", "San", "Palau", "Nauru", "Tuvalu", "Holy"]

    init(webService: WebServiceProtocol = WebService()) {
        self.webService = webService
    }

    func getCollageList(_ CountryName: String) {
        webService.request(url: "http://universities.hipolabs.com/search?country=\(CountryName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!, method: .get, parameter: [:], headers: nil,
                           success: { (_, _, university: [University]) in
            self.university = university
        }, failure: { error in
            print("API request failed with error: \(error)")
        })
    }
}
