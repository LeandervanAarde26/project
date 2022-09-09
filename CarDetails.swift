

import SwiftUI

struct CarDetails: View {
    let car: Car
    
    var body: some View {
        VStack(spacing: 0){
            Image("aston")
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fit)
                .frame(width: 700, height: 250, alignment: Alignment.top)
        }
        .frame(alignment: Alignment.top)
        
        VStack{
            Image(systemName: "heart")
                .foregroundColor(Color.red)
                .frame(width: 130, height: 130, alignment: Alignment.center)
            
            Text(car.make)
                .font(Font.largeTitle.bold())
            HStack{
                Text(car.model ?? "None")
                    .font(Font.title2.bold())
                    .foregroundColor(Color.gray)
                
                Text(String(car.year))
                    .font(Font.title2.bold())
                    .foregroundColor(Color.gray)
            }
            
            List {
                Text(car.generation ?? "generation")
                Text(car.engine_modification ?? "generation")
                Text(car.body_type ?? "generation")
                Text(String(car.combined_fuel_consumption != nil ? car.combined_fuel_consumption!: 0) + "Km/L")
                Text(car.fuel_type ?? "generation")
                Text(String(car.acceleration != nil ? car.acceleration!: 0) + "s (0km - 100km)")
                Text(String(car.acceleration != nil ? car.acceleration!: 0) + "s (0km - 100km)")
            }
        }
    }
}

//struct CarDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        CarDetails()
//    }
//}
