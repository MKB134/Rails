document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('#user_password_confirmation')
  if (control) { control.addEventListener('input', checkPasswordConfirmation) }
})

function checkPasswordConfirmation() {
  var passwordFieldValue = document.querySelector('#user_password').value
  var confirmationFieldValue = this.value

  var checkIcon = document.querySelector('.confirmation .octicon-check')
  var xIcon = document.querySelector('.confirmation .octicon-x')

  if (confirmationFieldValue.length > 0) {
    if (passwordFieldValue == confirmationFieldValue ) {
      checkIcon.classList.remove('hide')
      xIcon.classList.add('hide')
    }
    else {
      checkIcon.classList.add('hide')
      xIcon.classList.remove('hide')
    }
  }
  else {
    checkIcon.classList.add('hide')
    xIcon.classList.add('hide')
  }
}
