import 'package:flutter/material.dart';
import 'package:transformationapp/viewModel/welcomePageViewModel.dart';
import 'package:transformationapp/views/pages/landingPage.dart';
import '../Uielements/shared.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomePageViewModel>.reactive(
    viewModelBuilder: ()=>WelcomePageViewModel(),
    disposeViewModel: false,
    builder:(context,model,child)=>
        Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/transformation.jpg'),
                  fit: BoxFit.cover)),
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              bottomContainer('Rotation', 150, 130, 110, 150, 288, context),
              bottomContainer('Translation', 149, 2, 17, 119, 0, context),
              bottomContainer('Scaling', 82, 42, 26, 202, 576, context),
              bottomContainer('Concatenation', 19, 19, 27, 241, 864, context),
              Positioned(
                left: 1152,
                bottom: 0,
                child: GestureDetector(
                  onTap: (){
                    // to navigate to he homepage
                    model.goToLandingPage(context);},
                  child:
                  Container(
                    width: MediaQuery.of(context).size.width/5,
                    height:280,
                    color: Color.fromRGBO(92, 127, 184, 1.0),
                    alignment: Alignment.center,
                    child: Text(
                        'Start here', style:GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold, fontSize: 28),
                    )
                    ),
                  ) ,
                  /*bottomContainer('Start here', 92, 127, 184, 280, 1152, context),*/
                ),
              ),

            ],
          ),
        ),
      ),
    ));
  }
}
