/*
 * === Custom Training Row Form client-side methods ===
 * 
 * - app. ver.: 4.00.171
 * 
 * Handles autocomplete combos, sortable list, drag'n'drop + other utility
 * stuff for the edit/create form of Training / TrainingRow.
 */



// Global variable (taken from a data attribute) to retrieve the maximum number of detail rows read by the controller.
// (instead of counting the actual HTML rows rendered -- which could be different, if any kind of pagination was used.)
var maxSeq = Number( $('#maxPartOrder').attr('data-value') );

// Stores the (source) parent item of a dragged sortable:
var $initialDragParent = false;
// ----------------------------------------------------------------------------


/* Set-up the form widgets for:
 *
 * - spinners
 * - group headers visibility & data row grouping
 * - autocomplete
 * - sortables + droppables
 *
 * The autocomplete AJAX call will be using the path
 * specified by the global variable exerciseAutocompleteURL (see: views/trainings/_form.html.haml)
 */
function setupWidgets() {
  $('.spinner').spinner();                          // Init spinners (this is simple)
  initGroupHeadersVisibility();
  initAutocomplete();
  initDroppables( $('.droppable') );
  initSortables( $('.sortable') );
};
// ----------------------------------------------------------------------------



/*
 *  Initialize the training group header rows visibility for each detail row
 */
function initGroupHeadersVisibility() {
  var group_ids = $('.group_id');                   // List of controls that store the group IDs
  var data_rows = $('.data_row');                   // List of all training data rows (excluding the group widgets)
  var processedIds = {};                            // Hash containing { group_id: row_index }, to retrieve the correct index of a processed group_id
  group_ids.each( function( index, group_node ) {
// DEBUG
    console.log('processing row: ' + index);
    var groupId = Number( group_node.value );       // Get curr group ID 
    if ( groupId > 0 ) {                            // Does this node belong to a group?
      var data_row_obj = data_rows.eq( index );     // Get the current data row object

      if ( processedIds[String(groupId)] >= 0 ) {   // Already processed? Append it to the header row:
        var idxOfHeader = processedIds[ groupId ];  // Get the group header at the corresponding processed ID's stored index
        var group_hdr_obj = group_ids.eq( idxOfHeader ).closest('.group_hdr');
                                                    // Make the "ungrouped row" controls disappear and show a filler instead
        data_row_obj.find('.ungrouped-row-controls').hide();
// FIXME maybe a filler is needed
//        data_row_obj.find('.ghost-row-controls').show();
        data_row_obj.appendTo( group_hdr_obj );
                                                    // Avoid sub-grouping for already grouped details:
        data_row_obj.closest('.group_detail').removeClass('droppable');
        console.log('added to group data row #' + index);
      }
      else {                                        // Not yet processed? (Not found in processable hash?)
        var group_id_obj = group_ids.eq( index );   // Get the group jQuery object (not the html node)
                                                    // Retrieve and show the header part showing the group widgets:
        var group_row_obj = group_id_obj.closest('.group_hdr');
        group_row_obj.show();                       // Show the group header row
        group_row_obj.addClass('grouped');          // Add the flag-class
                                                    // Make the "ungrouped row" controls disappear and show a filler instead
        data_row_obj.find('.ungrouped-row-controls').hide();
// FIXME maybe a filler is needed
//        data_row_obj.find('.ghost-row-controls').show();
        data_row_obj.appendTo( group_row_obj );     // Add curr data row to the group header
        processedIds[ groupId ] = index;            // Store the group id and its index in list to display just once the header and to add all other linked rows to itself (using the index)
        console.log('processed group id: ' + groupId);
      }
    }
  });                                               // -- GROUP SETUP END -- 
};


/*
 * Initialize autocomplete combo widgets in each detail row
 */
function initAutocomplete() {
  $( ".exercise-autocomplete" ).autocomplete({
    source: function( request, response ) {
// DEBUG:
      console.log( request );
      // Get to the parent of the current row to find the select component:
// FIXME / TEST THIS: use a better selector instead of this junk:
// this.element.parent().parent().parent().find('.training_step_type');
      var dataRow = $(this).closest('.data_row');
      var trainingStepType = dataRow.find('.training_step_type');
      console.log( 'trainingStepType:' );
      console.log( trainingStepType );
      var idSelected = trainingStepType.val();
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
      console.log( 'ui.item:' );
      console.log( ui.item );
// FIXME use a better selector instead of this junk:
      this.parentElement.firstElementChild.firstElementChild.value = ui.item.value;
// DEBUG:
      console.log( ui );
      return false; // this will stop further event handlers
    },
    minLength: 1
  });
}
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------


/* Initialize all droppables.
*/
function initDroppables($element) {
  $($element).droppable({
    greedy: true
  });
}
// ----------------------------------------------------------------------------


