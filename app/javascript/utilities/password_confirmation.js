export class PasswordConfirmation {
  constructor(form) {
    this.form             = form
    this.password         = form.elements.user_password
    this.password_confirm = form.elements.user_password_confirm
    this.setup()
  }

  checkPasswords() {
    const checkIcon = document.querySelector('.confirmation .octicon-check')
    const xIcon = document.querySelector('.confirmation .octicon-x')

  	if(this.password_confirm.value === this.password.value) {
  	  checkIcon.classList.remove('hide')
      xIcon.classList.add('hide')
  	} else {
  	  checkIcon.classList.add('hide')
  	  xIcon.classList.remove('hide')
  	}
  }

  setup() {
  	this.form.addEventListener('input', event => {
  	  if(this.password_confirm.value != '') this.checkPasswords()
  	})
  }
}
