window.addEventListener('message', function (event) {
    if (event.data.type === 'open') {
        // Show image and update the speed
        document.getElementById("speedLimitImage").style.display = "block";
        document.getElementById("speedLimitText").textContent = " " + event.data.speed;
    } else if (event.data.type === 'close') {
        // Hide image when leaving the zone
        document.getElementById("speedLimitImage").style.display = "none";
    }
});
