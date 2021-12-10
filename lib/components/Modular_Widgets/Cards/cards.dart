import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

class GBloxCards extends StatefulWidget {
  @required
  late int backgroundColor;
  @required
  late String svg;
  @required
  late String text;
  @required
  late Color textBackgroundColor;
  @required
  late final Function? pressed;
  GBloxCards(
      {Key? key,
      this.backgroundColor = 0xff060841,
      this.text = "Code",
      this.pressed,
      this.textBackgroundColor = Colors.orange,
      this.svg =
          '''<svg xmlns="http://www.w3.org/2000/svg" width="453" height="309.287" viewBox="0 0 453 309.287">
  <path id="Path_1361" data-name="Path 1361" d="M18.886,0H433.124c10.431,0,18.886,6,18.886,13.408v282.47c0,7.405-8.456,13.408-18.886,13.408H18.886c-10.431,0-18.886-6-18.886-13.408V13.408C0,6,8.456,0,18.886,0Z" transform="translate(0.495)" fill="#080c72"/>
  <path id="Rectangle_577" data-name="Rectangle 577" d="M14,0H439a14,14,0,0,1,14,14V40a0,0,0,0,1,0,0H0a0,0,0,0,1,0,0V14A14,14,0,0,1,14,0Z" fill="#4c97ff"/>
  <g id="Group_530" data-name="Group 530" transform="translate(153.328 92.453)">
    <g id="Group_474" data-name="Group 474" transform="translate(0 0)">
      <path id="Path_275" data-name="Path 275" d="M991.115,199.432V336.875h79.2V329.24h-46.429v-91.5h46.429v-38.31Z" transform="translate(-991.115 -199.432)" fill="#4c97ff"/>
      <path id="Path_273" data-name="Path 273" d="M172.454,376.333H91.1L86.74,380.4H71.249l-3.107-4.067H51.58V352H68.142l3.107,4.048H86.74L91.1,352h81.355Z" transform="translate(-18.856 -322.228)" fill="#d51cd5"/>
      <path id="Path_274" data-name="Path 274" d="M240.752,376.333H91.1L86.74,380.4H71.249l-3.107-4.067H51.58V352H68.142l3.107,4.048H86.74L91.1,352H240.752Z" transform="translate(-18.856 -298.728)" fill="#efca0f"/>
      <path id="Path_1253" data-name="Path 1253" d="M143.4,376.333H91.1L86.74,380.4H71.249l-3.107-4.067H51.58V352H68.142l3.107,4.048H86.74L91.1,352h52.3Z" transform="translate(-18.856 -250.022)" fill="#8100ff"/>
      <path id="Path_1252" data-name="Path 1252" d="M202.8,376.333H91.1L86.74,380.4H71.249l-3.107-4.067H51.58V352H68.142l3.107,4.048H86.74L91.1,352H202.8Z" transform="translate(-18.856 -274.691)" fill="#fe8013"/>
    </g>
  </g>
  <ellipse id="Ellipse_172" data-name="Ellipse 172" cx="7" cy="7" rx="7" ry="7" transform="translate(22 13)" fill="#dd0a18"/>
  <ellipse id="Ellipse_173" data-name="Ellipse 173" cx="7" cy="7" rx="7" ry="7" transform="translate(45 13)" fill="#efca0f"/>
  <ellipse id="Ellipse_174" data-name="Ellipse 174" cx="7" cy="7" rx="7" ry="7" transform="translate(68 13)" fill="#40bf4a"/>
  <g id="Group_528" data-name="Group 528" transform="translate(22 76.413)">
    <path id="Path_357" data-name="Path 357" d="M1.408,0H64.38c.777,0,1.408.389,1.408.87V21.163c0,.48-.63.87-1.408.87H1.408C.63,22.033,0,21.644,0,21.163V.87C0,.389.63,0,1.408,0Z" transform="translate(0 0)" fill="#fa857b" stroke="#0000dc" stroke-width="2"/>
    <path id="Path_364" data-name="Path 364" d="M1.408,0H64.38c.777,0,1.408.389,1.408.87V21.163c0,.48-.63.87-1.408.87H1.408C.63,22.033,0,21.644,0,21.163V.87C0,.389.63,0,1.408,0Z" transform="translate(0 88.132)" fill="#4cbfe6" stroke="#0000dc" stroke-width="2"/>
    <path id="Path_358" data-name="Path 358" d="M1.408,0H64.38c.777,0,1.408.389,1.408.87V21.163c0,.48-.63.87-1.408.87H1.408C.63,22.033,0,21.644,0,21.163V.87C0,.389.63,0,1.408,0Z" transform="translate(0 22.033)" fill="#dd0a18" stroke="#0000dc" stroke-width="2"/>
    <path id="Path_363" data-name="Path 363" d="M1.408,0H64.38c.777,0,1.408.389,1.408.87V21.163c0,.48-.63.87-1.408.87H1.408C.63,22.033,0,21.644,0,21.163V.87C0,.389.63,0,1.408,0Z" transform="translate(0 109.417)" fill="#8d00e8" stroke="#0000dc" stroke-width="2"/>
    <path id="Path_359" data-name="Path 359" d="M1.408,0H64.38c.777,0,1.408.389,1.408.87V21.163c0,.48-.63.87-1.408.87H1.408C.63,22.033,0,21.644,0,21.163V.87C0,.389.63,0,1.408,0Z" transform="translate(0 44.066)" fill="#40bf4a" stroke="#0000dc" stroke-width="2"/>
    <path id="Path_362" data-name="Path 362" d="M1.408,0H64.38c.777,0,1.408.389,1.408.87V21.163c0,.48-.63.87-1.408.87H1.408C.63,22.033,0,21.644,0,21.163V.87C0,.389.63,0,1.408,0Z" transform="translate(0 131.45)" fill="#f5f87c" stroke="#0000dc" stroke-width="2"/>
    <path id="Path_1369" data-name="Path 1369" d="M1.408,0H64.38c.777,0,1.408.389,1.408.87V21.163c0,.48-.63.87-1.408.87H1.408C.63,22.033,0,21.644,0,21.163V.87C0,.389.63,0,1.408,0Z" transform="translate(0 183.45)" fill="#0000dc" stroke="#0000dc" stroke-width="2"/>
    <path id="Path_360" data-name="Path 360" d="M1.408,0H64.38c.777,0,1.408.389,1.408.87V21.163c0,.48-.63.87-1.408.87H1.408C.63,22.033,0,21.644,0,21.163V.87C0,.389.63,0,1.408,0Z" transform="translate(0 66.099)" fill="#efca0f" stroke="#0000dc" stroke-width="2"/>
  </g>
</svg>
'''});
  @override
  State<StatefulWidget> createState() {
    return _GBloxCardsState();
  }
}

class _GBloxCardsState extends State<GBloxCards> {
  late Widget card = Container();
  _GBloxCardsState();
  @override
  void initState() {
    super.initState();

    card = InkWell(
        customBorder: const BeveledRectangleBorder(
            side: BorderSide(color: Colors.red, width: 50),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0))),
        onTap: () {
          widget.pressed!();
        },
        child: Container(
          height: 200,
          width: 200,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: Color(widget.backgroundColor),
                  shape: const BeveledRectangleBorder(
                      side: BorderSide(color: Color(0xff0000dc), width: 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0))),
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Color(widget.backgroundColor),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              color: Color(widget.backgroundColor),
                              child: SvgPicture.string(widget.svg,
                                  height: 120,
                                  clipBehavior: Clip.none,
                                  fit: BoxFit.cover)),
                          Container(
                              clipBehavior: Clip.antiAlias,
                              width: 500,
                              alignment: Alignment.center,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: widget.textBackgroundColor,
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text(
                                widget.text,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                              ).tr())
                        ]),
                  ))),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return (Container(child: card));
  }
}
