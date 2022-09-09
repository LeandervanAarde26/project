import SwiftUI

struct ContentView: View {
    
    @State var isLinkActive = false
    @EnvironmentObject var cars: Network
    @EnvironmentObject var garage: favCars
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("car")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .overlay(
                        Rectangle()
                            .opacity(0.6)
                            .ignoresSafeArea(.all)
                    )
               
                    NavigationLink(destination: HomeView()) {
                        Text("Click to view all cars")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(.orange)
                    .clipShape(Capsule()
                    )
                   
                }
            }
        }
    }
            

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
            .environmentObject(favCars())
    }
}
