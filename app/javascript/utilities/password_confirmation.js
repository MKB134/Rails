export class PasswordConfirmation {
  constructor(form) {
    this.form             = form
    this.password         = form.elements.user_password
    this.password_confirm = form.elements.user_password_confirm
    this.checkIcon        = document.querySelector('.confirmation .octicon-check')
    this.xIcon            = document.querySelector('.confirmation .octicon-x')
  }

  checkPasswords() {
  	if(this.password_confirm.value === this.password.value) {
  	  this.checkIcon.classList.remove('hide')
      this.xIcon.classList.add('hide')
  	} else {
  	  this.checkIcon.classList.add('hide')
  	  this.xIcon.classList.remove('hide')
  	}
  }

  setup() {
  	this.form.addEventListener('input', event => {
  	  if(this.password_confirm.value != '') this.checkPasswords()
  	})
  }
}
