to saveToPlaylist(playlistName)

  tell application "Safari" to tell document 1

    do JavaScript "
      document.querySelector('[aria-label=\"Save to\"]').click();
      var attempts = 0;
      var playlists = null;
      var checkExist = setInterval(function() {
        attempts += 1;
        playlists = document.getElementById(\"playlists\")
        if(playlists.className == \"style-scope ytd-add-to-playlist-renderer scrollable\") {
          var selectorString = \"#checkbox-label > yt-formatted-string[title|='" & playlistName & "']\";
          var checkButton = playlists.querySelector(selectorString);
          if (checkButton != null)
          {
            checkButton.click();
            clearInterval(checkExist);
          }
        }
        if (attempts > 20) {
          console.log(\"Not found: " & playlistName & "  \");
          clearInterval(checkExist);
      }
    },50);
    "
  end tell

end saveToPlaylist

saveToPlaylist("PLAYLIST_NAME")
