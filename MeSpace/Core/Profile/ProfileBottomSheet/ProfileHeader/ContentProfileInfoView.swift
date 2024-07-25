
import SwiftUI

struct ContentProfileInfoView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(spacing: 20) {
                Image("ej")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 8) {
                        Text("Ethan John Paguntalan 💻")
                            .lineLimit(3)
                            .minimumScaleFactor(0.75)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            print("Enter Edit Mode")
                        }) {
                            Image(systemName: "gearshape.fill")
                                .font(.system(size: 14, weight: .semibold))
                                .padding(.vertical, 4)
                                .padding(.horizontal, 10)
                                .foregroundStyle(.white)
                                .overlay(
                                    Capsule()
                                        .stroke(Color.white, lineWidth: 0.5)
                                )
                        }
                    }
                    
                    Text("@only_ej")
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.systemGray5))
                        .font(.footnote)
                    
                    Spacer()
                    
                    HStack {
                        FollowerDataView(count: "6,509", label: "following")
                        Spacer()
                        FollowerDataView(count: "2,098", label: "followers")
                        Spacer()
                        FollowerDataView(count: "12", label: "moots")
                        Spacer().frame(width: 80)
                    }
                    .foregroundStyle(.white)
                }
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
    }
}

struct TestMainProfileHeaderInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentProfileInfoView()
            .background(Color.black)
    }
}
