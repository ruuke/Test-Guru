document.addEventListener('turbolinks:load', function() {
  var password = document.querySelector('#user_password')
  var confirmation = document.querySelector('#user_password_confirmation')
  if (password && confirmation) {
    password.addEventListener('keyup', passwordCheck)
    confirmation.addEventListener('keyup', passwordCheck)
  }
})

function passwordCheck() {

  var password = document.getElementById('user_password')
  var confirmation = document.getElementById('user_password_confirmation')

  if (password.value == '' || confirmation.value == '') {
  } else if (password.value == confirmation.value) {
    document.querySelector('.octicon-check').classList.remove('hide')
    document.querySelector('.octicon-x').classList.add('hide')
    password.classList.add('border-green')
    confirmation.classList.add('border-green')
    password.classList.remove('border-red')
    confirmation.classList.remove('border-red')
  } else {
    document.querySelector('.octicon-x').classList.remove('hide')
    document.querySelector('.octicon-check').classList.add('hide')
    password.classList.remove('border-green')
    confirmation.classList.remove('border-green')
    password.classList.add('border-red')
    confirmation.classList.add('border-red')
  }
}
