library gblox_mobile.shapes;

import 'package:flutter/material.dart';
import '../global_variables.dart' as global;

class Triangle {
  @override
  Path returnPath() {
    Size size =
        Size(global.device_size.width * 0.3, global.device_size.height * 0.6);
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5366304, size.height * 0.09391042);
    path_1.cubicTo(
        size.width * 0.5333048,
        size.height * 0.09391042,
        size.width * 0.5250352,
        size.height * 0.09496407,
        size.width * 0.5200854,
        size.height * 0.1047248);
    path_1.lineTo(size.width * 0.07096475, size.height * 0.9903302);
    path_1.cubicTo(
        size.width * 0.06605591,
        size.height * 1.000010,
        size.width * 0.06937747,
        size.height * 1.008523,
        size.width * 0.07103335,
        size.height * 1.011735);
    path_1.cubicTo(
        size.width * 0.07268933,
        size.height * 1.014946,
        size.width * 0.07760960,
        size.height * 1.022414,
        size.width * 0.08750983,
        size.height * 1.022414);
    path_1.lineTo(size.width * 0.9857512, size.height * 1.022414);
    path_1.cubicTo(
        size.width * 0.9956516,
        size.height * 1.022414,
        size.width * 1.000572,
        size.height * 1.014946,
        size.width * 1.002228,
        size.height * 1.011735);
    path_1.cubicTo(
        size.width * 1.003884,
        size.height * 1.008523,
        size.width * 1.007205,
        size.height * 1.000010,
        size.width * 1.002296,
        size.height * 0.9903302);
    path_1.lineTo(size.width * 0.5531756, size.height * 0.1047248);
    path_1.cubicTo(
        size.width * 0.5482258,
        size.height * 0.09496407,
        size.width * 0.5399561,
        size.height * 0.09391042,
        size.width * 0.5366304,
        size.height * 0.09391042);
    path_1.moveTo(size.width * 0.5366305, size.height * 0.05816166);
    path_1.cubicTo(
        size.width * 0.5538159,
        size.height * 0.05816166,
        size.width * 0.5710012,
        size.height * 0.06777438,
        size.width * 0.5807510,
        size.height * 0.08699970);
    path_1.lineTo(size.width * 1.029872, size.height * 0.9726050);
    path_1.cubicTo(
        size.width * 1.049209,
        size.height * 1.010736,
        size.width * 1.024752,
        size.height * 1.058163,
        size.width * 0.9857512,
        size.height * 1.058163);
    path_1.lineTo(size.width * 0.08750983, size.height * 1.058163);
    path_1.cubicTo(
        size.width * 0.04850875,
        size.height * 1.058163,
        size.width * 0.02405170,
        size.height * 1.010736,
        size.width * 0.04338944,
        size.height * 0.9726050);
    path_1.lineTo(size.width * 0.4925100, size.height * 0.08699970);
    path_1.cubicTo(
        size.width * 0.5022598,
        size.height * 0.06777438,
        size.width * 0.5194452,
        size.height * 0.05816166,
        size.width * 0.5366305,
        size.height * 0.05816166);
    path_1.close();

    return path_1;
  }
}

