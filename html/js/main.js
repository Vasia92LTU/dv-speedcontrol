window.addEventListener('message', function (event) {
    if (event.data.type === 'open') {
        const speedLimitImage = document.getElementById("speedLimitImage");
        const speedLimitText = document.getElementById("speedLimitText");
        
        speedLimitImage.style.display = "flex";
        speedLimitImage.style.opacity = 0;
        setTimeout(() => {
            speedLimitImage.style.transition = "opacity 0.5s";
            speedLimitImage.style.opacity = 1;
        }, 50);

        speedLimitText.textContent = "" + event.data.speed + " km/h"; // Editable text based on the speed received from the server

        setTimeout(() => {
            speedLimitImage.style.transition = "opacity 0.5s";
            speedLimitImage.style.opacity = 0;

            setTimeout(() => {
                speedLimitImage.style.display = "none";
            }, 500); 
        }, 5000);
    } else if (event.data.type === 'close') {
        const speedLimitImage = document.getElementById("speedLimitImage");
        
        speedLimitImage.style.transition = "opacity 0.5s";
        speedLimitImage.style.opacity = 0;

        setTimeout(() => {
            speedLimitImage.style.display = "none";
        }, 500); 
    }
});

document.getElementById("speedLimitImage").style.display = "none";
