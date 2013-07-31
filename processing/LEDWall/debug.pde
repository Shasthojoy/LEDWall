// ALWAYS NEEDS A REWRITE

void drawDebug() {
  noStroke();
  if (!SHOW_WALL) { // show the buffer
    wall_image.copy(buffer.get(), 0, 0, buffer.width, buffer.height, 0, 0, COLUMNS*IMAGE_MULTI, ROWS*IMAGE_MULTI); 
    pushStyle();
    imageMode(CENTER);
    image(wall_image, width / 2, wall_image.height / 2);
    popStyle();
  }

  textSize(11);
  rectMode(CORNER);
  
  // globals tab
  fill(#450003);
  rect(0, DEBUG_WINDOW_START, TAB_START, DEBUG_WINDOW_START + WINDOW_YSIZE);
  
  // other tabs
  fill(#230003);
  rect(TAB_START, DEBUG_WINDOW_START, WINDOW_XSIZE - TAB_START, DEBUG_WINDOW_START + WINDOW_YSIZE);

  // fill text display background
  fill(#450003);
  rect(WINDOW_XSIZE - INFO_WINDOW_SIZE, DEBUG_WINDOW_START, INFO_WINDOW_SIZE, WINDOW_YSIZE);

  fill(cp5.getColor().getCaptionLabel());
  //text("Display Mode: " + DISPLAY_STR[DISPLAY_MODE], DEBUG_TEXT_X, DEBUG_WINDOW_START + 20);
  text("FPS: " + String.format("%.2f", frameRate), DEBUG_TEXT_X, DEBUG_WINDOW_START + 50);

  text("BASS: " + audio.bass.value, DEBUG_TEXT_X, DEBUG_WINDOW_START + 65); 
  text("MIDS: " + audio.mids.value, DEBUG_TEXT_X + 60, DEBUG_WINDOW_START + 65);
  text("TREB: " + audio.treb.value, DEBUG_TEXT_X + 120, DEBUG_WINDOW_START + 65);


  text("BPM: " + audio.BPM + "  count: " + audio.bpm_count + "  secs: " + audio.sec_count, DEBUG_TEXT_X, DEBUG_WINDOW_START + 80);

  text("dB: " + String.format("%.2f", audio.volume.dB), DEBUG_TEXT_X, DEBUG_WINDOW_START + 95);

  text("WATTS: " + String.format("%.2f", WALL_WATTS), DEBUG_TEXT_X, DEBUG_WINDOW_START + 125);
  text("Max: "   + String.format("%.2f", MAX_WATTS), DEBUG_TEXT_X + 100, DEBUG_WINDOW_START + 125);

  text("Clips speed: " + movies.speed, DEBUG_TEXT_X, DEBUG_WINDOW_START + 140);
  if (USE_KINECT) text("Users: " + userHash.size(), DEBUG_TEXT_X, DEBUG_WINDOW_START + 170);
  
  if (USE_KINECT) {
    if (kinect.users.length > 0) {
      User u = kinect.users[0];
      if ( u != null && u.isActive() ) {
        if ( u.onScreen() ) {
          text("x: " + String.format("%.2f", u.x), DEBUG_TEXT_X, DEBUG_WINDOW_START + 185);
          text("y: " + String.format("%.2f", u.y), DEBUG_TEXT_X + 60, DEBUG_WINDOW_START + 185);
          text("z: " + String.format("%.2f", u.z), DEBUG_TEXT_X + 120, DEBUG_WINDOW_START + 185);
        }
      }
    }
  }
  
  text("Send: " + SEND_TIME, DEBUG_TEXT_X, DEBUG_WINDOW_START + 200);
  text("Proc: " + PROC_TIME, DEBUG_TEXT_X + 60, DEBUG_WINDOW_START + 200);
  text("Total: " + TOTAL_TIME, DEBUG_TEXT_X + 120, DEBUG_WINDOW_START + 200);

  //fill(#212121);

  //rect(DEBUG_WINDOW_XSIZE - 205, DEBUG_WINDOW_START + 5, 200, 210);
  /*
  for (int i = 0; i < wall.teensyImages.length; i++) {
   pushMatrix();
   int y = DEBUG_WINDOW_START + 14 + (i * 16);
   
   String temp = "Teensy " + i;
   fill(255);
   text(temp, DEBUG_WINDOW_XSIZE - 90 - textWidth(temp) - 5, y + (i * 4) + 12);
   
   translate(DEBUG_WINDOW_XSIZE - 90, y + (i * 4));
   
   image(wall.teensyImages[i], 0, 0);
   popMatrix();
   } */
}

