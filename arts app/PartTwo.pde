Films [] a;
String name [];
String genre [];
String studio [];
int audience [];
float profit [];
int critics [];
float wwg [];
int year [];
float x, y = 0;
int xaxis=1;
boolean genreCheck = false;
boolean yearCheck = false;
boolean studioCheck = false;
int pageNum = 0;

void setup() {
  size(1200, 800);
  settingUp();//sets array values to table values
}

void draw() {
 page();//decides which page the user is on
}

void settingUp() {//sets up sketch
  textAlign(CENTER);
  background(20, 0, 20);
  strokeWeight(2.5);
  Table film;
  film = loadTable("film.csv", "header");
  a = new Films[film.getRowCount()];
  name = new String [film.getRowCount()];
  genre = new String [film.getRowCount()];
  studio = new String [film.getRowCount()];
  audience = new int [film.getRowCount()];
  profit = new float [film.getRowCount()];
  critics = new int [film.getRowCount()];
  wwg = new float [film.getRowCount()];
  year = new int [film.getRowCount()];
  for (int i = 0; i < a.length; i++) {
    a[i] = new Films(film.getString(i, "Name"), film.getString(i, "Genre"), film.getString(i, "Lead Studio"), film.getInt(i, "Audience score %"), film.getFloat(i, "Profitability"), film.getInt(i, "Rotten Tomatoes %"), film.getFloat(i, "Worldwide Gross"), film.getInt(i, "Year"));
    name[i] = a[i].name;
    genre[i] = a[i].genre;
    studio[i] = a[i].studio;
    audience[i] = a[i].audience;
    profit[i] = a[i].profit;
    critics[i] = a[i].critics;
    wwg[i] = a[i].wwg;
    year[i] = a[i].year;
  }
}

void pageZero(){//instruction page
  fill(255);
  textSize(40);
  text("WELCOME,\n THIS IS HOW TO NAVIGATE \n CLICK NEXT TO SEE ALL THE GRAPHS\n RELATING TO THE DATA ON THE LAST PAGE " , width/2, 100);
  text("\n\n\n\n TO SEE THE DIFFERENT GENRE, STUDIO, AND YEAR OF EACH FILM\n CLICK THE CORRESPONDING TITLE IN THE LEFT CORNER OF THE GRAPH " , width/2, 100);
  text("\n\n\n\n\n\n TO SEE INFORMATION CORRESPONDING THE A SPECIFIC POINT\n ON THE GRAPH HOVER OVER THE POINT AND CLICK " , width/2, 100);
  text("\n\n\n\n\n\n\n\n THE TABLE IS ON THE LAST PAGE\nPLEASE ENJOY", width/2, 100);
}

void graphKey() {//displays buttons
  fill(255);
  textSize(25);
  text("Genre", 1100, 25);
  text("Year", 1100, 50);
  text("Studio", 1100, 75);
  stroke(0);
  rect(1150, 750, 50, 50);
  rect(1100, 750, 50, 50);
  fill(0);
  textSize(16);
  text("NEXT", 1175, 775);
  text("PREV", 1125, 775);
}

void page() { //opens corresponding page that user is on
  background(50, 0, 50);
    stroke(255);
  fill(255);
  graphKey();
  if (pageNum>4) {//ensures pageNum doesn't exceed 4 or preceed 0
    pageNum--;
  } else if (pageNum <0) {
    pageNum++;
  }
  //calls corresponding page the user is on
  if(pageNum==0){
    pageZero();
  }else if (pageNum == 1) {
    hover(1);
    pageOne();
  } else if (pageNum==2) {
    hover(2);
    pageTwo();
  } else if (pageNum==3) {
    hover(3);
    pageThree();
  } else if (pageNum==4) {
    background(50, 0, 50);
    pageFour();
  }
}

void pageOne() { //code for page one, graph showing audience and critics score
  fill(255);
  textSize(25);
  text("CRITICS AND AUDIENCE SCORE IN %", 300, 20);
  textSize(16);
  stroke(255);
  text("Critics Score", width/2, 780);
  text("Audience Score", width/2+160, 780);
  ellipse(width/2+100, 775, 10, 10);
  line(50, 10, 50, 750);
  line(50, 750, 1000, 750);
  for (int i = 0; i < 10; i++) {
    line(45, i*(750/10)+10, 55, i*(750/10)+10);
    text(i*-10+100, 25, i*(750/10)+15);
  }
  for (int i = 0; i < audience.length; i++) {
    stroke(255);
    line(i*(1000/31)+60, 760-(audience[i]*750/100), i*(1000/31)+60, 760-(critics[i]*750/100));
    x=i*(1000/31)+60;
    y=760-(audience[i]*750/100);
    yearClick(i, a[i].year);
    genre(i, a[i].genre);
    studio(i, a[i].studio);
    fill(0);
    x=i*(1000/31)+60;
    y=760-(critics[i]*750/100);
    genre(i, a[i].genre);
    studio(i, a[i].studio);
  }
  fill(0);
  ellipse(width/2-50, 775, 10, 10);
}

