import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas_ubah/tugas6/cubits/cubit/login_cubit.dart';
import 'package:tugas_ubah/tugas6/screens/login.dart';
import 'package:tugas_ubah/tugas6/screens/regist.dart';

// import '../cubits/cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome On Board"),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('asset/image/Login_Assets.jpg'),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(width: 0.5),
                      fixedSize: Size(double.infinity, 40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_circle_left_outlined,
                          color: Colors.black),
                      Text(
                        "Sign In",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text('')
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(width: 0.5),
                      fixedSize: Size(double.infinity, 40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_circle_left_outlined,
                          color: Colors.black),
                      Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text('')
                    ],
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont Have Account ? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text(
                    "Signup",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                Text("Or"),
                Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("Login With Social Account"),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Not Implemented - Twitter')),
                    );
                  },
                  child: Placeholder(
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Color.fromARGB(0, 255, 255, 255),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Not Implemented - Google')),
                    );
                  },
                  child: Placeholder(
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Color.fromARGB(0, 255, 255, 255),
                    ),
                  ),
                ),
                Placeholder(
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Not Implemented - Facebook')),
                      );
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Color.fromARGB(0, 255, 255, 255),
                      // child: Text("asd"),
                    ),
                  ),
                ),
              ],
            )
            // Placeholder(
            //   child: Container(
            //     child: Center(child: Text("Not Implemented")),
            //     width: double.infinity,
            //     height: 30,
            //   ),
            // )
          ],
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text("Welcome",
      //           style:
      //               TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
      //       Text("Already have Account"),
      //       Padding(
      //         padding: const EdgeInsets.only(left: 10, right: 10),
      //         child: SizedBox(
      //           width: double.infinity,
      //           child: ElevatedButton(
      //             onPressed: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => LoginPage()),
      //               );
      //             },
      //             child: Text("Login"),
      //             style: ElevatedButton.styleFrom(
      //               backgroundColor: Color.fromARGB(255, 4, 114, 204),
      //             ),
      //           ),
      //         ),
      //       ),
      //       Text("Dont Have Account"),
      //       Padding(
      //         padding: const EdgeInsets.only(left: 10, right: 10),
      //         child: SizedBox(
      //             width: double.infinity,
      //             child: ElevatedButton(
      //               onPressed: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => RegisterScreen()),
      //                 );
      //               },
      //               child: Text("Daftar"),
      //               style: ElevatedButton.styleFrom(
      //                 backgroundColor: Color.fromARGB(255, 4, 114, 204),
      //               ),
      //             )),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
