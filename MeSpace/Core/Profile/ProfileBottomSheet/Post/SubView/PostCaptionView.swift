

import SwiftUI

struct PostCaptionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("24th birthday 🎈")
                .fontWeight(.semibold)
                .font(.system(size: 17))
            VStack {
                Text("Hey, it's my birthday today July 05, 2000. I'm sorry, no active drawing since mid-2022. I hope some of y'all still here with my page hehe. For the past weeks, I'm busy developing this app. Is is so thrilling and exciting because this buddy is what i envision as a platform for creative freedom and relationships. Hoping to further this development up until I finish the prototype. Wish you all a wonderful day!") +
                Text(" #Hello").foregroundColor(.blue) +
                Text(" #MeSpace").foregroundColor(.blue) +
                Text(" #24thBirthday").foregroundColor(.blue)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 12)
            .background(Color(.white))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .font(.system(size: 16))
    }
}

struct PostCaptionView_Previews: PreviewProvider {
    static var previews: some View {
        PostCaptionView()
    }
}
