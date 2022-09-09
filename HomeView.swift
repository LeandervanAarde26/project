import SwiftUI

struct HomeView: View {
  @EnvironmentObject var allCars: Network
  @EnvironmentObject var garage: favCars
  let columns = [
    GridItem(.adaptive(minimum: 150))
  ]
  @State var isActive: Bool = false
  @State private var shouldAnimate = false
  @State var show = false
  @State private var searchText = ""
  @State private var showingAlert = false
  @Environment(\.colorScheme) var colorScheme
    var searchResults: [Car] {
        return searchText.isEmpty ? allCars.cars : allCars.cars.filter{$0.model!.contains(searchText) }
    }

    
  var body: some View {
      if self.allCars.cars.count > 0 {
          Text("All \(self.allCars.cars[1].make) vehicles")
          .bold()
          .textCase(.uppercase)
          .font(.headline)
          .lineSpacing(0)
          
          SearchBar(text: $searchText)
              .padding(.top, -30)
      } else {
        HStack(alignment: VerticalAlignment.center) {
          Circle()
            .fill(shouldAnimate ? Color.orange : Color.white)
            .frame(width: 20, height: 20)
            .scaleEffect(shouldAnimate ? 1.0 : 0.5)
            .animation(
              Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: show)
          Circle()
            .fill(shouldAnimate ? Color.orange : Color.white)
            .frame(width: 20, height: 20)
            .scaleEffect(shouldAnimate ? 1.0 : 0.5)
            .animation(
              Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).delay(0.3),
              value: show)

          Circle()
            .fill(shouldAnimate ? Color.orange : Color.white)
            .frame(width: 20, height: 20)
            .scaleEffect(shouldAnimate ? 1.0 : 0.5)
            .animation(
              Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).delay(0.6),
              value: show)
        }
        Spacer()
        VStack {
          Text("Retrieving the Data...")
            .foregroundColor(Color.white)
            .textCase(.uppercase)
        }
      }
      
      ScrollView {
      LazyVGrid(columns: columns, spacing: 0) {
          ForEach(searchResults, id: \.self) {car in
          if car.year >= 2017 {
              HStack(alignment: .top, spacing: 0) {
                NavigationLink(destination: CarDetails(car: car)) {
                    VStack(alignment:.leading, spacing: 0) {
                      Image(
                        "aston")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160.0, height: 70)
                        .foregroundColor(colorScheme == .dark ? Color.white  : Color.orange)
                        

                      Text(car.model ?? "lol")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        .frame(maxWidth: .infinity, alignment: .center)

                      Text(String(car.year))
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(.orange)
                        .frame(maxWidth: .infinity, alignment: .center)

                      Text(car.make)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(height: 250)
                    .background(colorScheme == .dark ? Color.black.opacity(0.2) : Color.white)
                    .cornerRadius(20)
                    .padding()
                    .clipped()
                    .shadow(color: Color.black.opacity(0.24), radius: 10, x: 0, y: 0)
                    .edgesIgnoringSafeArea(.all)
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                .onEnded({ value in
                                    if value.translation.width > 0 {
                                        showingAlert = true
                                        garage.myCars.append(car)
                                    }
                                })
                            )
                            .alert("The Car has been added", isPresented: $showingAlert) {
                                Button("Okay", role: .cancel) {}
                            }
                        }
                    }
                }
            }
        }
    }
  

    .onAppear {
      allCars.getCars()
      self.shouldAnimate = true
      self.show = true
    }
  }
}
struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .environmentObject(Network())
      .environmentObject(favCars())
  }
}
