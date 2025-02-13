import 'package:flutter/material.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AboutUs"),backgroundColor: Colors.blueAccent,),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Make the container circular
                  image: DecorationImage(
                    image: AssetImage('assets/images/dp.jpg'),
                    fit: BoxFit.cover, // Ensure the image fits within the circle
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(child: Text("Het Bhuva" , style: TextStyle(fontFamily: 'Poppins' ,color: Colors.pink , fontSize: 20),)),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Meet Our Team",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Colors.pink,
                  width: 2,
                ),
              ),
              elevation: 4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Developed By:",
                            style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold ,color: Colors.pink),
                          ),
                        ),
                        Expanded(flex: 3,child: Text("Het Bhuva(23010101034)" , style: TextStyle(fontFamily: 'Poppins'),)),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Mentored By:",
                            style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold ,color: Colors.pink),
                          ),
                        ),
                        Expanded(flex: 3,child: Text("Prof. Mehul Bhundiya(Computer Engineering Department), School of Computer Science" , style: TextStyle(fontFamily: 'Poppins'),)),
                      ],
                    ),
                    SizedBox(height: 20,),

                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Explored By:",
                            style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold ,color: Colors.pink),
                          ),
                        ),
                        Expanded(flex: 3,child: Text("ASWDC , School of Computer Science" , style: TextStyle(fontFamily: 'Poppins'),)),
                      ],
                    ),

                    SizedBox(height: 20,),

                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Eulogized By:",
                            style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold ,color: Colors.pink),
                          ),
                        ),
                        Expanded(flex: 3,child: Text("Darshan University , Rajkot , Gujarat - INDIA" , style: TextStyle(fontFamily: 'Poppins'),)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "About ASWDC",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Colors.pink,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(child: Image.asset('assets/images/darshanlogo-removebg-preview.png' , height: 180, width: 180,)),
                        Expanded(child: Image.asset('assets/images/aswdc.png' , height: 180, width: 180,))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Expanded(child: Text("ASWDC is Application,Software and Website Development Center @ Darshan University run by Students and Staff of School of Computer Science." , style: TextStyle(fontFamily: 'Poppins'),)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Expanded(child: Text("Sole Purpose of ASWDC is to bridge gap between university curriculum & industry demands. Students learn cutting edge technologies, develop real world application & experience professional environment @ ASWDC under guidance of industry experts & faculty members." , style: TextStyle(fontFamily: 'Poppins'),)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Contact Us",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Colors.pink,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Icon(Icons.email_outlined , color: Colors.pink,)],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Text("aswdc@darshan.ac.in" , style: TextStyle(fontFamily: 'Poppins'),)],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Icon(Icons.phone_outlined , color: Colors.pink,)],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Text("+91-9727747317" , style: TextStyle(fontFamily: 'Poppins'),)],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Icon(Icons.blur_circular_outlined , color: Colors.pink,)],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Text("www.darshan.ac.in" , style: TextStyle(fontFamily: 'Poppins'),)],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Colors.pink,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Icon(Icons.share_outlined , color: Colors.pink,)],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Text("Share App" , style: TextStyle(fontFamily: 'Poppins'),)],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Icon(Icons.apps , color: Colors.pink,)],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Text("More Apps" , style: TextStyle(fontFamily: 'Poppins'),)],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Icon(Icons.star_border , color: Colors.pink,)],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Text("Rate Us" , style: TextStyle(fontFamily: 'Poppins'),)],
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Icon(Icons.thumb_up_alt_outlined , color: Colors.pink,)],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Text("Like Us on Facebook" , style: TextStyle(fontFamily: 'Poppins'),)],
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Icon(Icons.update , color: Colors.pink,)],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Text("Check for Update" , style: TextStyle(fontFamily: 'Poppins'),)],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text("© 2025 Darshan University" , style: TextStyle(fontFamily: 'Font1'),),
            Text("All Right Reserverd - Privacy Policy" ,  style: TextStyle(fontFamily: 'Font1')),
            Text("Made With 💖 in INDIA" , style: TextStyle(fontFamily: 'Font1')),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
