var verclave  = document.getElementById('verpass');
var cajaclave = document.getElementById('claveacceso');

verclave.addEventListener("click", function (){
    if (cajaclave.type == "password") {
        cajaclave.type = "text"
        verclave.style.opacity = 0.8
    } else {
        cajaclave.type = "password"
        verclave.style.opacity = 0.2
    }
})