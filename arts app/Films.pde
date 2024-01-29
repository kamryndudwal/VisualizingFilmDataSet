class Films {
  String name;
  String genre;
  String studio;
  int audience;
  float profit;
  int critics;
  float wwg;
  int year;


  Films(String name, String genre, String studio, int audience, float profit, int critics, float wwg, int year) {
    this.name = name;
    this.genre = genre;
    this.studio = studio;
    this.audience = audience;
    this.profit = profit;
    this.critics = critics;
    this.wwg = wwg;
    this.year = year;
  }

  void getInfo(float x, float y) {//is call when getting the info for hover&mousePressed
    textSize(16);
    fill(255, 255, 0, 180);
    rect(x-48, y-120, 95, 105);
    fill(0);
    text(genre, x, y-15);
    text(studio, x, y-30);
    text("Audience "+audience+"%", x, y-45);
    text("Critics "+critics+"%", x, y-60);
    text("Profit "+profit+"$", x, y-75);
    text("WWG "+wwg+"$", x, y-90);
    text(year, x, y-105);
  }

  void genreColor(String genre) {//is called when changing color of genre on graph
    fill(255);
    text("Genre: Circle Color", 1100, 100);
    if (genre.equals("Animation")) {
      fill(204, 102, 0);
      text("Animation", 1100, 125);
    } else if (genre.equals("Comedy")) {
      fill(255, 255, 0);
      text("Comedy", 1100, 150);
    } else if (genre.equals("Drama")) {
      fill(0, 255, 0);
      text("Drama", 1100, 175);
    } else if (genre.equals("Romance")) {
      fill(255, 100, 100);
      text("Romance", 1100, 200);
    } 
  }

  void yearColor(int year) {//is called when changing outline color of year on graph
    if (year == 2007) {
      stroke(255);
      ellipse(1070, 245, 5, 5);
    } else if (year == 2008) {
      stroke(250, 150, 230);
      ellipse(1070, 270, 5, 5);
    } else if (year == 2009) {
      stroke(100);
      ellipse(1070, 295, 5, 5);
    } else if (year == 2010) {
      stroke(0, 200, 225);
      ellipse(1070, 320, 5, 5);
    } else if (year == 2011) {
      stroke(0);
      ellipse(1070, 345, 5, 5);
    }
    fill(255);
    text("Year: Outline Color", 1100, 225);
    text("2007", 1100, 250);
    text("2008", 1100, 275);
    text("2009", 1100, 300);
    text("2010", 1100, 325);
    text("2011", 1100, 350);
  }

  void studioText(String s, float x, float y) {//is called when stuudio is clicked on graph
    y+=5;
    fill(20, 20, 200);
    textSize(15);
    if (s.equals("Universal")) {
      text("UN", x, y);
    } else if (s.equals("Sony")) {
      text("SO", x, y);
    } else if (s.equals("Disney")) {
      text("D", x, y);
    } else if (s.equals("Warner Bros.")) {
      text("WB", x, y);
    } else if (s.equals("Fox")) {
      text("F", x, y);
    } else if (s.equals("Independent")) {
      text("IN", x, y);
    } else if (s.equals("Summit")) {
      text("SU", x, y);
    }
    fill(255);
    textSize(16);
    text("Studio", 1100, 375);
    text("UN: Universal", 1100, 400);
    text("So: Sony", 1100, 425);
    text("D: Disney", 1100, 450);
    text("WB: Warner Bros.", 1100, 475);
    text("F: Fox", 1100, 500);
    text("IN: Independent", 1100, 525);
    text("SU: Summit", 1100, 550);
  }
}
