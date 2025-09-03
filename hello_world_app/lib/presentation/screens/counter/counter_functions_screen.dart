import "package:flutter/material.dart";

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Counter Function'),
        actions: [
          IconButton(
            onPressed: () => {
              setState(() {
                clickCounter = 0;
              }),
            },
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              'Click${clickCounter == 1 ? 's' : ''}',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButtom(
            icon: Icons.refresh_outlined,
            onPressed: () => {
              setState(() {
                clickCounter = 0;
              }),
            },
          ),

          SizedBox(height: 10),

          CustomButtom(
            icon: Icons.plus_one,
            onPressed: () => {
              setState(() {
                clickCounter++;
              }),
            },
          ),

          SizedBox(height: 10),

          CustomButtom(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () => {
              setState(() {
                if (clickCounter <= 0) return;
                clickCounter--;
              }),
            },
          ),
        ],
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButtom({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //shape: const StadiumBorder(), Material3
      enableFeedback: true,
      elevation: 5,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
