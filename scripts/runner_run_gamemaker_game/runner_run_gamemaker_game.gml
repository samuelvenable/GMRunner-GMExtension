function runner_run_gamemaker_game(argument0) {
  // runner_run_gamemaker_game(fname);
  // fname - the gamemaker game to run 
  // fname example: "data.win", "game.ios", "game.unx", "game.droid", etc
  // Runs a GameMaker game from the specified fname...
  // ONLY attempt to run ONE game at a time
  var fname = argument0;
  var contents, i = 0;
  contents[i] = directory_contents_first(game_save_id, "*.*", false, true);
  if (contents == "") {
    var prevcapt = widget_get_caption();
    widget_set_caption("Error - GameMaker Runner");
    show_error("Fatal: Can't Access Files! " + 
    "Make sure you have sufficient permissions before attempting this operation.", true);
    widget_set_caption(prevcapt);
    game_end();
    return;
  }
  do {
    i++; contents[i] = directory_contents_next();
  } until (contents[i] == "");
  directory_contents_close();
  for (var i = 0; i < array_length(contents); i++) {
    file_copy(contents[i], game_save_id + filename_name(contents[i]));
  }
  proc = ProcessExecuteAsync("\"" + ExecutableFromSelf() + "\" -game \"" + fname + "\"");
}