
import SwiftUI

struct ContentProfileInfoView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            VStack(spacing: 20) {
                Image("ej")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                Button(action: {
                    print("Enter Edit Mode")
                }) {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 12, weight: .semibold))
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .foregroundStyle(.white)
                        .overlay(
                            Capsule()
                                .stroke(Color.white, lineWidth: 0.5)
                        )
                }
            }
            
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("Ethan John Paguntalan 💻")
                            .lineLimit(3)
                            .minimumScaleFactor(0.75)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    
                    Text("@only_ej")
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.systemGray3))
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