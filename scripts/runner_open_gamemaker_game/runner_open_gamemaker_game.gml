function runner_open_gamemaker_game() {
  // runner_open_gamemaker_game();
  // Opens a file browser to select a GameMaker game to run...
  // ONLY attempt to run ONE game at a time
  var fname = get_open_filename_ext("Game Files (*.win *.ios *.unx *.droid)|*.win;*.ios;*.unx;*.droid|" +
  "Games for Windows (*.win)|*.win|Games for macOS and iOS (*.ios)|*.ios|Games for Ubuntu (*.unx)|*.unx|" +
  "Games for Android (*.droid)|*.droid" + ((os_type == os_macosx) ? "" : "|All Files (" + ((os_type == os_windows) ? "*." : "") + 
  "*)|" + ((os_type == os_windows) ? "*." : "") + "*"), (os_type == os_windows) ? "data" : "game", working_directory, "Select a GameMaker Game...");
  if (fname != "") {
    runner_run_gamemaker_game(fname);
  } else {
    game_end();  
  }
}