// Global variable (taken from a data attribute) to retrieve the maximum number of detail rows read by the controller.
// (instead of counting the actual HTML rows rendered -- which could be different, if any kind of pagination was used.)
var maxSeq = Number( $('#maxPartOrder').attr('data-value') );


/* Rebuild the auto-numbering sequence of the detail rows:
 */
function updateAutoSeq() {
  var fieldList = $('#sortable').first().find('input.autosequence');
  fieldList.each( function(index, element) {
    element.value = index + 1;
  });
};



/*
 * Drop target implementation. --- WIP ---
 */
function dropOnRow( event, ui ) {
  console.log( event );
  console.log( ui );
// WIP / TODO hide row controls
// TODO preserve group fields (the following will move just the data row)
// 
  var data_row_obj = ui.draggable.find('.training_data_row');
  data_row_obj.find('.ungrouped-row-controls').hide();
  data_row_obj.find('.ghost-row-controls').show();
  data_row_obj.appendTo( event.target.firstElementChild );
};



/* Set-up the form widgets for:
 *
 * - spinners
 * - group headers visibility & data row grouping
 * - autocomplete
 * - drop targets
 *
 * The autocomplete AJAX call will be using the path
 * specified by the global variable exerciseAutocompleteURL (see: views/trainings/_form.html.haml)
 */
function setupWidgets() {
  $('.spinner').spinner();                          // Init spinners (this is simple)
                                                    // -- GROUP SETUP BEGIN -- Init visibility for group rows:
  var group_ids = $('.group_id');                   // List of controls that store the group IDs
  var data_rows = $('.training_data_row');          // List of all training data rows (excluding the group widgets)
  var processedIds = {};                            // Hash containing { group_id: row_index }, to retrieve the correct index of a processed group_id
  group_ids.each( function( index, group_node ) {
// DEBUG
    console.log('processing row: ' + index);
    var groupId = Number( group_node.value );       // Get curr group ID 
    if ( groupId > 0 ) {                            // Does this node belong to a group?
      var data_row_obj = data_rows.eq( index );     // Get the current data row object

      if ( processedIds[String(groupId)] >= 0 ) {   // Already processed? Append it to the header row:
        var idxOfHeader = processedIds[ groupId ];  // Get the group header at the corresponding processed ID's stored index
        var group_hdr_obj = group_ids.eq( idxOfHeader ).closest('.training_group_header');
                                                    // Make the "ungrouped row" controls disappear and show a filler instead
        data_row_obj.find('.ungrouped-row-controls').hide();
        data_row_obj.find('.ghost-row-controls').show();
        data_row_obj.appendTo( group_hdr_obj );
        console.log('added to group data row #' + index);
      }
      else {                                        // Not yet processed? (Not found in processable hash?)
        var group_id_obj = group_ids.eq( index );   // Get the group jQuery object (not the html node)
                                                    // Retrieve and show the header part showing the group widgets:
        var group_row_obj = group_id_obj.closest('.training_group_header');
        group_row_obj.show();                       // Show the group header row
                                                    // Make the "ungrouped row" controls disappear and show a filler instead
        data_row_obj.find('.ungrouped-row-controls').hide();
        data_row_obj.find('.ghost-row-controls').show();
        data_row_obj.appendTo( group_row_obj );     // Add curr data row to the group header
        processedIds[ groupId ] = index;            // Store the group id and its index in list to display just once the header and to add all other linked rows to itself (using the index)
        console.log('processed group id: ' + groupId);
      }
    }
  });                                               // -- GROUP SETUP END -- 
                                                    // Init autocomplete combos:
  $( ".exercise-autocomplete" ).autocomplete({
    source: function( request, response ) {
      // Get to the parent of the current row to find the select component:
// FIXME use a better selector instead of this junk:
      var selectTrainingEl = this.element.parent().parent().parent().find('.training_step_type');
      var idSelected = selectTrainingEl.val();
// DEBUG:
      console.log( 'Selected: ID=' + idSelected );
      $.ajax(
        {
          url: exerciseAutocompleteURL,
          dataType: "json",
          data: {
            training_step_type_id: idSelected,
            query: request.term
// [Steve] Setting a limit may hide some results and prevent the user from scanning the whole list using the cursor keys
//            limit: 20
          }
        }
      ).done(
        function( data ) {
          response( data );
        }
      );
    },
    select: function( event, ui ) {
      this.value = ui.item.label;
// FIXME use a better selector instead of this junk:
      this.parentElement.firstElementChild.firstElementChild.value = ui.item.value;
// DEBUG:
//      console.log( ui );
      return false; // this will stop further event handlers
    },
    minLength: 1
  });
                                                    // Init drop targets:
/*
  $( ".nested-fields" ).draggable({
    revert: 'invalid',
    opacity: 0.75
  });
*/
                                                    // Init drop targets:
  $( ".drop-add-group" ).droppable({
// FIXME Make sure only ungrouped rows can be dropped into a group
//    accept: "li.goggles-sortable",
//    activeClass: "custom-state-active",
// TODO use a special class to show "unable to drop status"
    over: function( event, ui ) {
      console.log('over event');
//      dropOnRow( event, ui );
    },
    drop: function( event, ui ) {
      console.log('drop event');
      dropOnRow( event, ui );
    }
  });

  $( "#sortable" ).sortable({
    placeholder: "ui-state-highlight",
    appendTo: document.body,
    axis: "y",
    items: "> li",
    beforeStop: updateAutoSeq
  });

};



/* Retrieve and set a single Exercise description via AJAX, using the path
 * specified by the global variable exerciseAutocompleteURL.
 *
 * Checkout the actual Rails exercises_controller.rb for the API specifications.
 */
function prepareSingleExerciseDescByAjax( exerciseId, textInputHTMLElem ) {
  $.ajax(
    {
      url: exerciseAutocompleteURL, // This URL will return in this case a single JSON object
      dataType: "json",
      data: {
        exercise_id: exerciseId
      }
    }
  ).done(
    function( data ) {
      textInputHTMLElem.value = data.label;
    }
  );
};



/* Document OnReady: initialization
 */
$(document).ready( function(obj) {
  setupWidgets();

  // Set value for each exercise_desc, according to exercise_id
  $('input.numeric.exercise_id[type=hidden]').each( function(index, elem) {
    prepareSingleExerciseDescByAjax( elem.value, $('input.exercise-autocomplete').get(index) );
  });

  $('#training_rows').on( "cocoon:before-remove", function(e, training_row) {
      $(this).data('remove-timeout', 1000);
      training_row.fadeOut('slow');
    }
  ).on( "cocoon:after-insert", function(e, training_row_to_be_added) {
      updateAutoSeq();
      setupWidgets();
    }
  ).on( "cocoon:after-remove", function() {
      updateAutoSeq();
  });
} );
