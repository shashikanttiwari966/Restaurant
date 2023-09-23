// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import 'bootstrap';
// import 'sweetalert2'
// import 'sweet-alert2-rails'

import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'
window.Swal = Swal;
Rails.start()
Turbolinks.start()
ActiveStorage.start()

$( document ).ready(function() {
  new SlimSelect({
    select: '#menu_item_detail_id',
  })

  window.addEventListener('popstate', function(event) {
    // if (event.state === null) {
      window.location.href = '/';
    // }
  });

  document.querySelector(".third").addEventListener('click', function(){
    Swal.fire({"showConfirmButton":true, "timer": 1000,"allowOutsideClick":false,"confirmButtonText":"Okay","type":"error","text":"Car Item deleted successfully!","title":"Deleted!", "icon":"success"})
    // Swal.fire("Deleted!", "Card Item deleted successfully!", "success", "Okay");
  });

});
