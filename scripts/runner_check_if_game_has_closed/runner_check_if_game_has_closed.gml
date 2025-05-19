function runner_check_if_game_has_closed() {
  // runner_check_if_game_has_closed()
  // returns true if the previously run game closed, otherwise false...
  var res = false;
  if (proc != 0 && (CompletionStatusFromExecutedProcess(proc) || !ProcIdExists(proc))) {
    show_debug_message(ExecutedProcessReadFromStandardOutput(proc));
    var prevcapt = widget_get_caption();
    widget_set_caption("Debug Output Preview" + ((os_type == os_macosx) ? "\n" : " - ") + 
    "Save the full log to file?");
    var button = show_message_cancelable(string_copy(ExecutedProcessReadFromStandardOutput(proc), 1, 2048));
    if (button == 1) {
      var fname = get_save_filename("Raw Text Documents (*.txt)|*.txt", "log.txt");
      if (fname == "") {
        game_end();
        exit;
      } else {
        var file = file_text_open_write(fname);
        if (file != -1) {
          file_text_write_string(file, ExecutedProcessReadFromStandardOutput(proc));
          file_text_close(file);
        }
      }
    }
    widget_set_caption(prevcapt);
    res = true;
  } else {
    res = false;
  }
  return res;
}