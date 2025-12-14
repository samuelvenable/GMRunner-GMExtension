globalvar proc; proc = 0;
global.string_split_list = ds_list_create();
widget_set_icon(working_directory + "icon.png");
var prevcapt = widget_get_caption();
widget_set_caption("Information - GameMaker Runner");
var button = show_message_cancelable(
"Select a GameMaker game.\n\nThe folder the game file is in will be copied to a temporary location, " +
"so please make sure nothing is in the game file's parent folder other than the files the game " +
"depends on to run. If you don't have the game files isolated inside their own folder, don't run it. " +
((os_type == os_macosx) ? ("\n\nGameMaker games can be found under [AppBundle].app -> Contents -> " +
"Resources. Right click the app bundle to view its Contents. Copy the Resources folder outside the game's " + 
"app bundle before selecting it; this allows selecting the game file.\n\nThis app requires the Full " +
"Disk Access permission. Please allow it under System Preferences -> Security and Privacy -> Full Disk " +
"Access -> \"+\" button -> select this app. This only has to be done once on your system once it is " +
"enabled. Otherwise, click Cancel."): ""));
widget_set_caption(prevcapt);
if (button == -1) { game_end(); } 
else { runner_open_gamemaker_game(); }