
import 'package:transformationapp/Models/Navigator.dart';
import 'package:transformationapp/views/pages/landingPage.dart';

import 'baseModel.dart';

class WelcomePageViewModel extends BaseModel{
  //instantiating the navigator class
  NavigatorClass _navigatorClass=NavigatorClass();

  // function to go to the landing page
  goToLandingPage(context){
    _navigatorClass.navigateTo(context, LandingPage());
  }
}