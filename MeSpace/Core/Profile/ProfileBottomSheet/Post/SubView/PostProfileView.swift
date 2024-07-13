
import SwiftUI

struct PostProfileView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image("ej")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("dev.ejohn")
                    Spacer()
                    HStack(spacing: 4){
                        Image(systemName: "eye.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        Text("98")
                    }
                    .font(.caption)
                    .foregroundStyle(Color(.systemGray2))
                }
                .font(.headline)
                .fontWeight(.semibold)
                
                HStack(spacing: 0) {
                    Text("05/07/24")
                    Text("・")
                        .frame(width: 16)
                    Text("3PM")
                }
                .font(.subheadline)
                .foregroundStyle(Color(.lightGray))
            }
        }
    }
}

struct PostProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PostProfileView()
    }
}
