import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangement_task/screens/screen2.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  TextEditingController mobilNumberInput = TextEditingController();
  TextEditingController imageUrlInput = TextEditingController();

  @override
  bool isChecked = false;
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Model(),
        child:
      Scaffold(
      backgroundColor: const Color(0xffDAD2BC),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30,
                        color: Color(0xFF4E4D51),
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF4E4D51), // optional
                      decorationThickness: 2, // optional
                      decorationStyle: TextDecorationStyle.solid, // optional
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: nameInput,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                      hintText: 'Enter Full Name',
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: emailInput,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                      hintText: 'Enter E-mail',
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: mobilNumberInput,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mobil Number',
                      hintText: 'Enter Mobil Number',
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: imageUrlInput,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Image URL',
                      hintText: 'Enter Image URL',
                    ),
                  ),
                  SizedBox(height: 15,),
                  Selector<Model, bool>(
                    selector: (context, model) => model.showPassword,
                    builder: (context, showPassword, child) {
                      return TextField(
                        obscureText: showPassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {
                              Provider.of<Model>(context, listen: false).changeVisibility();
                            },
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                        ),
                      );
                    },
                  ),


                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Checkbox( value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },),
                      Text('I agree with ' , style: TextStyle(fontSize: 15),),
                      Text(
                        'Terms & Services',
                        style: TextStyle(fontSize: 15,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF0A0A0B), // optional
                          decorationThickness: 2, // optional
                          decorationStyle: TextDecorationStyle.solid, // optional
                        ),
                      ),
                      Text(' of Row Mart ' , style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Screen2( name: nameInput.text, email: emailInput.text, mobilNumber: mobilNumberInput.text,image: imageUrlInput.text,)));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFC2B6A1),
                      ),
                      child:   Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 25,
                          color: Color(0xFF4E4D51),
                          fontWeight: FontWeight.w500,
                          decorationColor: Color(0xFF0A0A0B), // optional
                          decorationThickness: 2, // optional
                          // optional
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          )
      ),
    ));
  }
}
class Model extends ChangeNotifier {
  bool visibility = true;

  bool get showPassword => visibility;

  void changeVisibility() {
    visibility = false;
    notifyListeners();
  }

}