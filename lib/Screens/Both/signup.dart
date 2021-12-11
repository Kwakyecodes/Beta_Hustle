//we're not using this anymore

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'text_field.dart';
//
//
// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);
//
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   bool passwordObscure1=true;
//   bool passwordObscure2=true;
//   IconData iconType1=Icons.visibility_outlined;
//   IconData iconType2=Icons.visibility_outlined;
//   var  _value=1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: Container(
//         color:   Color(0XFF6A62B7).withOpacity(0.3),
//         child: SingleChildScrollView(
//
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           //scrollDirection: Axis.vertical,
//
//                child: Container(
//                  child: Column(
//                    children: [
//
//                      Container(
//
//                        child: Stack(
//                          children: [
//                            Container(
//                              padding: EdgeInsets.fromLTRB(12.0, 20.0, 0.0, 0.0),
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  Text(
//                                    'Create an Account',
//                                    style: TextStyle(
//                                        fontFamily: "Lobster",
//                                        color: Colors.blueGrey.shade900,
//                                        fontSize: 30,
//                                        fontWeight: FontWeight.bold
//                                    ),
//                                  ),
//
//                                ],
//
//                              ),
//                            ),
//
//                          ],
//                        ),
//                      ),
//                      Container(
//
//                        padding: EdgeInsets.only(top: 8.0,left: 20.0,right: 30.0),
//                        child: Column(
//                          children: [
//                            CustomTextField(hintName: "First Name",
//                              iconType: Icons.account_circle,
//                              keyboardType: TextInputType.name,),
//                            SizedBox(height: 10,),
//                            CustomTextField(
//                              hintName: "Last Name",
//                              iconType: Icons.account_circle,
//                              keyboardType: TextInputType.name,
//                            ),
//                            SizedBox(height: 10,),
//                            CustomTextField(
//                              hintName: "Phone Number",
//                              keyboardType: TextInputType.phone,
//                              iconType: Icons.phone,
//                            ),
//                            SizedBox(height: 10,),
//                            CustomTextField(
//                              hintName: "Email",
//                              iconType: Icons.email,
//                              keyboardType: TextInputType.emailAddress,
//
//                            ),
//                            SizedBox(height: 10,),
//                            Container(
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.start,
//
//                                children: [
//                                  Padding(
//                                    padding: const EdgeInsets.only(left: 10.0),
//                                    child: Text("Gender",style: TextStyle(
//                                      fontFamily: "Lobster",
//                                      fontWeight: FontWeight.bold,
//                                      fontSize: 18,
//                                    ),),
//                                  ),
//                                  Container(
//                                    margin: EdgeInsets.only(left: 30),
//                                    child: Row(
//                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                      children: [
//                                        Radio(value: 1,
//                                            groupValue: _value,
//                                            onChanged:(value){
//                                              setState(() {
//                                                _value=1;
//
//                                              });
//
//                                            }
//                                        ),
//                                        Text("Male",style: TextStyle(
//                                            fontFamily: "Lobster",
//                                            fontWeight: FontWeight.bold,
//                                            color: Colors.blueGrey,
//                                            fontSize: 16
//                                        ),),
//                                        SizedBox(width: 20,),
//
//                                        Radio(value: 2,
//                                            focusColor: Colors.blueGrey,
//                                            groupValue: _value,
//                                            onChanged: (var value){
//                                              setState(() {
//                                                _value=2;
//                                              });
//                                            }),
//                                        Text("Female",style: TextStyle(
//                                            fontFamily: "Lobster",
//                                            fontWeight: FontWeight.bold,
//                                            color: Colors.blueGrey,
//                                            fontSize: 16
//                                        ),),
//                                      ],
//                                    ),
//                                  )
//                                ],
//
//                              ),
//                            ),
//                            SizedBox(height:10),
//                            Container(
//                              padding: EdgeInsets.only(left:8),
//                              decoration:BoxDecoration(
//                                color: Colors.blueGrey.withOpacity(0.5),
//                                borderRadius: BorderRadius.circular(50),
//                              ),
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                children: [
//                                  Container(
//                                    child: Icon(Icons.lock),
//                                  ),
//                                  Container(
//                                    padding: EdgeInsets.symmetric(vertical: 2),
//                                    width: 225,
//                                    height: 50,
//                                    child: TextField(
//
//                                      decoration: InputDecoration(
//                                        hintText: 'Password',
//                                        hintStyle: TextStyle(
//                                            fontFamily: "Lobster",
//                                            fontWeight: FontWeight.bold,
//                                            color: Colors.white
//                                        ),
//                                        border: InputBorder.none,
//                                        suffixIcon: Container(
//
//                                            child: InkWell(
//                                                onTap: (){
//                                                  if (passwordObscure1==true){
//                                                    setState(() {
//                                                      passwordObscure1= false;
//                                                      iconType1=Icons.visibility_off_outlined;
//                                                    });
//                                                  }
//                                                  else if(passwordObscure1==false){
//                                                    setState(() {
//                                                      passwordObscure1=true;
//                                                      iconType1=Icons.visibility_outlined;
//                                                    });
//                                                  }
//
//                                                },
//                                                child: Icon(iconType1,color: Colors.blueGrey,)
//
//                                            )
//
//                                        ),
//                                      ),
//
//                                      obscureText: passwordObscure1,
//                                    ),
//                                  ),
//                                ],
//
//                              ),
//                            ),
//                            SizedBox(height: 10,),
//                            Container(
//                              padding: EdgeInsets.only(left:8),
//                              decoration:BoxDecoration(
//                                color: Colors.blueGrey.withOpacity(0.5),
//                                borderRadius: BorderRadius.circular(50),
//                              ),
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                children: [
//                                  Container(
//                                    child: Icon(Icons.lock),
//                                  ),
//                                  Container(
//                                    padding: EdgeInsets.symmetric(vertical: 2),
//                                    width: 225,
//                                    height: 50,
//                                    child: TextField(
//
//                                      decoration: InputDecoration(
//
//                                        hintText: 'Confirm Password',
//                                        hintStyle: TextStyle(
//                                            fontFamily: "Lobster",
//                                            fontWeight: FontWeight.bold,
//                                            color: Colors.white
//                                        ),
//                                        border: InputBorder.none,
//                                        suffixIcon: Container(
//
//                                            child: InkWell(
//                                                onTap: (){
//                                                  if (passwordObscure2==true){
//                                                    setState(() {
//                                                      passwordObscure2= false;
//                                                      iconType2=Icons.visibility_off_outlined;
//                                                    });
//                                                  }
//                                                  else if(passwordObscure2==false){
//                                                    setState(() {
//                                                      passwordObscure2=true;
//                                                      iconType2=Icons.visibility_outlined;
//                                                    });
//                                                  }
//
//                                                },
//                                                child: Icon(iconType2,color: Colors.blueGrey,)
//
//                                            )
//
//                                        ),
//                                      ),
//
//                                      obscureText: passwordObscure2,
//                                    ),
//                                  ),
//                                ],
//
//                              ),
//                            ),
//                            SizedBox(height: 10.0,),
//
//                            SizedBox(height: 15,),
//                            Container(
//                              height: 40,
//                              child: Material(
//                                borderRadius: BorderRadius.circular(20.0),
//                                shadowColor: Colors.blue.shade700,
//                                color: Colors.blueGrey.shade900,
//                                elevation:7.0,
//                                child: GestureDetector(
//                                  onTap: (){},
//                                  child: Center(
//                                    child: Text("SIGN UP",style: TextStyle(
//                                      color: Colors.white,
//                                      fontWeight: FontWeight.bold,
//
//                                    ),),
//                                  ),
//                                ),
//                              ),
//                            ),
//                            SizedBox(height: 20,),
//                            Row(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: [
//                                Text("Already have an account?",style: TextStyle(
//                                    fontWeight: FontWeight.w500
//
//                                ),),
//                                SizedBox(width: 5.0,),
//                                InkWell(
//                                  onTap: (){
//                                    Navigator.pop(context);
//
//                                  },
//                                  child: Text("Login",style: TextStyle(
//                                      color: Colors.blueGrey,
//                                      fontWeight: FontWeight.bold
//                                  ),),
//                                ),
//
//                              ],
//                            ),
//                            SizedBox(height: 30,)
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//
//                ),
//         ),
//       ),
//
//     );
//   }
// }
