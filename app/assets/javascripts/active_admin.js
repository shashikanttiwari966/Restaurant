//= require arctic_admin/base
//= require chartkick
//= require Chart.bundle

//dashborad filter 
$(document).ready(function() {
  $('#filter-button').click(function(event) {
    $('#datepicker-id').val($('#reportrange').find('span').text())
    event.preventDefault();
    var from = $('#from').val();
    var to = $('#to').val();
    if (from === "" || to === ""){
      $(".error").text("From date OR To date can't blank");
    }
    else if(from > to){
      $(".error").text("From date should be greater than To date");
    }
    else{
      $("form").submit();
    }
  });


// date range picker use in dashboard
$(function() {
    var start = moment().subtract(29, 'days');
    var end = moment();
    function cb(start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    }
    $('#reportrange').daterangepicker({
        startDate: start,
        endDate: end,
        ranges: {
           'Today': [moment(), moment()],
           'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
           'Last 7 Days': [moment().subtract(6, 'days'), moment()],
           'Last 30 Days': [moment().subtract(29, 'days'), moment()],
           'This Month': [moment().startOf('month'), moment().endOf('month')],
           'This Year': [moment().startOf('year'), moment().endOf('year')],
           'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
    }, cb);

    cb(start, end);
  });
});