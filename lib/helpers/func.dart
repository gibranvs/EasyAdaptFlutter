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

  roundCI(double value) {
    var decval = value * 100;
    var retval = 0.00;
    if (decval > -500 && decval < -351) {
      retval = -3.50.toDouble();
    }
    if (decval > -350 && decval < -301) {
      retval = -3.00.toDouble();
    }
    if (decval > -300 && decval < -251) {
      retval = -2.75.toDouble();
    }
    if (decval > -250 && decval < -201) {
      retval = -2.25.toDouble();
    }
    if (decval > -200 && decval < -151) {
      retval = -1.75.toDouble();
    }
    if (decval > -150 && decval < -101) {
      retval = -1.25.toDouble();
    }
    if (decval > -100 && decval < -51) {
      retval = -0.75.toDouble();
    }

    return retval;
  }
}
