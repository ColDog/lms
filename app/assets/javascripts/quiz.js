function question(id, name, type, html) {
    var div_id = 'mc' + Math.random().toString(36).substring(7);
    $(id).append(
        '<div id="' + div_id + '">' +
        '<input name="learning_object[fields][][type]" type="hidden" value="' + type + '">' +
        '<fieldset>' +
        '<legend>' + name + '</legend>' +
        html +
        '<button class="btn btn-small" onclick="document.getElementById(\'' + div_id + '\').remove()">Remove</button>' +
        '</fieldset>' +
        '</div>'
    )
}

function addByType(type, id) {
    var types = {
        'long-answer': addLongText,
        'short-answer': addShortText,
        'mc': addMC,
        'number': addNumber
    }
    types[type](id)
}


function addLongText(id) {
    var html =
        '<textarea name="learning_object[fields][][question]" placeholder="question"></textarea>'

    question(id, 'Long Answer', 'long-answer', html)
}

function addShortText(id) {
    var html =
        '<input name="learning_object[fields][][question]" type="text" placeholder="question">' +
        '<input name="learning_object[fields][][answer]" type="text" placeholder="answer (if left blank then an instructor will mark it)">'

    question(id, 'Short Answer', 'short-answer', html)
}

function addMC(id) {
    var html =
        '<input name="learning_object[fields][][question]" type="text" placeholder="question">' +
        '<input name="learning_object[fields][][options]" type="text" placeholder="options (comma separated)">' +
        '<input name="learning_object[fields][][answer]" type="text" placeholder="answer">'

    question(id, 'Multiple Choice', 'mc', html)
}

function addNumber(id) {
    var html =
        '<input name="learning_object[fields][][question]" type="text" placeholder="question">' +
        '<input name="learning_object[fields][][answer]" type="number" placeholder="answer (if left blank then an instructor will mark it)">'

    question(id, 'Number Question', 'number', html)
}

