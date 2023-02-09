// lilla morrow | Nov 1 2022 | Calulator
Button[] NButtons = new Button[10];
Button[] AButtons = new Button[12];
String dVal = "0";
float l, r, result;
char op = ' ';
boolean left = true;

void setup() {
  size(325, 550);
  NButtons[0] = new Button(125, 500, 60, 60, '0');
  NButtons[1] = new Button(50, 275, 60, 60, '1');
  NButtons[2] = new Button(125, 275, 60, 60, '2');
  NButtons[3] = new Button(200, 275, 60, 60, '3');
  NButtons[4] = new Button(50, 350, 60, 60, '4');
  NButtons[5] = new Button(125, 350, 60, 60, '5');
  NButtons[6] = new Button(200, 350, 60, 60, '6');
  NButtons[7] = new Button(50, 425, 60, 60, '7');
  NButtons[8] = new Button(125, 425, 60, 60, '8');
  NButtons[9] = new Button(200, 425, 60, 60, '9');

  AButtons[0] = new Button(200, 500, 60, 60, '=');
  AButtons[1] = new Button(50, 500, 60, 60, '.');
  AButtons[2] = new Button(30, 160, 45, 130, 'C');
  AButtons[3] = new Button(275, 275, 60, 60, '÷');
  AButtons[4] = new Button(295, 160, 45, 130, '±');
  AButtons[5] = new Button(275, 425, 60, 60, '-');
  AButtons[11] = new Button(275, 500, 60, 60, '+');
  AButtons[6] = new Button(275, 350, 60, 60, '×');
  AButtons[7] = new Button(50, 50, 60, 60, '³');
  AButtons[8] = new Button(125, 50, 60, 60, '²');
  AButtons[9] = new Button(200, 50, 60, 60, '√');
  AButtons[10] = new Button(275, 50, 60, 60, 'π');
}

void draw () {
  background(#D8ADD8);
  updateDisplay();
  for (int i=0; i<NButtons.length; i++) {
    NButtons[i].display();
    NButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<AButtons.length; i++) {
    AButtons[i].display();
    AButtons[i].hover(mouseX, mouseY);
  }
}

void keyPressed() {
  println("key:" + key);
  println("keyCode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 107 || keyCode == 61) {
    handleEvent("+", false);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 109 || keyCode == 45) {
    handleEvent("-", false);
  } else if (keyCode == 111 || keyCode == 47) {
    handleEvent("÷", false);
  } else if (keyCode == 106 || keyCode == 56) {
    handleEvent("×", false);
  }
}

void handleEvent(String val, boolean N) {
  if (N && dVal.length() < 17) {
    if (dVal.equals("0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0";
    l = 0.0;
    r = 0.0;
    result = 0.0;
    left= true;
    op = ' ';
  } else if (val.equals("+")) {
    op = '+';
    left = false;
    dVal = "0";
  } else if (val.equals("-")) {
    op = '-';
    left = false;
    dVal = "0";
  } else if (val.equals("÷")) {
    op = '÷';
    left = false;
    dVal = "0";
  } else if (val.equals("×")) {
    op = '×';
    left = false;
    dVal = "0";
  } else if (val.equals("±")) {
    if (left) {
      l = l*-1;
      dVal = str(l);
    } else {
      r =r*-1;
      dVal = str(r);
    }
  } else if (val.equals("√")) {
    result =  sqrt(l);
    performCalculation();
  } else if (val.equals("²")) {
    result =  l*l;
    performCalculation();
  } else if (val.equals("³")) {
    result =  l*l*l;
    performCalculation();
  } else if (val.equals("π")) {
    if (left) {
      l = PI;
      dVal = str(l);
    } else {
      r = PI;
      dVal = str(r);
    }
  } else if (val.equals(".")) {
    dVal += ".";
  }
}



void mouseReleased() {
  for (int i=0; i<NButtons.length; i++) {
    if (NButtons[i].on) {
      handleEvent(str(NButtons[i].val), true);
    }
  }

  for (int i=0; i<AButtons.length; i++) {
    if (AButtons[i].on && AButtons[i].val == 'C') {
      handleEvent("C", false);
    } else if (AButtons[i].on && AButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (AButtons[i].on && AButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (AButtons[i].on && AButtons[i].val == '÷') {
      handleEvent("÷", false);
    } else if (AButtons[i].on && AButtons[i].val == '×') {
      handleEvent("×", false);
    } else if (AButtons[i].on && AButtons[i].val == '=') {
      performCalculation();
    } else if (AButtons[i].on && AButtons[i].val == '±') {
      handleEvent("±", false);
    } else if (AButtons[i].on && AButtons[i].val == '√') {
      handleEvent("√", false);
    } else if (AButtons[i].on && AButtons[i].val == '²') {
      handleEvent("²", false);
    } else if (AButtons[i].on && AButtons[i].val == '³') {
      handleEvent("³", false);
    } else if (AButtons[i].on && AButtons[i].val == 'π') {
      handleEvent("π", false);
    } else if (AButtons[i].on && AButtons[i].val == '.') {
      handleEvent(".", false);
    }
    println("L:" + l + "Op:" + op + "R:" + r+ "Result:" + result + "Left:" + left);
  }
}

void updateDisplay() {
  fill(#F0C1FF);
  ellipse(width/2, 160, 200, 155);
  fill(0);
  textAlign(RIGHT);
  if (dVal.length() <9 ) {
    textSize(30);
  } else if (dVal.length() <13 ) {
    textSize(28);
  } else if (dVal.length() <14 ) {
    textSize(26);
  } else if (dVal.length() <15 ) {
    textSize(24);
  } else if (dVal.length() <16 ) {
    textSize(22);
  }
  text(dVal, width/2+85, 170);
}

void performCalculation() {
  if (op == '+') {
    result = l +r;
  } else if  (op == '-') {
    result = l - r;
  } else if  (op == '×') {
    result = l * r;
  } else if  (op == '÷') {
    result = l / r;
  }
  dVal = str(result);
  l = result;
  left = true;
}