class Circle {
  Path returnPath() {
    Size size =
        Size(global.device_size.width * 0.3, global.device_size.height * 0.6);
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5000000, size.height * 0.03289474);
    path_1.cubicTo(
        size.width * 0.4369267,
        size.height * 0.03289474,
        size.width * 0.3757575,
        size.height * 0.04524030,
        size.width * 0.3181916,
        size.height * 0.06958861);
    path_1.cubicTo(
        size.width * 0.2905208,
        size.height * 0.08129240,
        size.width * 0.2638297,
        size.height * 0.09578022,
        size.width * 0.2388600,
        size.height * 0.1126494);
    path_1.cubicTo(
        size.width * 0.2141189,
        size.height * 0.1293642,
        size.width * 0.1908523,
        size.height * 0.1485611,
        size.width * 0.1697067,
        size.height * 0.1697067);
    path_1.cubicTo(
        size.width * 0.1485611,
        size.height * 0.1908523,
        size.width * 0.1293642,
        size.height * 0.2141189,
        size.width * 0.1126494,
        size.height * 0.2388600);
    path_1.cubicTo(
        size.width * 0.09578022,
        size.height * 0.2638297,
        size.width * 0.08129240,
        size.height * 0.2905208,
        size.width * 0.06958861,
        size.height * 0.3181916);
    path_1.cubicTo(
        size.width * 0.04524030,
        size.height * 0.3757575,
        size.width * 0.03289474,
        size.height * 0.4369267,
        size.width * 0.03289474,
        size.height * 0.5000000);
    path_1.cubicTo(
        size.width * 0.03289474,
        size.height * 0.5630733,
        size.width * 0.04524030,
        size.height * 0.6242425,
        size.width * 0.06958861,
        size.height * 0.6818084);
    path_1.cubicTo(
        size.width * 0.08129240,
        size.height * 0.7094792,
        size.width * 0.09578022,
        size.height * 0.7361703,
        size.width * 0.1126494,
        size.height * 0.7611400);
    path_1.cubicTo(
        size.width * 0.1293642,
        size.height * 0.7858811,
        size.width * 0.1485611,
        size.height * 0.8091477,
        size.width * 0.1697067,
        size.height * 0.8302933);
    path_1.cubicTo(
        size.width * 0.1908523,
        size.height * 0.8514389,
        size.width * 0.2141189,
        size.height * 0.8706358,
        size.width * 0.2388600,
        size.height * 0.8873506);
    path_1.cubicTo(
        size.width * 0.2638297,
        size.height * 0.9042198,
        size.width * 0.2905208,
        size.height * 0.9187076,
        size.width * 0.3181916,
        size.height * 0.9304113);
    path_1.cubicTo(
        size.width * 0.3757575,
        size.height * 0.9547597,
        size.width * 0.4369267,
        size.height * 0.9671053,
        size.width * 0.5000000,
        size.height * 0.9671053);
    path_1.cubicTo(
        size.width * 0.5630733,
        size.height * 0.9671053,
        size.width * 0.6242425,
        size.height * 0.9547597,
        size.width * 0.6818084,
        size.height * 0.9304113);
    path_1.cubicTo(
        size.width * 0.7094792,
        size.height * 0.9187076,
        size.width * 0.7361703,
        size.height * 0.9042198,
        size.width * 0.7611400,
        size.height * 0.8873506);
    path_1.cubicTo(
        size.width * 0.7858811,
        size.height * 0.8706358,
        size.width * 0.8091477,
        size.height * 0.8514389,
        size.width * 0.8302933,
        size.height * 0.8302933);
    path_1.cubicTo(
        size.width * 0.8514389,
        size.height * 0.8091477,
        size.width * 0.8706358,
        size.height * 0.7858811,
        size.width * 0.8873506,
        size.height * 0.7611400);
    path_1.cubicTo(
        size.width * 0.9042198,
        size.height * 0.7361703,
        size.width * 0.9187076,
        size.height * 0.7094792,
        size.width * 0.9304113,
        size.height * 0.6818084);
    path_1.cubicTo(
        size.width * 0.9547597,
        size.height * 0.6242425,
        size.width * 0.9671053,
        size.height * 0.5630733,
        size.width * 0.9671053,
        size.height * 0.5000000);
    path_1.cubicTo(
        size.width * 0.9671053,
        size.height * 0.4369267,
        size.width * 0.9547597,
        size.height * 0.3757575,
        size.width * 0.9304113,
        size.height * 0.3181916);
    path_1.cubicTo(
        size.width * 0.9187076,
        size.height * 0.2905208,
        size.width * 0.9042198,
        size.height * 0.2638297,
        size.width * 0.8873506,
        size.height * 0.2388600);
    path_1.cubicTo(
        size.width * 0.8706358,
        size.height * 0.2141189,
        size.width * 0.8514389,
        size.height * 0.1908523,
        size.width * 0.8302933,
        size.height * 0.1697067);
    path_1.cubicTo(
        size.width * 0.8091477,
        size.height * 0.1485611,
        size.width * 0.7858811,
        size.height * 0.1293642,
        size.width * 0.7611400,
        size.height * 0.1126494);
    path_1.cubicTo(
        size.width * 0.7361703,
        size.height * 0.09578022,
        size.width * 0.7094792,
        size.height * 0.08129240,
        size.width * 0.6818084,
        size.height * 0.06958861);
    path_1.cubicTo(
        size.width * 0.6242425,
        size.height * 0.04524030,
        size.width * 0.5630733,
        size.height * 0.03289474,
        size.width * 0.5000000,
        size.height * 0.03289474);
    path_1.moveTo(size.width * 0.5000000, 0);
    path_1.cubicTo(size.width * 0.7761424, 0, size.width,
        size.height * 0.2238576, size.width, size.height * 0.5000000);
    path_1.cubicTo(size.width, size.height * 0.7761424, size.width * 0.7761424,
        size.height, size.width * 0.5000000, size.height);
    path_1.cubicTo(size.width * 0.2238576, size.height, 0,
        size.height * 0.7761424, 0, size.height * 0.5000000);
    path_1.cubicTo(0, size.height * 0.2238576, size.width * 0.2238576, 0,
        size.width * 0.5000000, 0);
    path_1.close();
    return path_1;
  }
}

