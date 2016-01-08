# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('.dataTables-example').dataTable({

    "dom": 'T<"clear">lfrtip',
    height: 250,
    autowidth: true,
    "tableTools": {
        "sSwfPath": "../assets/dataTables/swf/copy_csv_xls_pdf.swf"
    }
});

