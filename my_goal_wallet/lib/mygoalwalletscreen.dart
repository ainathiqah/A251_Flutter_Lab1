import 'package:flutter/material.dart';

class MyGoalWalletScreen extends StatefulWidget {
  const MyGoalWalletScreen({super.key});

  @override
  State<MyGoalWalletScreen> createState() => _MyGoalWalletScreenState();
}

class _MyGoalWalletScreenState extends State<MyGoalWalletScreen> {
  //Inputs: target amount, saving per week, starting balance.
  TextEditingController targetAmount = TextEditingController();
  TextEditingController saving = TextEditingController();
  TextEditingController balance = TextEditingController();
  String selectGoalType = "Others";

  //Track if a field has an error for border color
  bool targetError = false;
  bool savingError = false;
  bool balanceError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Goal Wallet App',
          style: TextStyle(
            color: Colors.brown.shade900,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amber[50],
        elevation: 0, //remove default shadow (to blend with the backgroud)
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.brown.shade200, width: 3),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            width: 450,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //target amount
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        "Target Amount",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown.shade800,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250, // fixed width for the TextField
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: targetAmount,
                        onChanged: (value) {
                          if (targetError &&
                              double.tryParse(value) != null &&
                              double.tryParse(value)! > 0) {
                            setState(() => targetError = false);
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your target amount",
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: targetError
                                  ? Colors.red.shade400
                                  : Colors.brown.shade400,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: targetError
                                  ? Colors.red.shade400
                                  : Colors.brown.shade400,
                              width: 2,
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/target.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        "Saving per Week",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown.shade800,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: saving,
                        onChanged: (value) {
                          if (savingError &&
                              double.tryParse(value) != null &&
                              double.tryParse(value)! > 0) {
                            setState(() => savingError = false);
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your planning saving / week",
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: savingError
                                  ? Colors.red.shade400
                                  : Colors.brown.shade400,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: savingError
                                  ? Colors.red.shade400
                                  : Colors.brown.shade400,
                              width: 2,
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/saving.png',
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                //balance
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        "Starting Balance",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown.shade800,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: balance,
                        onChanged: (value) {
                          if (balanceError &&
                              double.tryParse(value) != null &&
                              double.tryParse(value)! >= 0) {
                            setState(() => balanceError = false);
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your starting balance",
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: balanceError
                                  ? Colors.red.shade400
                                  : Colors.brown.shade400,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: balanceError
                                  ? Colors.red.shade400
                                  : Colors.brown.shade400,
                              width: 2,
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/start.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                Row(
                  children: [
                    Text(
                      "Goal Type",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown.shade800,
                      ),
                    ),
                    SizedBox(width: 45),
                    DropdownButton<String>(
                      value: selectGoalType,
                      items:
                          <String>[
                            'Emergency Funds',
                            'Vacation',
                            'Gadget',
                            'Education',
                            'Others',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 14),
                              ),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        selectGoalType = newValue!;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => calculateWeeks(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown.shade800, // brown color
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                      ),
                      child: Text(
                        'Calculate',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        targetAmount.clear();
                        saving.clear();
                        balance.clear();
                        selectGoalType = 'Others';
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown.shade800, // brown color
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                      ),
                      child: Text(
                        'Reset',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateWeeks() {
    setState(() {
      targetError = false;
      savingError = false;
      balanceError = false;
    });

    double target = double.tryParse(targetAmount.text) ?? 0; //must be >0
    double savePerWeek = double.tryParse(saving.text) ?? 0; //must be >0
    double? startBalance = double.tryParse(balance.text); //allow 0

    bool hasError = false;

    if (target <= 0) {
      targetError = true;
      hasError = true;
    }

    if (savePerWeek <= 0) {
      savingError = true;
      hasError = true;
    }

    if (startBalance == null || startBalance < 0) {
      balanceError = true;
      hasError = true;
    }

    if (hasError) {
      setState(() {});
      return;
    }

    double remaining = target - startBalance!;

    if (remaining <= 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.amber[50],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(
            "Goal Status",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.brown.shade800,
            ),
          ),
          content: Text(
            "You already reached your target",
            style: TextStyle(fontSize: 14, color: Colors.brown.shade900),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK", style: TextStyle(color: Colors.brown.shade800)),
            ),
          ],
        ),
      );
    }

    double exactWeeks = remaining / savePerWeek;
    int fullWeeks = exactWeeks.floor();
    int extraDays = ((exactWeeks - fullWeeks) * 7).ceil();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.amber[50],
        title: Text(
          "Goal Calculation Result",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.brown.shade800,
          ),
        ),
        content: Text(
          "Weeks needed to reach RM ${target.toStringAsFixed(2)} for $selectGoalType:\n"
          "$fullWeeks week(s) + $extraDays day(s)",
          style: TextStyle(fontSize: 14, color: Colors.brown.shade900),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown.shade800, // brown color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'OK',
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
