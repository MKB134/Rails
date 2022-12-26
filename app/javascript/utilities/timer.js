document.addEventListener('turbolinks:load', function () {
  var timeCounter = document.querySelector('.time-counter');


  if (timeCounter) {
    var timeLeft = timeCounter.dataset.timeLeft;

    setInterval(function () {
      timeLeft--;
      timeCounter.innerHTML = formatSeconds(timeLeft);

      if (timeLeft <= 0) {
        document.querySelector('.test-passage-form').submit();
        return;
      }
    }, 1000);
  }
});

function formatSeconds(sec_num) {
  var hours   = Math.floor(sec_num / 3600);
  var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
  var seconds = sec_num - (hours * 3600) - (minutes * 60);

  if (hours   < 10) {hours   = "0"+hours;}
  if (minutes < 10) {minutes = "0"+minutes;}
  if (seconds < 10) {seconds = "0"+seconds;}
  return hours+':'+minutes+':'+seconds;
}