void pageTwo() {//code for page two, graph showing worldwide gross vs profitability
  textSize(25);
  text("WORLDWIDE GROSS VS PROFITABILITY", 300, 50);
  textSize(16);
  stroke(255);
  line(50, 10, 50, 750);
  line(50, 750, 1000, 750);
  for (int i = 0; i < 10; i++) {
    line(45, i*(740/6)+10, 1000, i*(740/6)+10);
    text((i*-100+600), 25, i*(740/6)+15);
  }
  for (int i = 0; i < 11; i++) {
    line(i*1000/11+50, 755, i*1000/11+50, 745);
    text(i, i*1000/11+50, 770);
  }
  for (int i = 0; i < wwg.length; i++) {
    x=(profit[i]*1000/11+50);
    y = 750-(wwg[i]*1.25);
    yearClick(i, a[i].year);
    genre(i, a[i].genre);
    studio(i, a[i].studio);
    if (wwg[i] > 600) {
      text("*"+name[i]+ "\n has a wwg of " + wwg[i]+ "\n therefore exceeding the graph"+ "\n and a profitability of " + profit[i]+"*", 900, 50);
    }
  }
}

void pageThree() {//code for page three, graph showing audience - critics score vs worldwide gross with size corresponding to profitability
  textSize(25);
  stroke(255);
  text("AUDIENCE - CRITICS SCORE VS WORLDWIDE GROSS", width/2+50, 20);
  text("SIZE OF CIRCLES = PROFITABILITY", width/2, 780);
  textSize(16);
  line(50, 10, 50, 750);
  for (int i = 0; i < 10; i++) {
    line(45, i*(750/10)+10, 55, i*(750/10)+10);
    text(i*-10+60, 25, i*(750/10)+15);
    if (i*-10+60 == 0) {
      xaxis = i*(750/10)+10;
      line(45, i*(750/10)+10, 1000, i*(750/10)+10);
      for (int j = 1; j < 7; j++) {//makes the xaxis of the graph
        line(j*(1000/7)+50, i*(750/10)+15, j*(1000/7)+50, i*(750/10)+5);
        text(j*100, j*(1000/7)+50, i*(750/10)+25);
      }
    }
  }
  for (int i = 0; i < wwg.length; i++) {
    x=(wwg[i]*1.45+50);
    if (audience[i]-critics[i] <= 0) {
      y = xaxis-((audience[i]-critics[i])*8);
    } else {
      y=xaxis-(audience[i]-critics[i])*8+11;
    }
    yearClick(i, a[i].year);
    genre(i, a[i].genre);
    studio(i, a[i].studio);
  }
}

void pageFour(){//code for page four, shwoing all the variables possible with all the data
  fill(255);
  for(int i = 0; i < name.length; i++){
    if(i == 0){
    textSize(18);
    text("NAME",width/8-50, i*(height/32)+25);
    text("GENRE", 2*width/8-50, i*(height/32)+25);
    text("STUDIO", 3*width/8-75, i*(height/32)+25);
    text("AUDIENCE", 4*width/8-100, i*(height/32)+25);
    text("CRITICS", 5*width/8-150, i*(height/32)+25);
    text("WWG", 6*width/8-150, i*(height/32)+25);
    text("PROFIT", 7*width/8-150, i*(height/32)+25);
    text("YEAR", 8*width/8-150, i*(height/32)+25);
    }
    textSize(16);
    text(name[i],width/8-50, i*(height/32)+50);
    text(genre[i], 2*width/8-50, i*(height/32)+50);
    fill(255);
    text(studio[i], 3*width/8-75, i*(height/32)+50);
    text(audience[i]+"%", 4*width/8-100, i*(height/32)+50);
    text(critics[i]+"%", 5*width/8-150, i*(height/32)+50);
    text(wwg[i], 6*width/8-150, i*(height/32)+50);
    text(profit[i], 7*width/8-150, i*(height/32)+50);
    text(year[i], 8*width/8-150, i*(height/32)+50);
}
  //makes prev and next button without seeing the genre, studio, and year buttons
  stroke(0);
  rect(1150, 750, 50, 50);
  rect(1100, 750, 50, 50);
  fill(0);
  textSize(16);
  text("NEXT", 1175, 775);
  text("PREV", 1125, 775);
}

