
import SwiftUI

struct SplashView: View {
    @State var isActive:Bool = false
    @State private var shouldAnimate = false
    @State var show = false
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea().opacity(0.8)
                if self.isActive{
                    ContentView()
                } else{
                    HStack{
                        Circle()
                            .fill(shouldAnimate ? Color.orange : Color.white)
                            .frame(width: 20, height: 20)
                            .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                            .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: show)
                        Circle()
                            .fill(shouldAnimate ? Color.orange : Color.white)
                            .frame(width: 20, height: 20)
                            .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                            .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).delay(0.3), value: show)
                            
                        Circle()
                            .fill(shouldAnimate ? Color.orange : Color.white)
                            .frame(width: 20, height: 20)
                            .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                            .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).delay(0.6), value: show)
                    }
                }
            }
        }
      
        
        .onAppear{
            self.shouldAnimate = true
            self.show = true
            DispatchQueue.main.asyncAfter(deadline: .now()+5.0){
                withAnimation{
                    self.isActive = true

                }
            }
        }
    }
        
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
