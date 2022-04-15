import 'dart:math' as Math;

class FuncCalculators {
  round25(double value) {
    var dec_part = value - value.floor();
    var dec_part_int = dec_part * 100;
    var decval = 0.toDouble();
    if (dec_part_int > -87 && dec_part_int < -100) {
      decval = -100.toDouble();
    }
    if (dec_part_int > -62 && dec_part_int < -87) {
      decval = -75.toDouble();
    }
    if (dec_part_int > -37 && dec_part_int < -62) {
      decval = -50.toDouble();
    }
    if (dec_part_int > -37 && dec_part_int < -12) {
      decval = -25.toDouble();
    }
    if (dec_part_int > -12 && dec_part_int < 12) {
      decval = 0.toDouble();
    }
    if (dec_part_int > 12 && dec_part_int < 37) {
      decval = 25.toDouble();
    }
    if (dec_part_int > 37 && dec_part_int < 62) {
      decval = 50.toDouble();
    }
    if (dec_part_int > 62 && dec_part_int < 87) {
      decval = 75.toDouble();
    }
    if (dec_part_int > 87 && dec_part_int < 100) {
      decval = 100.toDouble();
    }
    var retval = (value.toDouble().floor()).toDouble() + (decval / 100);
    return retval;
  }

  round50(double value) {
    var dec_part = value - value.floor();
    var dec_part_int = dec_part * 100;
    var decval = 0.toDouble();
    if (dec_part_int > -75 && dec_part_int < -100) {
      decval = -100.toDouble();
    }
    if (dec_part_int > -25 && dec_part_int < -75) {
      decval = -50.toDouble();
    }
    if (dec_part_int > -25 && dec_part_int < 25) {
      decval = 0.toDouble();
    }
    if (dec_part_int > 25 && dec_part_int < 75) {
      decval = 50.toDouble();
    }
    if (dec_part_int > 75 && dec_part_int < 100) {
      decval = 100.toDouble();
    }

    var retval = value.floor() + (decval / 100);
    return retval;
  }
}
