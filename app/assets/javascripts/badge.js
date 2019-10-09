// Returns the custom-formatted DOM node to represent a single Swimmer JSON row result in the dropdown
function formatSwimmerRow(item) {
  if (item.loading) {
    return item.text;
  }

  var $container = $(
    "<div class='select2-result-swimmer clearfix'>" +
      "<span class='select2-result-swimmer__name'></span>" +
      "&nbsp;-&nbsp;<span class='select2-result-swimmer__birthyear small'><i class='fa fa-birthday-cake'></i>&nbsp;</span>" +
      "&nbsp;-&nbsp;<span class='select2-result-swimmer__category small'><i class='fa fa-users'></i>&nbsp;</span>" +
    "</div>"
  );
  $container.find(".select2-result-swimmer__name").text(item.last_name + ' ' + item.first_name);
  $container.find(".select2-result-swimmer__birthyear").append(item.year_of_birth);
  $container.find(".select2-result-swimmer__category").append(item.category_code);

  return $container;
}
//------------------------------------------------------------------------------

// Returns the selection or the placeholder:
function formatSwimmerRowSelection(selection) {
  return selection.text;
}
//------------------------------------------------------------------------------


/*
 * Setup Select2 widgets:
 */
$(document).ready(function() {
  // $("#select2_season_id").select2({ theme: "bootstrap" });
  $(".swimmer-select").select2({
    theme: "bootstrap",
    ajax: {
      url: "/api/v1/swimmers/unbadged",
      dataType: 'json',
      delay: 200,
      data: function (params) {
        return {
          s: $('#season_id').val(), // filtering season ID (all except this one)
          q: params.term            // search term for complete name
        };
      },
      processResults: function (data, params) {
        // Parse the results into the format expected by Select2:
        return {
          results: $.map(data, function(item) {
            console.log(item);
            return {
              id: item.swimmer.id,
              text: item.swimmer.last_name + ' ' +
                    item.swimmer.first_name +
                    ' (' + item.swimmer.year_of_birth + ', ' +
                    item.category.code + ')',
              first_name: item.swimmer.first_name,
              last_name: item.swimmer.last_name,
              year_of_birth: item.swimmer.year_of_birth,
              season_id: item.season_id,
              category_code: item.category.code
            }
          })
        };
      },
      cache: true
    },
    placeholder: 'Search for a swimmer...',
    minimumInputLength: 2,
    selectOnClose: true,
    width: '50%',
    containerCssClass: 'swimmer-select-container',
    dropdownCssClass: 'swimmer-select-dropdown',
    templateResult: formatSwimmerRow,
    templateSelection: formatSwimmerRowSelection
  })
});
