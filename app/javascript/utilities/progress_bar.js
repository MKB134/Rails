document.addEventListener('turbolinks:load', function(){
  const progress_bar = document.querySelector(".progress-bar");

  if (progress_bar) {
    const questionNumber = progress_bar.dataset.questionNumber;
    const questionCount = progress_bar.dataset.questionCount;
    console.log(progress_bar)

    const progressPercent = (questionNumber / questionCount) * 100;
    progress_bar.style.width = progressPercent + "%"

  }
});
