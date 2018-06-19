/**
 * === Remote downloader/crawler service helpers ===
 *
 * (c) FASAR Software 2017-2018
 */


/**
 * Starts the service at.serviceUrl, assuming that the specified service
 * downloads a result page located at startUrl.
 *
 * This also delegates the clean-up phase of the HTML source code directly to the
 * specified service.
 **/
function startPageDownloader( serviceUrl, tokenSetup, tokenStart, tokenStatus, startUrl ) {
  // DEBUG
  console.log( "Starting..." );
  // Start page retrieval via AJAX:
  $.ajax({
    url: serviceUrl + tokenStart,
    type:"POST",
    contentType:"application/json; charset=utf-8",
    dataType:"json",
    data: JSON.stringify({
      startUrls: [{ key: "START", value: startUrl }]
    })
  }).done(
    function( result ) {
      // DEBUG
      //console.log( "Start result:" );
      //console.log( result );
      checkDownloaderStatus( serviceUrl + tokenStatus );
    }
  ).fail(
    function( result ) {
      // DEBUG
      console.log( "Failed result:" );
      console.log( result );
    }
  );
}
// ----------------------------------------------------------------------------


/**
 * Polls via AJAX the downloader service to check if it has finished or
 * is still running.
 **/
function checkDownloaderStatus( serviceUrl ) {
  // Check service status:
  $.get({ url: serviceUrl }).done(
    function( result ) {
      var iRetries = 0;
      // DEBUG
      console.log( 'Results checked...' );
      //console.log( result );
      if ( result.status == "SUCCEEDED" ) {
        console.log( 'Results are ready!' );
        getDownloadedPage( result.resultsUrl );
      }
      else {
        if (iRetries < 10) {
          console.log( 'Not ready yet. Waiting 3 secs...' );
          iRetries++;
          setTimeout(function() { checkDownloaderStatus( serviceUrl ); }, 3000); // wait 3 seconds than call ajax request again
        }
        else {
          console.log( 'Max retries reached. Bailing out...' );
        }
      }
    }
  );
}
// ----------------------------------------------------------------------------


/**
 * Retrieves the downloader service results via AJAX at the specified results storage URL.
 **/
function getDownloadedPage( resultsUrl ) {
  // DEBUG
  console.log( 'Retrieving results...' );
  $.get({
    url: resultsUrl
  }).done(
    function( result ) {
      // DEBUG
      console.log( 'Results URL retrieved. Rendering downloaded data...' );
      //console.log( result );
      //console.log( result[0].pageFunctionResult );
      var newContents = result[0].pageFunctionResult
        .replace(
          /javascript\:bookmark\(\'(\d\d|classifica|statistiche)\'\)/g,
          "javascript:document.getElementById('$1').scrollIntoView();"
        );
      document.getElementById('downloaded_results').innerHTML = newContents;
    }
  );
}
// ----------------------------------------------------------------------------
