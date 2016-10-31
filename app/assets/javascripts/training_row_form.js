/*
 * === Custom Training Row Form client-side methods ===
 *
 * - app. ver.: 4.00.175
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
  $('.jspinner').spinner();                          // Init spinners (this is simple)
  initGroupHeadersVisibility();
// [Steve, 20140828] W.I.P. Temp. disable:
//  initAutocomplete();
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
//    console.log('processing row: ' + index);
    var groupId = Number( group_node.value );       // Get curr group ID
    if ( groupId > 0 ) {                            // Does this node belong to a group?
      var data_row_obj = data_rows.eq( index );     // Get the current data row object
      var full_row_obj = data_row_obj.closest('.group_detail').parent();
                                                    // Format data rows and groupings accordingly:
      // -- Add to existing group: ---
      if ( processedIds[String(groupId)] >= 0 ) {   // Already processed? Append it to the header row:
        var idxOfHeader = processedIds[ groupId ];  // Get the group header at the corresponding processed ID's stored index
        var group_hdr_obj = group_ids.eq( idxOfHeader ).closest('.group_hdr');
        var group_detail = group_hdr_obj.siblings('.group_detail').first();
                                                    // Make the "ungrouped row" controls disappear and show a filler instead
        data_row_obj.find('.ungrouped-row-controls').hide();
                                                    // Avoid sub-grouping for already grouped details: (the detail is the one of the source data row, not the destination)
        data_row_obj.closest('.group_detail').removeClass('droppable');
        full_row_obj.appendTo( group_detail );      // Append the source data row (full) to the destination detail
//        console.log('added to group data row #' + index);
      }
      // -- Create new group: --
      else {                                        // Not yet processed? (Not found in processable hash?)
        var group_id_obj = group_ids.eq( index );   // Get the group jQuery object (not the html node)
                                                    // Retrieve and show the header part showing the group widgets:
        var group_hdr_obj = group_id_obj.closest('.group_hdr');
        var group_detail = group_hdr_obj.siblings('.group_detail').first();
        group_hdr_obj.show();                       // Show the group header row
        full_row_obj.addClass('grouped');           // Add the flag-class to the Full row parent (not the group header)
                                                    // Make the "ungrouped row" controls disappear and show a filler instead
        data_row_obj.find('.ungrouped-row-controls').hide();
        processedIds[ groupId ] = index;            // Store the group id and its index in list to display just once the header and to add all other linked rows to itself (using the index)
//        console.log('processed group id: ' + groupId);
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
      // Get to the parent of the current row to find the select component:
      var dataRow = $(this).closest('.data_row');
      var trainingStepType = dataRow.find('.training_step_type');
// DEBUG
      console.log( 'trainingStepType:' );
      console.log( trainingStepType );
      var idSelected = trainingStepType.val();
// DEBUG
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
    opacity: 0.8,
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
      // Highlight each container:
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
  var fieldList = $('input.autosequence');
  fieldList.each( function(index, element) {
    element.value = index + 1;
  });
};



/* Creates a grouping showing the header of the destination row.

   Assumes:
   - source-dragged $item .hasClass('full_row')
   - targed droppable .hasClass('group_detail') (that is, item.parent)

   This must prevent additional sub-grouping action (by "demoting" a
   droppable to simple sortable).
*/
function makeGroup( $item ) {
    // Demote droppable: prevent the details of this dropped row to become
    // itself a droppable target for new sub-grouping:
    $item.find('> .group_detail').removeClass('droppable');
    var targetDroppable = $item.parent();
    var targetFullRow   = $item.parent().parent();
                                                    // Get group_id from current autosequence field:
    var part_order = targetFullRow.find('.autosequence').first();
    targetFullRow.find('.group_id').val( part_order.val() );
                                                    // set default value for times:
    targetFullRow.find('.group_times').val( 2 );
    targetDroppable.siblings('.group_hdr').show();  // Make sure only the parent group header is visible

    console.log( "[makeGroup]: targetDroppable: >> GROUPED!" );
    console.log( targetDroppable );

    // Add the grouped flag-class to prevent additional sub-grouping
    // by dragging this new group into another row:
    targetFullRow.addClass('grouped');
                                                    // Hide all individual rows control widgets:
    targetFullRow.find('.ungrouped-row-controls').hide();
}



/* Removes grouping from a source sortable (a sub-list of detail rows).

   Assumes: $item .hasClass('group_detail').
*/
function makeUngroup( $item ) {
    $item.siblings('.group_hdr').hide();

    console.log( "[makeUngroup]: $item.parent(): ** UNGROUPED!" );
    console.log( $item.parent() );

    $item.parent().removeClass('grouped');          // Remove the grouped flag-class, if present
    $item.find('.ungrouped-row-controls').show();   // Show the controls for the individual row
}



