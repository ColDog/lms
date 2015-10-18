// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function addText(id) {
    $(id).append(
        '<input name="learning_object[fields][][question]" type="text">' +
        '<input name="learning_object[fields][][answer]" type="text">' +
        '<input name="learning_object[fields][][type]" type="hidden" value="text-answer">'
    )
}
function addMarked(id) {
    $(id).append(
        '<input name="learning_object[fields][][question]" type="text">' +
        '<input name="learning_object[fields][][type]" type="hidden" value="text-marked">'
    )
}
function addMC() {
    $(id).append(
        '<input name="learning_object[fields][][question]" type="text" placeholder="question">' +
        '<input name="learning_object[fields][][option1]" type="text" placeholder="option">' +
        '<input name="learning_object[fields][][option2]" type="text" placeholder="option">' +
        '<input name="learning_object[fields][][option3]" type="text" placeholder="option">' +
        '<input name="learning_object[fields][][answer]" type="text" placeholder="answer">' +
        '<input name="learning_object[fields][][type]" type="hidden" value="mc">'
    )
}
function addNumber() {
    $(id).append(
        '<input name="learning_object[fields][][question]" type="text">' +
        '<input name="learning_object[fields][][answer]" type="number">' +
        '<input name="learning_object[fields][][type]" type="hidden" value="number">'
    )
}

