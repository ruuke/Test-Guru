document.addEventListener('turbolinks:load', function() {
    var timer = document.querySelector('.timer');
    if (timer) { countdown(timer) }
});

function countdown(timer) {
    var startTime = Date.now();
    var endTime = startTime + (timer.dataset.duration * 1000);
    var timeRemain = (endTime - startTime) / 1000;

    setInterval(function() {
        document.querySelector('.timer').textContent = 'Осталось ' + timeRemain + ' сек.';
        timeRemain -= 1;

        if (timeRemain < 0) {
            document.querySelector('.timer').textContent = 'Время вышло. Нажмите "Далее" чтобы посмотреть результат';
        }
    }, 1000)
}