/* Initialize all sortables.
*/
function initSortables( $element ) {
  $element.sortable({
    placeholder: "ui-state-highlight",
    items: '.full_row',
    connectWith: ".droppable",
    revert: true,
    start: function(ev, ui) {
      ui.placeholder.height( ui.item.height() + 5 );
/*
      console.log( '[START]: ui.item: ' );
      console.log( ui.item );
      console.log( '[START]: ui.item.parent(): ($initialDragParent)' );
      console.log( ui.item.parent() );
*/
      // Save the original container:
      $initialDragParent = ui.item.parent();
    },
    receive: function(ev, ui) {
/*
      console.log( "[RECEIVE]: ui.item:" );
      console.log( ui.item );
      console.log( '[RECEIVE]: ui.item.parent(): ' );
      console.log( ui.item.parent() );
*/
      // Cancel the event if the item dropped is already a grouped row:
      // (This prevents sub-grouping)
      if ( ui.item.hasClass('grouped') ) {
        alert('We cannot create nested groups!');
        $(ui.sender).sortable('cancel');
      }
    },
    beforeStop: updateAutoSeq,
    stop: function(event, ui) {
/*
      console.log( '[STOP]: ui.item: ' );
      console.log( ui.item );
      console.log( '[STOP]: ui.item.parent(): ' );
      console.log( ui.item.parent() );
      console.log( "[STOP]: ui.item.closest('.group_detail'): " );
      console.log( ui.item.closest('.group_detail') );
      console.log( "[STOP]: $initialDragParent: " );
      console.log( $initialDragParent );
*/
      // Hide/clear source group header if it doesn't have any more full_rows:
      if ( $initialDragParent.hasClass('group_detail') &&
          ($initialDragParent.children('.full_row').length == 0) ) {
          // TODO if header is user edited (not 1x), do not hide
          makeUngroup( $initialDragParent );
      }

      if ( ui.item.parent().hasClass('group_detail') ) {
          makeGroup( ui.item );
      }
      else {
          promoteToDroppable( ui.item );
      }
      // Update widget setup (and sortable bindings)
      // according to new class disposition:
      initDroppables( $('.droppable') );
      initSortables( $('.sortable') );
    }
  });
}
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------


/*
 * Rebuild the auto-numbering sequence of the detail rows:
 */
function updateAutoSeq() {
  var fieldList = $('#training_rows').first().find('input.autosequence');
  fieldList.each( function(index, element) {
    element.value = index + 1;
  });
};



/* Creates a grouping showing the header of the destination row.

   Assumes:
   - source-dragged $item .hasClass('full_row')
   - targed droppable .hasClass('group_detail') (that is, item.parent.parent)

   This must prevent additional sub-grouping action (by "demoting" a
   droppable to simple sortable).
*/
function makeGroup( $item ) {
    // Demote droppable: prevent the details of this dropped row to become
    // itself a droppable target for new sub-grouping:
    $item.find('> .group_detail').removeClass('droppable');
    // Make sure the parent group header is visible:
    $item.parent().siblings('.group_hdr').show();
/*
    console.log( "[makeGroup]: ui.item.parent().parent(): >> GROUPED!" );
    console.log( $item.parent().parent() );
*/
    // Add the grouped flag-class to prevent additional sub-grouping
    // by dragging this new group into another row:
    $item.parent().parent().addClass('grouped');
}



/* Removes grouping from a source sortable (a sub-list of detail rows).

   Assumes: $item .hasClass('group_detail').
*/
function makeUngroup( $item ) {
    $item.siblings('.group_hdr').hide();
/*
    console.log( "[makeUngroup]: $item.parent(): ** UNGROUPED!" );
    console.log( $item.parent() );
*/
    // Remove the grouped flag-class, if present:
    $item.parent().removeClass('grouped');
}



/* Promotes a group detail to new target droppable.

   Assumes $item .hasClass('full_row').
*/
function promoteToDroppable( $item ) {
/*
    console.log( "[promoteToDroppable]: $item:" );
    console.log( $item );
    console.log( "[promoteToDroppable]: $item.find('> .group_detail'):" );
    console.log( $item.find('> .group_detail') );
*/
    // Promote a sub-group to become a root-level group:
    $item.find('> .group_detail').addClass('droppable');
}
// ----------------------------------------------------------------------------


/* Retrieve and set a single Exercise description via AJAX, using the path
 * specified by the global variable exerciseAutocompleteURL.
 *
 * Checkout the actual Rails exercises_controller.rb for the API specifications.
 */
function getSingleExerciseDescByAjax( exerciseId, textInputHTMLElem ) {
  $.ajax(
    {
      url: exerciseAutocompleteURL, // This URL (using a single ID parameter) will return a single JSON object
      dataType: "json",
      data: { exercise_id: exerciseId }
    }
  ).done(
    function( data ) {
      textInputHTMLElem.value = data.label;
    }
  );
};
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------


/*
 * Document OnReady: one-time initialization
 */
$(document).ready( function(obj) {
  setupWidgets();

  // Set value for each exercise_desc, according to exercise_id
  $('input.numeric.exercise_id[type=hidden]').each( function(index, elem) {
    getSingleExerciseDescByAjax( elem.value, $('input.exercise-autocomplete').get(index) );
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
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