class Square {
  Path returnPath() {
    Size size =
        Size(global.device_size.width * 0.3, global.device_size.height * 0.6);
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.03571429, size.height * 0.03571429);
    path_1.lineTo(size.width * 0.03571429, size.height * 0.9642857);
    path_1.lineTo(size.width * 0.9642857, size.height * 0.9642857);
    path_1.lineTo(size.width * 0.9642857, size.height * 0.03571429);
    path_1.lineTo(size.width * 0.03571429, size.height * 0.03571429);
    path_1.moveTo(0, 0);
    path_1.lineTo(size.width, 0);
    path_1.lineTo(size.width, size.height);
    path_1.lineTo(0, size.height);
    path_1.lineTo(0, 0);
    path_1.close();
    return path_1;
  }
}

class Hexagon {
  Path returnPath() {
    Size size =
        Size(global.device_size.width * 0.3, global.device_size.height * 0.6);
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.2644253, size.height * 0.02890173);
    path_1.lineTo(size.width * 0.02887619, size.height * 0.5000000);
    path_1.lineTo(size.width * 0.2644253, size.height * 0.9710983);
    path_1.lineTo(size.width * 0.7355747, size.height * 0.9710983);
    path_1.lineTo(size.width * 0.9711238, size.height * 0.5000000);
    path_1.lineTo(size.width * 0.7355747, size.height * 0.02890173);
    path_1.lineTo(size.width * 0.2644253, size.height * 0.02890173);
    path_1.moveTo(size.width * 0.2500000, 0);
    path_1.lineTo(size.width * 0.7500000, 0);
    path_1.lineTo(size.width, size.height * 0.5000000);
    path_1.lineTo(size.width * 0.7500000, size.height);
    path_1.lineTo(size.width * 0.2500000, size.height);
    path_1.lineTo(0, size.height * 0.5000000);
    path_1.lineTo(size.width * 0.2500000, 0);
    path_1.close();
    return path_1;
  }
}

class Pentagon {
  Path returnPath() {
    Size size =
        Size(global.device_size.width * 0.3, global.device_size.height * 0.6);
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5000000, size.height * 0.03571791);
    path_1.lineTo(size.width * 0.03230017, size.height * 0.3930088);
    path_1.lineTo(size.width * 0.2109397, size.height * 0.9710983);
    path_1.lineTo(size.width * 0.7890603, size.height * 0.9710983);
    path_1.lineTo(size.width * 0.9676998, size.height * 0.3930088);
    path_1.lineTo(size.width * 0.5000000, size.height * 0.03571791);
    path_1.moveTo(size.width * 0.5000000, 0);
    path_1.lineTo(size.width, size.height * 0.3819659);
    path_1.lineTo(size.width * 0.8090170, size.height);
    path_1.lineTo(size.width * 0.1909830, size.height);
    path_1.lineTo(0, size.height * 0.3819659);
    path_1.lineTo(size.width * 0.5000000, 0);
    path_1.close();
    return path_1;
  }
}

