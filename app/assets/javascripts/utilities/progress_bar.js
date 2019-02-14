document.addEventListener('turbolinks:load', function () {
  var control = document.getElementById('progress-bar')

  if (control) {
    showCurrentProgress(control)
  }
})

function showCurrentProgress(control) {
  var progress = control.dataset.progress
  var value = control.getAttribute('aria-valuenow')
  value = progress
  control.style.width = progress + '%'
}