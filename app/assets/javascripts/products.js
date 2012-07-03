$(document).ready(function(){
  Search.init();
})

Search = {
  init: function() {
    $("#lookup_options").tokenInput("/products/list.json", {
      crossDomain: false,
      theme: "facebook",
      minChars: 1,
      tokenLimit: 1,
      searchDelay: 200,
      onAdd: function (item) {
        $("#search_form").submit();
      },
      preventDuplicates: true,
      hintText: "Enter name",
      noResultsText: "Not found!",
      searchingText: "Searching..."
    });
  }
}