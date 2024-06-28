

import SwiftUI

struct ContentView: View {
    //let service = FetchLanguages()
        @StateObject private var languageModel = LanguageService()
        @State private var firstselectedLanguage: Language? = nil
        @State private var secondSelectedLanguage: Language? = nil
        @State private var givenInput: String = ""
        @State private var translationOutput: String = ""
    
    var body: some View {
        VStack(alignment: .leading, content: {
            //includes welcome text and avatar
            TopBar()
            ///view for selecting languages
            HStack{
                LanguageDropDown(selectedLanguage: $firstselectedLanguage, languages: languageModel.languages)
                Spacer()
                Image(systemName: "arrowshape.zigzag.right")
                Spacer()
                LanguageDropDown(selectedLanguage: $secondSelectedLanguage, languages: languageModel.languages)
                    
            }.frame(maxWidth: .infinity).padding(.vertical)
            ///body content that includes input field and respose
            bodyContent(inputText:$givenInput,translationOutput: $translationOutput,languageModel: languageModel,firstSelectedLanguage:$firstselectedLanguage,secondSelectedLanguage:$secondSelectedLanguage).padding(.vertical)
        }).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity, alignment: .topLeading).padding()
        
        
        

    }
}
    


struct TopBar: View {
    var body: some View {
            HStack{
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Welcome to")
                        .font(.system(size: 24)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text("World of Words").font(.system(size: 16)).foregroundStyle(Color.gray)
                })
                Spacer()
                Image("avatar").resizable().frame(width: 56,height: 56)
            }.frame(maxWidth: .infinity)
    }
}

struct LanguageDropDown: View{
    @Binding var selectedLanguage: Language?
    var languages: [Language]
    var body: some View {
        Menu {
            ForEach(languages) { language in
                Button(action: {
                    selectedLanguage = language
                }) {
                    Text(language.language)
                    
                }
            }
        } label: {
            HStack {
                Text(selectedLanguage?.language ?? "Select Language").font(.system(size: 14))
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
            }.frame(minWidth: 130)
            .padding(.vertical,16)
            .padding(.horizontal, 12)
            .background(Color(.systemGray6))
            .cornerRadius(56)
        }
    }
}

struct bodyContent: View {
    @Binding var inputText: String
    @Binding var translationOutput: String
    @ObservedObject var languageModel: LanguageService
    @Binding var firstSelectedLanguage: Language?
    @Binding var secondSelectedLanguage: Language?
    
    
    var body: some View {
        VStack(spacing:0){
            TextEditor(text: $inputText)
                                        .scrollContentBackground(.hidden)
                                        .padding([.leading,.trailing],4)
                                        .background(Color(.systemGray6))
                                        .foregroundColor(.black)
                                        .font(.system(size: 16))
            
                        Button(action: {
                            // Call translate function from LanguageService
                            guard let fromLangCode = firstSelectedLanguage?.language_code, let toLangCode = secondSelectedLanguage?.language_code else { return }
                                        languageModel.translate(input_text: inputText, translated_from: fromLangCode, translated_to:toLangCode)
                            translationOutput=languageModel.translationResult
            
                        }) {
                            Text("Translate")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .padding(12)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                        }
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: 180)
        .background(Color(.systemGray6)).cornerRadius(12)
        
        //Stack for output
        VStack(alignment:.leading){
            Text("Output").fontWeight(.semibold).font(.system(size:18)).foregroundStyle(Color.black)
            VStack(alignment:.leading){
                Text(translationOutput).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading).foregroundColor(Color.gray)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
        }
    }
}



#Preview {
   ContentView()
}
