import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:nvme/router.dart';
import 'package:nvme/ui/helper/app_dimen.dart';
import 'package:nvme/ui/helper/app_view_helper.dart';
import 'package:nvme/ui/widgets/customDrawer.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Widget roundedButton() {
    return Container(
      height: hDimen(40),
      width: hDimen(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            hDimen(50),
          ),
        ),
        elevation: 2,
        child: Center(
          child: Icon(
            Icons.view_headline,
            size: hDimen(35),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget circularImage() {
    return Container(
      height: hDimen(35),
      width: hDimen(35),
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 0.0,
        ),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Image.asset(
            "assets/profile.jpg",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget circularLogo() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: hDimen(40),
            width: hDimen(40),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: hDimen(40),
            width: hDimen(40),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepOrange[900].withOpacity(0.68),
            ),
          ),
        ),
      ],
    );
  }

  Widget masterCardIcon() {
    return Container(
      height: hDimen(40),
      width: hDimen(70),
      child: Stack(
        children: [
          circularLogo(),
          Center(
            child: Text(
              "MasterCard",
              style: TextStyle(
                color: Colors.white,
                fontSize: hDimen(12),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cvvContainer({String Cvv}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "CVV",
          style: TextStyle(
            color: Colors.white,
            fontSize: hDimen(13),
            fontWeight: FontWeight.bold,
          ),
        ),
        hSpacing(hDimen(10)),
        Container(
          height: hDimen(25),
          width: hDimen(50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(hDimen(5)),
          ),
          child: Center(
            child: Text(
              Cvv,
              style: TextStyle(
                fontSize: hDimen(15),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget debitCardWidget({
    String cardNo,
    String name,
    String CVV,
    String validFromDate,
    String validToDate,
  }) {
    return Container(
      height: hDimen(150),
      padding: EdgeInsets.only(
        top: hDimen(10),
        left: hDimen(15),
        right: hDimen(15),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(hDimen(20)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.red[600],
                Colors.orange,
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.check_circle_rounded,
                size: hDimen(20),
                color: Colors.yellow,
              ),
              hSpacing(hDimen(20)),
              Text(
                cardNo,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: hDimen(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              hSpacing(hDimen(20)),
              masterCardIcon(),
            ],
          ),
          vSpacing(hDimen(10)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: hDimen(25),
                width: hDimen(35),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(hDimen(5)),
                ),
              ),
              hSpacing(hDimen(20)),
              Text(
                "Valid FROM",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: hDimen(13),
                  fontWeight: FontWeight.bold,
                ),
              ),
              hSpacing(hDimen(10)),
              Text(
                validFromDate,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: hDimen(12),
                  fontWeight: FontWeight.bold,
                ),
              ),
              hSpacing(hDimen(20)),
              Text(
                "Valid UPTO",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: hDimen(13),
                  fontWeight: FontWeight.bold,
                ),
              ),
              hSpacing(hDimen(10)),
              Text(
                validToDate,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: hDimen(12),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          vSpacing(hDimen(20)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: hDimen(14),
                  fontWeight: FontWeight.bold,
                ),
              ),
              cvvContainer(Cvv: "789"),
            ],
          )
        ],
      ),
    );
  }

  bool isVisaCardSelected = false;

  Widget visaCard({
    String cardNo,
  }) {
    return Container(
      height: hDimen(60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          hDimen(10),
        ),
        color: Colors.transparent,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(hDimen(10)),
        ),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.only(
            left: hDimen(15),
            right: hDimen(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisaCardSelected = !isVisaCardSelected;
                      });
                    },
                    child: Container(
                      height: hDimen(15),
                      width: hDimen(15),
                      decoration: BoxDecoration(
                        color: isVisaCardSelected
                            ? Colors.deepOrange
                            : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              isVisaCardSelected ? Colors.yellow : Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  hSpacing(hDimen(20)),
                  Text(
                    cardNo,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: hDimen(16),
                    ),
                  ),
                ],
              ),
              Container(
                height: hDimen(50),
                width: hDimen(50),
                child: Image.asset(
                  "assets/visa.png",
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget upiContainer({
    String imgPath,
    String paymentMethodName,
    Color methodColor,
  }) {
    return Container(
      height: hDimen(70),
      width: hDimen(110),
      padding: EdgeInsets.only(
        top: hDimen(10),
        bottom: hDimen(10),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[400],
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(
          hDimen(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: hDimen(34),
            width: hDimen(50),
            child: Image.asset(
              imgPath,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            paymentMethodName,
            style: TextStyle(
              color: methodColor,
              fontSize: hDimen(13),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget containerCOD() {
    return Container(
      padding: EdgeInsets.only(
        left: hDimen(20),
      ),
      height: hDimen(60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(hDimen(15)),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isVisaCardSelected = !isVisaCardSelected;
              });
            },
            child: Container(
              height: hDimen(15),
              width: hDimen(15),
              decoration: BoxDecoration(
                color: isVisaCardSelected ? Colors.deepOrange : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isVisaCardSelected ? Colors.yellow : Colors.grey,
                  width: 1,
                ),
              ),
            ),
          ),
          hSpacing(hDimen(20)),
          Text(
            "Cash On Delivery",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: hDimen(16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: CustomDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Center(
              child: Text(
                "Payment",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: hDimen(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            hSpacing(hDimen(100)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: Colors.black,
                  size: hDimen(28),
                ),
                hSpacing(hDimen(5)),
                Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                  size: hDimen(28),
                ),
                hSpacing(hDimen(5)),
                Icon(
                  Linecons.cog,
                  color: Colors.black,
                  size: hDimen(25),
                ),
                hSpacing(hDimen(5)),
                circularImage(),
                hSpacing(hDimen(5))
              ],
            )
          ],
          leading: Builder(
            builder: (context) {
              return GestureDetector(
                child: roundedButton(),
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: hDimen(15),
            right: hDimen(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              vSpacing(hDimen(20)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saved Cards",
                    style: TextStyle(
                      fontSize: hDimen(17),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.orange,
                        size: hDimen(20),
                      ),
                      hSpacing(hDimen(5)),
                      Text(
                        "Add New Card",
                        style: TextStyle(
                          fontSize: hDimen(14),
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              vSpacing(hDimen(10)),
              debitCardWidget(
                name: "Lisa Melanie",
                cardNo: "XXXX  XXXX  XXXX  1234",
                CVV: "789",
                validFromDate: '07/20',
                validToDate: '07/22',
              ),
              vSpacing(hDimen(20)),
              Text(
                "Select Another Payment Method",
                style: TextStyle(
                  fontSize: hDimen(17),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              vSpacing(hDimen(10)),
              visaCard(cardNo: "XXXX XXXX XXXX 2567"),
              vSpacing(hDimen(20)),
              Text(
                "UPI",
                style: TextStyle(
                  fontSize: hDimen(17),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              vSpacing(hDimen(10)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  upiContainer(
                    imgPath: "assets/G-Pay.png",
                    methodColor: Colors.yellow[800],
                    paymentMethodName: "Google Pay",
                  ),
                  hSpacing(hDimen(10)),
                  upiContainer(
                    imgPath: "assets/phonePay.jfif",
                    methodColor: Colors.yellow[800],
                    paymentMethodName: "Phone Pay",
                  ),
                  hSpacing(hDimen(10)),
                  upiContainer(
                    imgPath: "assets/sbi.png",
                    methodColor: Colors.blue[700],
                    paymentMethodName: "SBI",
                  ),
                ],
              ),
              vSpacing(hDimen(20)),
              Text(
                "Wallet",
                style: TextStyle(
                  fontSize: hDimen(17),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              vSpacing(hDimen(10)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  upiContainer(
                    imgPath: "assets/payTm.png",
                    methodColor: Colors.yellow[800],
                    paymentMethodName: "Paytm",
                  ),
                  hSpacing(hDimen(10)),
                  upiContainer(
                    imgPath: "assets/amazon-pay.png",
                    methodColor: Colors.yellow[800],
                    paymentMethodName: "Amazon Pay",
                  ),
                  hSpacing(hDimen(10)),
                  upiContainer(
                    imgPath: "assets/phonePay.jfif",
                    methodColor: Colors.yellow[800],
                    paymentMethodName: "Phone Pay",
                  ),
                ],
              ),
              vSpacing(hDimen(20)),
              containerCOD(),
              vSpacing(hDimen(20)),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(MVVMRouter.ROUTE_INITIAL,);
                },
                child: Container(
                  height: hDimen(45),
                  // width: hDimen(200),
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(
                      hDimen(20),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pay",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: hDimen(15),
                        ),
                      ),
                      Text(
                        "\$255.50",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: hDimen(15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