void hover(int graph) {//checks to see if the users mouse is hovering over a pointon the graph if it is shows the name
  textSize(20);
  fill(255);
  for (int i = 0; i < name.length; i++) {
    if (graph == 1) {
      if (mouseX > (i*(1000/31)+60)-8 && mouseX < (i*(1000/31)+60)+8 && mouseY >760-(audience[i]*750/100)-10&&mouseY <750-(audience[i]*750/100)+15) {
        text(a[i].name, x =(i*(1000/31)+60)-8, y = 760-(audience[i]*750/100)-8);
        printInfo(i, x, y);
      }
      if (mouseX > (i*(1000/31)+60)-8 && mouseX < (i*(1000/31)+60)+8 && mouseY >760-(critics[i]*750/100)-10&&mouseY<750-(critics[i]*750/100)+15) {
        text(a[i].name, x =(i*(1000/31)+60)-8, y = 760-(critics[i]*750/100)-8);
        printInfo(i, x, y);
      }
    } else if (graph == 2) {
      if (mouseX > (profit[i]*1000/11+50)-8 && mouseX < (profit[i]*1000/11+50)+8 && mouseY >750-(wwg[i]*1.25)-8&&mouseY <750-(wwg[i]*1.25)+8) {
        text(a[i].name, x =(profit[i]*1000/11+50), y = 750-(wwg[i]*1.25)-10);
        printInfo(i, x, y);
      }
    } else if (graph == 3) {
      if (audience[i]-critics[i] <= 0 && mouseX>(wwg[i]*1.45+50)-((profit[i]*4+4)/2)&& mouseX<(wwg[i]*1.45+50)+((profit[i]*4+4)/2)&& mouseY>xaxis-((audience[i]-critics[i])*8)-((profit[i]*4+4)/2)&&mouseY<xaxis-((audience[i]-critics[i])*8)+((profit[i]*4+4)/2)) {
        text(a[i].name, x =(wwg[i]*1.45+50), y = xaxis-((audience[i]-critics[i])*8)-((profit[i]*4+4)/2)-10);
        printInfo(i, x, y);
      } else if (audience[i]-critics[i] >= 0 &&mouseX>(wwg[i]*1.45+50)-((profit[i]*4+4)/2)&& mouseX<(wwg[i]*1.45+50)+((profit[i]*4+4)/2)&& mouseY>xaxis-((audience[i]-critics[i])*8-11)-((profit[i]*4+4)/2)&&mouseY<xaxis-((audience[i]-critics[i])*8-11)+((profit[i]*4+4)/2)) {
        text(a[i].name, x =(wwg[i]*1.45+50), y = xaxis-((audience[i]-critics[i])*8-10)-(profit[i]*4+4)/2);
        printInfo(i, x, y);
      }
    }
  }
  fill(255);
}

void mousePressed() {//controls next/prev buttons and genre, year, and studio buttons
  if (mouseY<800&&mouseY>750) {//next/prev buttons
    if (mouseX<1200&&mouseX>1150) {
      pageNum++;
    } else if (mouseX<1150&&mouseX>1100) {
      pageNum--;
    }
  }
  if (mouseX>1065&&mouseX<1135&&mouseY<25 && mouseY>10&&genreCheck) {//genre button
    genreCheck = false;
  } else if (mouseX>1065&&mouseX<1135&&mouseY<25 && mouseY>10&&genreCheck==false) {
    genreCheck = true;
  }
  if (mouseX>1065&&mouseX<1135&&mouseY<50 && mouseY>35&&yearCheck) {//year button
    yearCheck = false;
  } else if (mouseX>1065&&mouseX<1135&&mouseY<50 && mouseY>35&&yearCheck==false) {
    yearCheck = true;
  }
  if (mouseX>1065&&mouseX<1135&&mouseY<75 && mouseY>60&&studioCheck) {//studio button\
    studioCheck = false;
  } else if (mouseX>1065&&mouseX<1135&&mouseY<75 && mouseY>60&&studioCheck==false) {
    studioCheck = true;
  }
}

void genre(int i, String genre) {//called in first three page methods to check if genre button is clikced
  if (genreCheck) {
    a[i].genreColor(genre);
    if (x==(wwg[i]*1.45+50)) {//changes size of ellipse in third graph/on third page
      ellipse(x, y, profit[i]*4+4, profit[i]*4+4);
    } else {
      ellipse(x, y, 15, 15);
    }
  } else if (genreCheck==false && y==760-(critics[i]*750/100)) {
    fill(0);
    ellipse(x, y, 15, 15);
  } else if (x==(wwg[i]*1.45+50)&&genreCheck==false) {
    fill(255);
    ellipse(x, y, profit[i]*4+4, profit[i]*4+4);
  }else {
    fill(255);
    ellipse(x, y, 15, 15);
  }
}

void yearClick(int i, int year) {//called in first three page methods to check if year button is clikced
  if (yearCheck) {
    a[i].yearColor(year);
  }else {
      noStroke();
    }
}

void studio(int i, String studio) {//called in first three page methods to check if studio button is clikced
  if (studioCheck) {
    a[i].studioText(studio, x, y);
  }
}

void printInfo(int i, float x, float y) {//is called only when the mouse is hovering over a point and if mouse is pressed is displays the info sheet
  if (mousePressed) {
    a[i].getInfo(x, y);
  }
}
