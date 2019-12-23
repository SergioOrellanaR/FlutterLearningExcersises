import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferences/src/pages/HomePage.dart';

class UserPreferences 
{
//////////////////////////////Implementación Singleton//////////////////////
  static final UserPreferences _instance = new UserPreferences._private();

  factory UserPreferences(){
    return _instance;
  }

  UserPreferences._private();

///////////////////////////////////////////////////////////////////////////

  SharedPreferences _prefs;

  initPrefs() async
  {
    this._prefs = await SharedPreferences.getInstance();
  }

  get gender 
  {
    //Doble signo de interrogación para preguntar si es NULL
    return _prefs.getInt("gender")?? 1;
  }
  set gender(int value)
  {
    _prefs.setInt("gender", value);
  }

  get secondaryColor 
  {
    //Doble signo de interrogación para preguntar si es NULL
    return _prefs.getBool("secondaryColor")?? false;
  }
  set secondaryColor(bool value)
  {
    _prefs.setBool("secondaryColor", value);
  }

  get name 
  {
    //Doble signo de interrogación para preguntar si es NULL
    return _prefs.getString("name")?? "";
  }
  set name(String value)
  {
    _prefs.setString("name", value);
  }

  get lastPageOpened 
  {
    //Doble signo de interrogación para preguntar si es NULL
    return _prefs.getString("lastPageOpened") ?? HomePage.routeName;
  }
  set lastPageOpened(String value)
  {
    _prefs.setString("lastPageOpened", value);
  }


  

  //Estas propiedades no se utilizan
  // bool    _secondaryColor;
  // int     _gender;
  // String  _name;


  
}