/* Promotes a group detail to new target droppable.

   Assumes $item .hasClass('full_row').
*/
function promoteToDroppable( $item ) {

    console.log( "[promoteToDroppable]: $item:" );
    console.log( $item );
/*
    console.log( "[promoteToDroppable]: $item.find('> .group_detail'):" );
    console.log( $item.find('> .group_detail') );
*/
                                                    // Promote a sub-group to become a root-level group:
    $item.find('> .group_detail').addClass('droppable');
    $item.find('.ungrouped-row-controls').show();   // Show the controls for the individual row
}



/*
 * Launched when the user clicks on the "delete group" button.
   Clears the group header from all the data_row(s) children of
   the clicked full row.

   Assumes: $item .hasClass('full_row').
*/
function clickBreakGrouping( $item ) {

    console.log( "[clickBreakGrouping]: $item:" );
    console.log( $item );

                                                    // Retrieve all field marked for clearing:
    $item.find('.group_clear').each( function(index, element) {
      $(element).val( 0 );                          // Clear each group header field to 0
    });
                                                    // Retrieve all child group details
    var grp_details = $item.find('.group_detail');
    grp_details.each( function(index, element) {    // Set visibility for each row in a group detail list
      makeUngroup( $(element) );
    });

    var sub_full_rows = $item.find('.full_row');    // Retrieve all contained full rows
    sub_full_rows.each( function(index, element) {  // Move each full row outside of the current full row $item:
      promoteToDroppable( $(element) );
      $(element).insertAfter( $item );
    });
}
// ----------------------------------------------------------------------------


// *************************
// TODO [Steve, 20140222] ADD setAuxVisibilityByAjaxData call on ui-autocomplete selection event
// *************************


/* Updates all the AUX-entity widget according to the allow/enable flags
 * contained in the data Object returned as Ajax result.
 *
 * Checkout the actual Rails exercises_controller.rb for the API
 * specifications and the (data) Object structure returned from that call.
 */
function setAuxVisibilityByAjaxData( textInputHTMLElem, ajaxResultData ) {
	if ( ajaxResultData.is_arm_aux_allowed ) {
		$( textInputHTMLElem ).closest('.data_row').find('.arm_aux_type').show();
	} else {
		$( textInputHTMLElem ).closest('.data_row').find('.arm_aux_type').hide();
	}

	if ( ajaxResultData.is_kick_aux_allowed ) {
		$( textInputHTMLElem ).closest('.data_row').find('.is_kick_aux_allowed').show();
	} else {
		$( textInputHTMLElem ).closest('.data_row').find('.is_kick_aux_allowed').hide();
	}

	if ( ajaxResultData.is_body_aux_allowed ) {
		$( textInputHTMLElem ).closest('.data_row').find('.is_body_aux_allowed').show();
	} else {
		$( textInputHTMLElem ).closest('.data_row').find('.is_body_aux_allowed').hide();
	}

	if ( ajaxResultData.is_breath_aux_allowed ) {
		$( textInputHTMLElem ).closest('.data_row').find('.is_breath_aux_allowed').show();
	} else {
		$( textInputHTMLElem ).closest('.data_row').find('.is_breath_aux_allowed').hide();
	}
}


/* Retrieve and set a single Exercise description via AJAX, using the path
 * specified by the global variable exerciseAutocompleteURL.
 *
 * Checkout the actual Rails exercises_controller.rb for the API
 * specifications and the (data) Object structure returned from that call.
 */
function getSingleExerciseDescByAjax( exerciseId, textInputHTMLElem ) {
  $.ajax(
    {
      url: exerciseAutocompleteURL, // This URL (using a single ID parameter) will return a single JSON object
      dataType: "json",
      data: { id: exerciseId }
    }
  ).done(
    function( data ) {
      textInputHTMLElem.value = data.label;
	  setAuxVisibilityByAjaxData( textInputHTMLElem, data );
    }
  );
};
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------


/*
 * Document OnReady, one-time initialization
 */
var readyFunct = function(obj) {
  setupWidgets();

// [Steve, 20140828] W.I.P. Temp. disable:
  // Set value for each exercise_desc, according to exercise_id
//  $('input.numeric.exercise_id[type=hidden]').each( function(index, elem) {
//    getSingleExerciseDescByAjax( elem.value, $('input.exercise-autocomplete').get(index) );
//  });

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
};
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------

// Bind the on-ready function to the "page-load" Turbolinks5 event:
// $(document).ready( readyFunct ); // Standard "ready" event; w/ TL5 we need just the one below:
$(document).on('turbolinks:load', readyFunct );
