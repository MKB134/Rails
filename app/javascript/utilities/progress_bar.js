document.addEventListener('turbolinks:load', function(){
  const progress_bar = document.querySelector(".progress-bar")

  if (progress_bar) {
    const question_number = progress_bar.dataset.question_number
    const question_count = progress_bar.dataset.question_count

    const progressPercent = (question_number / question_count) * 100

    progress_bar.style.width = progressPercent + "%"
    console.log(progress_bar)
  }
})
