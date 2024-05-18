//
//  SolarResourceInformationPageModel.swift
//  TeamSaxinkleApp
//
//  Created by nuca on 18.05.24.
//

import Foundation

//MARK: - SolarInformation
enum SolarInformation {
    case DNI
    case GHI
    case TAL
}

struct SolarResourceInformationModel {
    //MARK: - Properties
    var information: String
    var imageString: String
    
    //MARK: - Initializators
    init(solarInformation: SolarInformation) {
        switch solarInformation {
        case .DNI:
            self.information = "The Direct normal irradiance (DNI) is one of the most crucial aspects when assessing and optimizing the technical concept for a CSP plant. Much emphasis should be placed on the thorough determination of the relevant DNI for a particular project and its specific location. Every reduction in uncertainty in terms of the solar resource will directly result in a better predictability of the energy production capabilities of a particular concept (which can be determined through performance modelling). \nMicroclimate can have a significant influence on the DNI at a specific location. There is a high chance of introducing an error if analysis results from a larger area are used instead of assessing the specific DNI of each potential location."
            self.imageString = "first"
        case .GHI:
            self.information = "Global Horizontal Irradiance (GHI) is the amount of terrestrial irradiance falling on a surface horizontal to the surface of the earth. GHI can be measured with a variety of instruments. The most common instrument used to measure GHI is called a pyranometer which has a hemispherical (180°) view angle. The hallmark of a pyranometer is a true cosine response to incident angle, i.e. the response of the pyranometer to a beam of light is proportional to the cosine of the incident angle of the beam. Most pyranometers utilize a thermopile sensor to sense incoming light; however, pyranometers such as the Licor LI-200 use a photovoltaic device with a diffuser."
            self.imageString = "second"
        case .TAL: 
            self.information = "To get the most from solar panels, you need to point them in the direction that captures the most sun. But there are a number of variables in figuring out the best direction. This page is designed to help you find the best placement for your solar panels in your situation.\nThis advice applies to any type of panel that gets energy from the sun; photovoltaic, solar hot water, etc. We assume that the panel is fixed, or has a tilt that can be adjusted seasonally. (Panels that track the movement of the sun throughout the day can receive 10% (in winter) to 40% (in summer) more energy than fixed panels. This page doesn’t discuss tracking panels.)"
            self.imageString = "third"
        }
    }
}
