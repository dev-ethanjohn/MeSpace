import SwiftUI

struct MainProfileHeaderInfoView: View {
    var body: some View {
        
        HStack(alignment: .top, spacing: 16) {
            Image("ej")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("The only Ethan John 💻")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        
                        Spacer()
                        Button {
                            print("Enter Edit Mode")
                        } label: {
                            Text("Edit")
                                .padding(.vertical, 4)
                                .padding(.horizontal, 12)
                                .foregroundStyle(.black)
                                .background(.white)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .clipShape(Capsule(style: .continuous))
                        }
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
            
            
//            Button {
//                print("Enter Edit Mode")
//            } label: {
//                Text("Edit")
//                    .padding(.vertical, 4)
//                    .padding(.horizontal, 12)
//                    .foregroundStyle(.black)
//                    .background(.white)
//                    .font(.subheadline)
//                    .fontWeight(.bold)
//                    .clipShape(Capsule(style: .continuous))
//            }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
    }
}

struct FollowerDataView: View {
    let count: String
    let label: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(count)
                .fontWeight(.bold)
                .font(.footnote)
            Text(label)
                .foregroundStyle(Color(.lightGray))
                .font(.footnote)
        }
    }
}

#Preview {
    MainProfileHeaderInfoView()
        .background(.gray)
}
