import { PasswordConfirmation } from 'utilities/password_confirmation.js'

document.addEventListener('turbolinks:load', function () {
  const reg_form = document.getElementById('user-registration')

  if (reg_form) {
    let form =  new PasswordConfirmation(reg_form)
    form.setup()
  }
})
