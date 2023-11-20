import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding()
                    .background(Color.mint)
                Image("adv1_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 357, height: 76)
                HStack{
                    Image("delivery_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110, height: 110)
                    Image("store_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110, height: 110)
                    Image("sale_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110, height: 110)
                    }
                HStack{
                    Spacer()
                    categoriView()
                        .background(Color.white)
                        .padding(20)
                    Spacer()
                }
                Image("adv2_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 357, height: 144)
              
                Spacer()
                
            }
            .background(Color(UIColor(named: "lightGray") ?? .lightGray))
            
        }
    }
}

struct categoriView: View {

    var body: some View {
        VStack{
            Image("baeminOne_image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 340, height: 25)
            HStack{
                Spacer()
                VStack{
                    Image("categori1_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("알뜰배달")
                        .font(.system(size: 10))
                }
                Spacer()
                VStack{
                    Image("categori2_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("돈까스・회")
                        .font(.system(size: 10))
                }
                Spacer()
                VStack{
                    Image("categori3_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("피자")
                        .font(.system(size: 10))
                }
                Spacer()
                VStack{
                    Image("categori4_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("중식")
                        .font(.system(size: 10))
                }
                Spacer()
                VStack{
                    Image("categori5_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("치킨")
                        .font(.system(size: 10))
                }
                Spacer()
            } 
            
            HStack{
                Spacer()
                VStack{
                    Image("categori6_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("버거")
                        .font(.system(size: 10))
                }
                Spacer()
                VStack{
                    Image("categori7_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("분식")
                        .font(.system(size: 10))
                }
                Spacer()
                VStack{
                    Image("categori8_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("디저트")
                        .font(.system(size: 10))
                }
                Spacer()
                VStack{
                    Image("categori9_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("족발・보쌈")
                        .font(.system(size: 10))
                }
                Spacer()
                VStack{
                    Image("categori10_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("전체보기")
                        .font(.system(size: 10))
                }
                Spacer()
            }
        }
        
    }
    
    
}


struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        VStack {
            HStack {
                Text("우리집 ▾")
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                    .font(.system(size: 20))
                    .fontWeight(.bold)

                Spacer()

                Button(action: {
                    // 첫 번째 버튼 동작
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .imageScale(.medium)
                        .foregroundColor(.white)
                }
                .padding(7)

                Button(action: {
                    // 두 번째 버튼 동작
                }) {
                    Image(systemName: "heart")
                        .imageScale(.medium)
                        .foregroundColor(.white)
                }
                .padding(7)

                Button(action: {
                    // 세 번째 버튼 동작
                }) {
                    Image(systemName: "ellipsis")
                        .imageScale(.medium)
                        .foregroundColor(.white)
                }
                .padding(7)
            }

            HStack(spacing: 10) {
                TextField("찾는 맛집 이름이 뭐예요?", text: $text)
                    .padding(3)
                    .padding(.horizontal, 25)
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(3)
                    .onTapGesture {
                        // 텍스트 필드를 탭하면 검색 상태를 활성화할 수 있습니다.
                    }

            }
            .padding(.trailing, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
