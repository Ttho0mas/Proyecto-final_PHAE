window.onload = function(){
    var password = document.querySelector('#password')
    var ver = document.getElementById('ver')

    ver.addEventListener('click', function(){
        if(password.type == 'password'){
            password.setAttribute('type', 'text')
        }else{
            password.setAttribute('type', 'password')
        }
    })
    

s
}