class Heart {
  Path returnPath() {
    Size size =
        Size(global.device_size.width * 0.3, global.device_size.height * 0.6);
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4573319, size.height * 0.9617175);
    path_1.cubicTo(
        size.width * 0.4681862,
        size.height * 0.9540396,
        size.width * 0.4799569,
        size.height * 0.9458834,
        size.width * 0.4921983,
        size.height * 0.9374012);
    path_1.cubicTo(
        size.width * 0.5681032,
        size.height * 0.8848055,
        size.width * 0.6720584,
        size.height * 0.8127731,
        size.width * 0.7562449,
        size.height * 0.7183027);
    path_1.cubicTo(
        size.width * 0.7779415,
        size.height * 0.6939558,
        size.width * 0.7974349,
        size.height * 0.6690578,
        size.width * 0.8141840,
        size.height * 0.6442996);
    path_1.cubicTo(
        size.width * 0.8322774,
        size.height * 0.6175548,
        size.width * 0.8477371,
        size.height * 0.5901351,
        size.width * 0.8601341,
        size.height * 0.5628025);
    path_1.cubicTo(
        size.width * 0.8733389,
        size.height * 0.5336887,
        size.width * 0.8834724,
        size.height * 0.5037805,
        size.width * 0.8902533,
        size.height * 0.4739090);
    path_1.cubicTo(
        size.width * 0.8974501,
        size.height * 0.4422057,
        size.width * 0.9010990,
        size.height * 0.4095242,
        size.width * 0.9010990,
        size.height * 0.3767722);
    path_1.cubicTo(
        size.width * 0.9010990,
        size.height * 0.3384568,
        size.width * 0.8988924,
        size.height * 0.3028925,
        size.width * 0.8945403,
        size.height * 0.2710674);
    path_1.cubicTo(
        size.width * 0.8905014,
        size.height * 0.2415320,
        size.width * 0.8845117,
        size.height * 0.2144709,
        size.width * 0.8767380,
        size.height * 0.1906358);
    path_1.cubicTo(
        size.width * 0.8695909,
        size.height * 0.1687225,
        size.width * 0.8607360,
        size.height * 0.1489359,
        size.width * 0.8504192,
        size.height * 0.1318257);
    path_1.cubicTo(
        size.width * 0.8409086,
        size.height * 0.1160524,
        size.width * 0.8298475,
        size.height * 0.1020496,
        size.width * 0.8175431,
        size.height * 0.09020648);
    path_1.cubicTo(
        size.width * 0.8060770,
        size.height * 0.07916975,
        size.width * 0.7931419,
        size.height * 0.06963252,
        size.width * 0.7790970,
        size.height * 0.06186000);
    path_1.cubicTo(
        size.width * 0.7660250,
        size.height * 0.05462543,
        size.width * 0.7515601,
        size.height * 0.04868057,
        size.width * 0.7361042,
        size.height * 0.04418997);
    path_1.cubicTo(
        size.width * 0.7095367,
        size.height * 0.03647115,
        size.width * 0.6793491,
        size.height * 0.03271904,
        size.width * 0.6438164,
        size.height * 0.03271904);
    path_1.cubicTo(
        size.width * 0.6051979,
        size.height * 0.03271904,
        size.width * 0.5675837,
        size.height * 0.04626397,
        size.width * 0.5350402,
        size.height * 0.07188956);
    path_1.cubicTo(
        size.width * 0.5033463,
        size.height * 0.09684614,
        size.width * 0.4776530,
        size.height * 0.1321522,
        size.width * 0.4607379,
        size.height * 0.1739910);
    path_1.lineTo(size.width * 0.4375361, size.height * 0.2313801);
    path_1.lineTo(size.width * 0.4143341, size.height * 0.1739910);
    path_1.cubicTo(
        size.width * 0.3974190,
        size.height * 0.1321523,
        size.width * 0.3717255,
        size.height * 0.09684614,
        size.width * 0.3400315,
        size.height * 0.07188956);
    path_1.cubicTo(
        size.width * 0.3074878,
        size.height * 0.04626397,
        size.width * 0.2698739,
        size.height * 0.03271904,
        size.width * 0.2312559,
        size.height * 0.03271904);
    path_1.cubicTo(
        size.width * 0.1990752,
        size.height * 0.03271904,
        size.width * 0.1664617,
        size.height * 0.03827012,
        size.width * 0.1369412,
        size.height * 0.04877237);
    path_1.cubicTo(
        size.width * 0.1027324,
        size.height * 0.06094233,
        size.width * 0.07252544,
        size.height * 0.07954391,
        size.width * 0.04715946,
        size.height * 0.1040601);
    path_1.cubicTo(
        size.width * 0.01838673,
        size.height * 0.1318688,
        size.width * -0.004108653,
        size.height * 0.1674106,
        size.width * -0.01970174,
        size.height * 0.2096981);
    path_1.cubicTo(
        size.width * -0.03771471,
        size.height * 0.2585479,
        size.width * -0.04684811,
        size.height * 0.3172531,
        size.width * -0.04684811,
        size.height * 0.3841830);
    path_1.cubicTo(
        size.width * -0.04684811,
        size.height * 0.4101339,
        size.width * -0.04333220,
        size.height * 0.4365157,
        size.width * -0.03639791,
        size.height * 0.4625955);
    path_1.cubicTo(
        size.width * -0.02975710,
        size.height * 0.4875713,
        size.width * -0.01978135,
        size.height * 0.5130503,
        size.width * -0.006747613,
        size.height * 0.5383244);
    path_1.cubicTo(
        size.width * 0.005627803,
        size.height * 0.5623223,
        size.width * 0.02110653,
        size.height * 0.5868081,
        size.width * 0.03925850,
        size.height * 0.6111018);
    path_1.cubicTo(
        size.width * 0.05615997,
        size.height * 0.6337219,
        size.width * 0.07587432,
        size.height * 0.6568345,
        size.width * 0.09785407,
        size.height * 0.6797979);
    path_1.cubicTo(
        size.width * 0.1356708,
        size.height * 0.7193071,
        size.width * 0.1807297,
        size.height * 0.7591738,
        size.width * 0.2356054,
        size.height * 0.8016761);
    path_1.cubicTo(
        size.width * 0.2833089,
        size.height * 0.8386232,
        size.width * 0.3302294,
        size.height * 0.8712524,
        size.width * 0.3716265,
        size.height * 0.9000406);
    path_1.cubicTo(
        size.width * 0.4050131,
        size.height * 0.9232583,
        size.width * 0.4346600,
        size.height * 0.9438754,
        size.width * 0.4573319,
        size.height * 0.9617175);
    path_1.moveTo(size.width * 0.4564446, size.height * 1.000001);
    path_1.cubicTo(
        size.width * 0.3408258,
        size.height * 0.9013725,
        size.width * -0.07287486,
        size.height * 0.6881045,
        size.width * -0.07287486,
        size.height * 0.3841830);
    path_1.cubicTo(
        size.width * -0.07287486,
        size.height * 0.08026141,
        size.width * 0.1035372,
        size.height * -0.04698858,
        size.width * -0.03123211,
        size.height * 0.2907193);
    path_1.cubicTo(size.width * -0.03737758, size.height * -0.03926290,
        size.width * 0, size.height * 0, size.width * 0, size.height * 0);
    path_1.cubicTo(
        size.width * 0.3213154,
        size.height * -0.04698858,
        size.width * -0.03123211,
        size.height * 0.5020317,
        size.width * 0.05147185,
        size.height * 0.5500408);
    path_1.cubicTo(size.width * 0.1266106, size.height * 0, size.width * 0,
        size.height * 0, size.width * 0, size.height * 0);
    path_1.cubicTo(
        size.width * 0.4757251,
        size.height * 0.06470695,
        size.width * 0.5537559,
        size.height * -0.04698858,
        size.width * -0.03123211,
        size.height * 0.8093627);
    path_1.cubicTo(size.width * -0.03737758, size.height * -0.03926290,
        size.width * 0, size.height * 0, size.width * 0, size.height * 0);
    path_1.cubicTo(
        size.width * 0.7715351,
        size.height * -0.04698858,
        size.width * -0.03123211,
        size.height * 1.165520,
        size.width * 0.03633913,
        size.height * 1.165520);
    path_1.cubicTo(size.width * 0.2997075, size.height * 0, size.width * 0,
        size.height * 0, size.width * 0, size.height * 0);
    path_1.cubicTo(
        size.width * 0.9271257,
        size.height * 0.7078612,
        size.width * 0.5923790,
        size.height * 0.9013391,
        size.width * 0.4564446,
        size.height * 1.000001);
    path_1.close();
    return path_1;
  }
}
